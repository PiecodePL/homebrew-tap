class CodexAiCenter < Formula
  include Language::Python::Virtualenv

  desc "Managed AI Center profile for the stock Codex CLI"
  homepage "https://chat.piecode.pl/console/codex-onboarding"
  url "https://github.com/PiecodePL/homebrew-tap/releases/download/codex-ai-center-v0.1.5/codex_ai_center_client-0.1.5-py3-none-any.whl"
  version "0.1.5"
  sha256 "85943016c02d679857030b150df4981b4d509e635849291de8e3e6416b86ac5e"

  depends_on "python@3.14"

  resource "stock-codex" do
    on_arm do
      url "https://github.com/openai/codex/releases/download/rust-v0.147.0/codex-package-aarch64-apple-darwin.tar.gz"
      sha256 "17b2984eb22b607e3d0c25728252fc90f510e476bad39a6d9f45cdb1aa685432"
    end

    on_intel do
      url "https://github.com/openai/codex/releases/download/rust-v0.147.0/codex-package-x86_64-apple-darwin.tar.gz"
      sha256 "d91e59133daf923bc45d76e3da4af8ae9ef62a0231da18488da0cd573b6e9d63"
    end
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/61/cc/a381afa6efea9f496eff839d4a6a1aed3bfafc7b3ab4b0d1b243a12573dd/anyio-4.14.2.tar.gz"
    sha256 "cfa139f3ed1a23ee8f88a145ddb5ac7605b8bbfd8592baacd7ce3d8bb4313c7f"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a/certifi-2026.7.22.tar.gz"
    sha256 "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/9e/ef/008a1939e372c06329a3fce4279c02f328488f3526744906eeec3da7ad5f/cffi-2.1.1.tar.gz"
    sha256 "dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/0c/91/925c0ac74362172ae4516000fe877912e33b5983df735ff290c653de4913/cryptography-45.0.7-cp311-abi3-macosx_10_9_universal2.whl"
    sha256 "3be4f21c6245930688bd9e162829480de027f8bf962ede33d4f8ba7d67a00cee"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/httpcore-1.0.9.tar.gz"
    sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/cd/63/9496c57188a2ee585e0f1db071d75089a11e98aa86eb99d9d7618fc1edce/idna-3.18.tar.gz"
    sha256 "ffb385a7e039654cef1ab9ef32c6fafe283c0c0467bba1d9029738ce4a14a848"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6/pycparser-3.0.tar.gz"
    sha256 "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
  end

  def install
    venv = virtualenv_create(libexec, "python3.14")
    cryptography_wheel = buildpath/"cryptography-45.0.7-cp311-abi3-macosx_10_9_universal2.whl"
    cp resource("cryptography").cached_download, cryptography_wheel
    dependency_archives = resources.reject do |resource|
      ["cryptography", "stock-codex"].include?(resource.name)
    end.map(&:cached_download)
    venv.pip_install dependency_archives + [cryptography_wheel]
    client_wheel = buildpath/"codex_ai_center_client-0.1.5-py3-none-any.whl"
    cp cached_download, client_wheel
    venv.pip_install client_wheel
    bin.install_symlink libexec/"bin/codex-ai-center"
    bin.install_symlink libexec/"bin/ai-center-token"
    bin.install_symlink libexec/"bin/ai-center-codex-hook"
    unless (HOMEBREW_PREFIX/"bin/codex").exist?
      resource("stock-codex").stage do
        (libexec/"stock-codex").install Dir["*"]
      end
      bin.install_symlink (libexec/"stock-codex/bin/codex") => "codex-ai-center-stock"
    end
  end

  def caveats
    <<~EOS
      This formula uses an existing stock Codex CLI when available. It installs
      a private pinned fallback only when `codex` is missing. It never replaces
      the direct `codex` command or its existing local sessions.

      Authenticate the managed profile with:

        codex-ai-center login

      Direct OpenAI sessions remain available through the existing `codex` command.
    EOS
  end

  test do
    assert_equal "codex-ai-center 0.1.5\n", shell_output("#{bin}/codex-ai-center --version")
    stock_codex = (HOMEBREW_PREFIX/"bin/codex").exist? ? HOMEBREW_PREFIX/"bin/codex" : bin/"codex-ai-center-stock"
    assert_match(/^codex-cli 0\.147\.0\n$/, shell_output("#{stock_codex} --version"))
  end
end

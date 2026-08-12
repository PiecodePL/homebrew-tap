class CodexAiCenter < Formula
  include Language::Python::Virtualenv

  desc "Managed AI Center profile for the stock Codex CLI"
  homepage "https://chat.piecode.pl/console/codex-onboarding"
  url "https://github.com/PiecodePL/homebrew-tap/releases/download/codex-ai-center-v0.1.0/codex_ai_center_client-0.1.0-py3-none-any.whl"
  version "0.1.0"
  sha256 "fa1524e6e40ffaffb6550adcfd0321aa4938e4b7cf579ac44ab63bf02d2dd534"

  depends_on "python@3.14"

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
    url "https://files.pythonhosted.org/packages/a7/35/c495bffc2056f2dadb32434f1feedd79abde2a7f8363e1974afa9c33c7e2/cryptography-45.0.7.tar.gz"
    sha256 "4b1654dfc64ea479c242508eb8c724044f1e964a47d1d1cacc5132292d851971"
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
    venv.pip_install resources
    venv.pip_install cached_download
    bin.install_symlink libexec/"bin/codex-ai-center"
    bin.install_symlink libexec/"bin/ai-center-token"
    bin.install_symlink libexec/"bin/ai-center-codex-hook"
  end

  def caveats
    <<~EOS
      This wrapper keeps the stock Codex CLI unchanged. Install Codex CLI 0.147.0
      separately, then authenticate this managed profile with:

        codex-ai-center login

      Direct OpenAI sessions remain available through the existing `codex` command.
    EOS
  end

  test do
    assert_equal "codex-ai-center 0.1.0\n", shell_output("#{bin}/codex-ai-center --version")
  end
end

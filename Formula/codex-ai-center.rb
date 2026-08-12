class CodexAiCenter < Formula
  include Language::Python::Virtualenv

  desc "Managed AI Center profile for the stock Codex CLI"
  homepage "https://chat.piecode.pl/console/codex-onboarding"
  url "https://github.com/PiecodePL/homebrew-tap/releases/download/codex-ai-center-v0.1.0/codex_ai_center_client-0.1.0-py3-none-any.whl"
  version "0.1.0"
  sha256 "fa1524e6e40ffaffb6550adcfd0321aa4938e4b7cf579ac44ab63bf02d2dd534"

  depends_on "python@3.14"

  def install
    venv = virtualenv_create(libexec, "python3.14")
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

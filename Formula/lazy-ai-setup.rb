class LazyAiSetup < Formula
  desc "Reversible LazyVim and AI-pane developer environment bootstrap"
  homepage "https://github.com/mateuszdargacz/lazy-ai-setup"
  url "https://github.com/PiecodePL/homebrew-tap/releases/download/lazy-ai-setup-v0.0.15/lazy-ai-setup-v0.0.15.tar.gz"
  sha256 "88589cd24ef873f89070961667bbb0a14c5de3d9506615992aef96bf1b9f901f"
  license "MIT"
  # Rendered release tag: v0.0.15

  depends_on "python@3.14"

  def install
    libexec.install Dir["*"]
    python = Formula["python@3.14"].opt_bin/"python3.14"

    (bin/"lazy-ai-setup").write <<~EOS
      #!/bin/bash
      export LAZY_AI_SETUP_REPO="#{libexec}"
      export LAZY_AI_SETUP_VERSION="v0.0.15"
      export PYTHON_BIN="#{python}"
      exec "#{libexec}/bootstrap.sh" "$@"
    EOS
    chmod 0755, bin/"lazy-ai-setup"

    (bin/"lazy-ai-dev").write <<~EOS
      #!/bin/bash
      export LAZY_AI_SETUP_REPO="#{libexec}"
      export LAZY_AI_SETUP_VERSION="v0.0.15"
      export PYTHON_BIN="#{python}"
      exec "#{libexec}/bin/dev" "$@"
    EOS
    chmod 0755, bin/"lazy-ai-dev"
  end

  test do
    home = testpath/"home"
    home.mkpath
    ENV["HOME"] = home.to_s

    system "#{bin}/lazy-ai-setup", "--version"
    system "#{bin}/lazy-ai-dev", "--version"
    system "#{bin}/lazy-ai-setup", "--discover"
    system "#{bin}/lazy-ai-setup", "--profile", "minimal", "--dry-run", "--non-interactive", "--skip-packages"
    system "#{bin}/lazy-ai-dev", "config", "show", "--json"
    system "#{bin}/lazy-ai-dev", "ai", "providers", "--json"
  end
end

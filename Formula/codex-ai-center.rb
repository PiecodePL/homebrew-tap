class CodexAiCenter < Formula
  include Language::Python::Virtualenv

  desc "Managed AI Center profile for the stock Codex CLI"
  homepage "https://chat.piecode.pl/console/codex-onboarding"

  on_arm do
    url "https://github.com/PiecodePL/homebrew-tap/releases/download/codex-ai-center-v0.1.61/codex_ai_center_client-0.1.61-py3-none-any.whl"
    sha256 "6a15b802e406804088842ee6d3d1f0a4c0f2b6951b878bc7d1b80e1c296a3d58"
  end

  depends_on "python@3.14"

  on_intel do
    # Hold the previous artifact until Intel dependency/build acceptance passes.
    url "https://github.com/PiecodePL/homebrew-tap/releases/download/codex-ai-center-v0.1.36/codex_ai_center_client-0.1.36-py3-none-any.whl"
    sha256 "ca373bda27c53dae0cced6c3ae5edd756b98916587f62f90d9233a805c72aa6a"
    depends_on "pkgconf" => :build
    depends_on "rust" => :build
    depends_on "openssl@3"
  end

  resource "stock-codex" do
    on_arm do
      url "https://github.com/openai/codex/releases/download/rust-v0.159.3/codex-package-aarch64-apple-darwin.tar.gz"
      sha256 "fad57a5681cabcef21d322af5aec938975cfb711b5f25d4ce4907e6561616d07"
    end

    on_intel do
      url "https://github.com/openai/codex/releases/download/rust-v0.159.3/codex-package-x86_64-apple-darwin.tar.gz"
      sha256 "fe3096a62b5d8395dd25abf9fe79334cf13c1520b825d236cd2b41eb75a63201"
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
    on_arm do
      url "https://files.pythonhosted.org/packages/b3/a9/9db617d05d7367c1ad0ab00b3aa6e6f9281edd689b4ee9ea0e5a84e89c97/cffi-2.1.1-cp314-cp314-macosx_11_0_arm64.whl"
      sha256 "661c298b4821edebead0c91edd2b00374d67ad7c5a1f7a91d4442633b79d6a72"
    end

    on_intel do
      url "https://files.pythonhosted.org/packages/9e/ef/008a1939e372c06329a3fce4279c02f328488f3526744906eeec3da7ad5f/cffi-2.1.1.tar.gz"
      sha256 "dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be"
    end
  end

  resource "cryptography" do
    on_arm do
      url "https://files.pythonhosted.org/packages/c5/5c/59086b4aac5e879d38ddbcf74e4be7ade89cebc3eb199a55da998c3bb46a/cryptography-50.0.0-cp311-abi3-macosx_11_0_arm64.whl"
      sha256 "031e2d5dd4bb9caa3ca9c82e5a197fd8ae680232cee62603d1a813f3f07e3d03"
    end

    on_intel do
      url "https://files.pythonhosted.org/packages/de/41/6cbdcf9142d00fe82836fbb51e503e58088575cf7a0fe1dbff6695bf0840/cryptography-50.0.0.tar.gz"
      sha256 "eeac2acb5a20ed25e0ad6d1df9891a520b78b404266b6d11778f25d5d691a6c9"
    end
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

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/7d/fa/3944b40b07da9ce895c0e6303a5ab7d53da063554f534556b134a54d6093/packaging-26.3.tar.gz"
    sha256 "94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/21/f7/bc3a25c5ec26ce62ce487690becc2f3710bbc7b33338f005ad390db0b986/websockets-16.1.1.tar.gz"
    sha256 "db234eda965dcce15df96bb9709f587cd87d4d52aaf0e80e2f34ec04c7670c57"
  end

  def install
    venv = virtualenv_create(libexec, (formula_opt_bin("python@3.14")/"python3.14").to_s)
    dependency_archives = resources.reject do |resource|
      ["cryptography", "stock-codex"].include?(resource.name) ||
        (Hardware::CPU.arm? && resource.name == "cffi")
    end.map(&:cached_download)
    venv.pip_install dependency_archives
    if Hardware::CPU.arm?
      cffi_wheel = buildpath/"cffi-2.1.1-cp314-cp314-macosx_11_0_arm64.whl"
      cp resource("cffi").cached_download, cffi_wheel
      venv.pip_install cffi_wheel
      cryptography_wheel = buildpath/"cryptography-50.0.0-cp311-abi3-macosx_11_0_arm64.whl"
      cp resource("cryptography").cached_download, cryptography_wheel
      venv.pip_install cryptography_wheel
    else
      ENV["OPENSSL_DIR"] = formula_opt_prefix("openssl@3")
      resource("cryptography").stage { venv.pip_install Pathname.pwd }
    end
    client_wheel = buildpath/"codex_ai_center_client-#{version}-py3-none-any.whl"
    cp cached_download, client_wheel
    venv.pip_install client_wheel
    bin.install_symlink libexec/"bin/codex-ai-center"
    bin.install_symlink libexec/"bin/ai-center-token"
    bin.install_symlink libexec/"bin/ai-center-codex-hook"
    resource("stock-codex").stage do
      (libexec/"stock-codex").install Dir["*"]
    end
    (libexec/"bin").install_symlink (libexec/"stock-codex/bin/codex") => "codex-ai-center-stock"
    bin.install_symlink (libexec/"bin/codex-ai-center-stock")
  end

  def caveats
    <<~EOS
      The managed command uses its private, pinned Codex runtime. It never
      replaces the direct `codex` command or its existing local sessions.

      Authenticate the managed profile with:

        codex-ai-center login

      The separate `codex` command is not installed by this formula.
      Existing direct OpenAI sessions and commands are preserved.

      If an old ~/bin or ~/.local/bin launcher shadows Homebrew, migrate it once:

        #{opt_bin}/codex-ai-center repair-install

      This preserves a backup and links known legacy launchers to the stable
      Homebrew path. Custom scripts, sessions and credentials are not modified.

      On macOS 14 Homebrew builds python@3.14 from source, which can fail.
      With a working python@3.14 already installed, unpin it and run:

        brew install --ignore-dependencies piecodepl/tap/codex-ai-center
    EOS
  end

  test do
    assert_equal "codex-ai-center #{version}\n", shell_output("#{bin}/codex-ai-center --version")
    assert_equal "codex-cli 0.159.3\n", shell_output("#{bin}/codex-ai-center-stock --version")
    assert_path_exists libexec/"bin/codex-ai-center-stock"
    if version >= Version.new("0.1.37")
      require "json"
      runtime = JSON.parse(shell_output("#{bin}/codex-ai-center runtime --json"))
      assert_equal "ai-center.codex-client-runtime.v1", runtime.fetch("schema")
      assert_equal 1, runtime.fetch("service_protocol")
      assert_equal false, runtime.fetch("raw_credential_included")
      if version >= Version.new("0.1.39")
        assert_equal 1, runtime.fetch("remote_protocol")
        assert_match "attach", shell_output("#{bin}/codex-ai-center remote --help")
        assert_match "--host-state-root", shell_output("#{bin}/codex-ai-center remote attach --help")
      end
      if version >= Version.new("0.1.51")
        assert_match "--attach", shell_output("#{bin}/codex-ai-center remote start --help")
        assert_match "--host", shell_output("#{bin}/codex-ai-center remote list --help")
      end
      if version >= Version.new("0.1.52")
        assert_match "install", shell_output("#{bin}/codex-ai-center remote host --help")
      end
      if version >= Version.new("0.1.40")
        system libexec/"bin/python", "-I", "-c", <<~PYTHON
          from ai_center.runtime.codex_native_model import native_claude_descriptor
          model = native_claude_descriptor("claude-opus-5-5", "Opus")
          assert model["context_window"] == model["max_context_window"] == 200000
          assert model["auto_compact_token_limit"] == 160000
        PYTHON
      end
      if version >= Version.new("0.1.41")
        system libexec/"bin/python", "-I", "-c", <<~PYTHON
          import json, os, tempfile
          from pathlib import Path
          from ai_center.runtime.codex_transparent_lifecycle import CodexLifecycleReader, open_rollout
          def record(kind, **payload):
              return json.dumps({"type": kind, "payload": payload}) + "\\n"
          with tempfile.TemporaryDirectory() as root:
              path = Path(root) / "rollout-synthetic-child-thread.jsonl"
              path.write_text(record("session_meta", id="synthetic-child-thread", forked_from_id="synthetic-parent-thread")
                  + record("session_meta", id="synthetic-parent-thread")
                  + record("event_msg", type="task_started", turn_id="synthetic-parent-turn")
                  + record("event_msg", type="task_started", turn_id="synthetic-child-turn")
                  + record("event_msg", type="task_complete", turn_id="synthetic-child-turn"))
              fd = open_rollout(str(path), thread_id="synthetic-child-thread")
              try:
                  reader = CodexLifecycleReader(fd, thread_id="synthetic-child-thread", initial_turn_id="synthetic-child-turn")
                  reader.poll()
                  assert list(reader.pending) == ["synthetic-child-turn"]
                  assert reader.terminals == {"synthetic-child-turn": "completed"}
              finally:
                  os.close(fd)
        PYTHON
      end
      if version >= Version.new("0.1.42")
        system libexec/"bin/python", "-I", "-c", <<~PYTHON
          from ai_center.runtime.codex_native_model import (
              NATIVE_CLAUDE_LAUNCH_OVERRIDES, native_reasoning_preferences,
          )
          assert not any("reasoning" in value for value in NATIVE_CLAUDE_LAUNCH_OVERRIDES)
          assert native_reasoning_preferences({"effort": "high", "summary": "auto"}) == {
              "effort": "none", "summary": "none",
          }
          try:
              native_reasoning_preferences({"effort": "unknown"})
          except ValueError:
              pass
          else:
              raise AssertionError("unknown reasoning must be rejected")
        PYTHON
      end
      if version >= Version.new("0.1.43")
        system libexec/"bin/python", "-I", "-c", <<~PYTHON
          import json, subprocess, sys, tempfile, tomllib
          from pathlib import Path
          from ai_center.runtime import codex_transparent_client as client
          with tempfile.TemporaryDirectory() as root:
              helper = Path(root) / "delayed-helper"
              token = "synthetic-package-credential-only"
              helper.write_text(f"#!{sys.executable}\\nimport time\\ntime.sleep(6)\\nprint({token!r})\\n")
              helper.chmod(0o700)
              assert client.read_ai_center_helper_token(helper_path=helper) == token
              profile = tomllib.loads(client.render_managed_codex_profile(
                  base_url=client.CODEX_TRANSPARENT_DEFAULT_BASE_URL,
                  helper_path=helper, model_catalog_path=Path(root) / "models.json"))
              assert profile["model_providers"]["ai_center"]["auth"]["timeout_ms"] >= 15000
              hooks = client._managed_codex_hooks(hook_path=helper,
                  base_url=client.CODEX_TRANSPARENT_DEFAULT_BASE_URL,
                  codex_version=client.PACKAGED_CODEX_CLI_VERSION, allow_http_localhost=False)
              assert hooks["interrupt"].timeout_seconds == 3
              assert all(hook.timeout_seconds == 15 for name, hook in hooks.items() if name != "interrupt")
              def timed_out(command, **kwargs):
                  assert 0 < kwargs["timeout"] <= 5
                  raise subprocess.TimeoutExpired(command, 5, output=b"PRIVATE_STDOUT", stderr=b"PRIVATE_STDERR")
              try:
                  client.read_ai_center_keychain_token(security_binary=helper, run=timed_out)
              except client.CodexTransparentClientError as error:
                  assert error.code == "codex_transparent_keychain_timeout"
                  diagnostic = client._safe_error(error.code)
                  assert "PRIVATE_" not in diagnostic
                  assert json.loads(diagnostic)["timeout_ms"] == 5000
              else:
                  raise AssertionError("credential timeout must fail closed")
        PYTHON
      end
      if version >= Version.new("0.1.44")
        system libexec/"bin/python", "-I", "-c", <<~PYTHON
          import tempfile
          from pathlib import Path
          from ai_center.runtime.codex_transparent_client import CodexTransparentClientError
          from ai_center.runtime.codex_transparent_hook import CodexTransparentHookIdentity, watch_codex_task
          for code in ("codex_transparent_keychain_timeout", "codex_transparent_helper_token_timeout"):
              clock, calls = [0.0], []
              def sleep(seconds):
                  clock[0] += seconds
              def heartbeat(**correlation):
                  calls.append(correlation)
                  if len(calls) == 2:
                      raise CodexTransparentClientError(code)
                  if len(calls) == 4:
                      raise CodexTransparentClientError("codex_transparent_task_control_conflict")
                  return {"task_status": "running"}
              with tempfile.TemporaryDirectory() as root:
                  outcome = watch_codex_task(
                      CodexTransparentHookIdentity("synthetic-session", "synthetic-turn"),
                      heartbeat=heartbeat, sleep=sleep, monotonic=lambda: clock[0],
                      lock_root=Path(root), max_lifetime_seconds=120, retry_jitter_ratio=0)
              assert outcome == "terminal" and len(calls) == 4
              assert clock[0] == 61.0
        PYTHON
      end
      if version >= Version.new("0.1.45")
        system libexec/"bin/python", "-I", "-c", <<~PYTHON
          import os, sqlite3, tempfile
          from pathlib import Path
          from ai_center.runtime import codex_transparent_client as client
          thread = "01a1031d-60ce-7152-95c3-dd9d2bf2644c"
          foreign = "01a1031d-60ce-7152-95c3-dd9d2bf26451"
          with tempfile.TemporaryDirectory() as root:
              home, project = Path(root, "home"), Path(root, "project")
              home.mkdir(mode=0o700)
              project.mkdir()
              database = home / "state_5.sqlite"
              with sqlite3.connect(database) as connection:
                  connection.execute("CREATE TABLE threads (id TEXT PRIMARY KEY, model_provider TEXT, model TEXT, "
                                     "archived INTEGER, cwd TEXT, updated_at INTEGER)")
                  connection.executemany("INSERT INTO threads VALUES (?, ?, ?, ?, ?, ?)", [
                      (thread, "ai_center", "gpt-6-astra", 0, str(project.resolve()), 1),
                      (foreign, "openai", "gpt-6-astra", 0, str(project.resolve()), 2)])
              database.chmod(0o600)
              pinned = client._pin_codex_resume_last(home, ["resume", "--last", "--cd", str(project)])
              assert pinned == ["resume", thread, "--cd", str(project)], pinned
              assert client._saved_codex_resume_model(home, pinned) == "gpt-6-astra"
              unchanged = ["resume", "--last", "--all", "--cd", str(project)]
              assert client._pin_codex_resume_last(home, unchanged) == unchanged
        PYTHON
      end
      if version >= Version.new("0.1.49")
        system libexec/"bin/python", "-I", "-c", <<~PYTHON
          import subprocess, tempfile, tomllib
          from pathlib import Path
          from ai_center.runtime import codex_transparent_client as client
          with tempfile.TemporaryDirectory() as root:
              helper = Path(root) / "helper"
              helper.write_text("#!/bin/sh\\nexit 0\\n")
              helper.chmod(0o700)
              profile = tomllib.loads(client.render_managed_codex_profile(
                  base_url=client.CODEX_TRANSPARENT_DEFAULT_BASE_URL,
                  helper_path=helper, model_catalog_path=Path(root) / "models.json"))
              assert profile["model_providers"]["ai_center"]["auth"]["refresh_interval_ms"] == 0
              calls = []
              def stalled_once(command, **kwargs):
                  calls.append(kwargs["timeout"])
                  if len(calls) == 1:
                      raise subprocess.TimeoutExpired(command, kwargs["timeout"])
                  return subprocess.CompletedProcess(command, 0, b"synthetic-retry-credential\\n", b"")
              assert client.read_ai_center_keychain_token(security_binary=helper, run=stalled_once) == "synthetic-retry-credential"
              assert calls == [2.0, 2.0], calls
        PYTHON
      end
      if version >= Version.new("0.1.48")
        system libexec/"bin/python", "-I", "-c", <<~PYTHON
          from ai_center.runtime.codex_native_model import NATIVE_CLAUDE_CAPABILITY_OVERRIDES, native_claude_descriptor
          descriptor = native_claude_descriptor("claude-opus-5-5", "Claude")
          assert "spawn_agent" in descriptor["base_instructions"], descriptor["base_instructions"]
          assert descriptor["multi_agent_version"] == "v1"
          assert "features.multi_agent=true" in NATIVE_CLAUDE_CAPABILITY_OVERRIDES
        PYTHON
      end
      if version >= Version.new("0.1.46")
        system libexec/"bin/python", "-I", "-c", <<~PYTHON
          import tempfile
          from pathlib import Path
          from ai_center.runtime import codex_transparent_client as client
          with tempfile.TemporaryDirectory() as root:
              prefix = Path(root).resolve()
              helper = prefix / "Cellar/codex-ai-center/9.9.9/libexec/bin/ai-center-token"
              helper.parent.mkdir(parents=True)
              helper.write_text("")
              (prefix / "opt").mkdir()
              (prefix / "opt/codex-ai-center").symlink_to(prefix / "Cellar/codex-ai-center/9.9.9")
              stable = prefix / "opt/codex-ai-center/libexec/bin/ai-center-token"
              assert client._stable_homebrew_path(helper) == stable
              other = prefix / "Cellar/codex-ai-center/9.9.8/libexec/bin/ai-center-token"
              other.parent.mkdir(parents=True)
              other.write_text("")
              assert client._stable_homebrew_path(other) == other
        PYTHON
      end
      assert_match "--credential-env", shell_output("#{bin}/codex-ai-center service --help")
      ENV.delete("AI_CENTER_PACKAGE_TEST_MISSING_TOKEN")
      failure = JSON.parse(shell_output(
        "#{bin}/codex-ai-center service --workspace synthetic --project fixture " \
        "--credential-env AI_CENTER_PACKAGE_TEST_MISSING_TOKEN status 2>&1", 1
      ))
      assert_equal "codex_service_credential_unavailable", failure.fetch("safe_error_code")
      assert_equal false, failure.fetch("raw_credential_included")
    end
    ENV["CODEX_HOME"] = testpath/"offline-codex-home"
    assert_match "Resume a previous session", shell_output("#{bin}/codex-ai-center exec resume --help")
    assert_match "Resume a previous session", shell_output("#{bin}/codex-ai-center help exec resume")
    system formula_opt_bin("python@3.14")/"python3.14", "-m", "pip", "--python=#{libexec}/bin/python", "check"
    system libexec/"bin/python", "-c", <<~PYTHON
      from importlib.metadata import version
      from cffi import FFI
      from cryptography.fernet import Fernet
      assert FFI().sizeof("int") == 4
      assert version("cryptography").split(".")[0] == "50"
      cipher = Fernet(Fernet.generate_key())
      assert cipher.decrypt(cipher.encrypt(b"synthetic-package-test")) == b"synthetic-package-test"
    PYTHON
  end
end

# Piecode Homebrew tap

Versioned macOS packages for Piecode developer tools.

## Codex through AI Center

The managed wrapper is installed beside the unchanged stock Codex CLI:

```bash
brew install piecodepl/tap/codex-ai-center
codex-ai-center login
codex-ai-center doctor
```

Use `codex-ai-center` for AI Center and `codex` for the direct OpenAI profile.
Both commands use the same local `CODEX_HOME`, so local threads, skills, MCP,
plugins, sandbox settings and approvals remain available.

Version 0.1.29 retains stock Codex 0.159.3 and adds explicit optional local-model
selection when the AI Center administrator grants access and the runtime is
accepted. It does not replace the account's default model:

```bash
codex-ai-center --model qwen-local -C /path/to/project
codex-ai-center --model qwen-local resume --last
codex-ai-center --model company-default resume --last
```

Resume and fork require explicit model selection. Choosing `company-default`
for a local conversation can send its context to the approved subscription
route; the wrapper never makes that transition automatically. Provider
`ai_center` is explicit, without session database rewrites or cloud fallback.
Versioned Homebrew formulae for Piecode developer tools

## Service CLI Release Gate

This release stages 0.1.37 for Apple Silicon and the independently verified
Linux x86_64 distribution. It preserves the employee fixes in 0.1.36 and adds
service protocol 1. A prerelease asset is not permission to migrate application
traffic; use only the coordinated backend release and exact scope admission.

The Intel formula deliberately remains on the unchanged 0.1.36 artifact.
Current Homebrew has no macOS Intel bottles for Python 3.14 or Rust; its clean
installation starts substantial dependency source builds. The attempted Intel
campaign did not reach formula tests and is not accepted. Do not describe
Intel as service-ready. A separate explicit CI dispatch can test that held
platform; only a passing campaign may promote its version. Existing Intel
installations are not replaced by the 0.1.37 rollout.

The coordinated successor preserves all 0.1.36 employee fixes, includes
`codex_service_client` and `codex_service_relay`, advertise service protocol 1
through `codex-ai-center runtime --json`, and passes the native stock 0.159.3
tool/continuation/lifecycle tests. Formula tests enforce the new contract for
versions after 0.1.36. Update the immutable wheel URL, version and real SHA256
together only after publishing the accepted artifact. Linux application images
need their own accepted stock runtime artifact; Homebrew is the macOS client.

The backend service endpoint must also be deployed and explicitly enabled for
each application scope. Employee device login is not a service-account token.

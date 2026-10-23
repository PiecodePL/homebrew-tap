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

Resume preserves the saved model after fresh authorization. An explicit cloud
model switch is not allowed for a local-only conversation. Provider `ai_center`
is explicit, without session database rewrites or automatic cloud fallback.

## Unified Model Catalog

Version 0.1.38 retains stock Codex 0.159.3 and service protocol 1. Console and CLI
use one exact model allowlist and default. Native Claude models require the
owner's connected account, fresh catalog, active device-bound execution consent
and an available slot. Existing policies are not migrated by installing this
client; administrators must coordinate unified policy writes with client updates.

The release candidate was tested through production on Apple Silicon: Claude
read/edit/test, saved-model resume, both OpenAI/Claude transitions in the same
conversation, canonical usage and released slots, cancellation and revoked-consent
denial. A corrected launcher keeps Claude reasoning settings out of OpenAI
requests. There is no API fallback. Account-native usage can incur extra charges
when the account permits them; the client does not promise subscription-only billing.

Two-user Console acceptance and the stock interrupted-shutdown diagnostic remain
open. Publication does not close CCA-5 or authorize application fleet migration.
The Intel formula remains unchanged at 0.1.36. Linux service installations remain
on their separately accepted 0.1.37 distribution until verified independently.

## Service CLI Release Gate

Stable release 0.1.37 is available for Apple Silicon and the independently
verified Linux x86_64 distribution. It preserves the employee fixes in 0.1.36
and adds service protocol 1. Publication is not permission to migrate all
application traffic; use the coordinated backend release and exact scope
admission. The [PR39 handoff](https://github.com/PiecodePL/ai-center/pull/39#issuecomment-6305224369)
authorizes one read-only CRM canary, not fleet rollout.

The Intel formula deliberately remains on the unchanged 0.1.36 artifact.
Current Homebrew has no macOS Intel bottles for Python 3.14 or Rust; its clean
installation starts substantial dependency source builds. The attempted Intel
campaign did not reach formula tests and is not accepted. Do not describe
Intel as service-ready. A separate explicit CI dispatch can test that held
platform; only a passing campaign may promote its version. Existing Intel
installations are not replaced by the 0.1.37 rollout.

The coordinated release preserves all 0.1.36 employee fixes, includes
`codex_service_client` and `codex_service_relay`, advertises service protocol 1
through `codex-ai-center runtime --json`, and passes the native stock 0.159.3
tool/continuation/lifecycle tests. Formula tests enforce the new contract for
versions after 0.1.36. Update the immutable wheel URL, version and real SHA256
together only after publishing the accepted artifact. Linux application images
need their own accepted stock runtime artifact; Homebrew is the macOS client.

The backend service endpoint must also be deployed and explicitly enabled for
each application scope. Employee device login is not a service-account token.

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

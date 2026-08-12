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
Versioned Homebrew formulae for Piecode developer tools

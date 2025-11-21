# Claude Launcher

Simple bash script that wraps the Claude Code `--system-prompt` option. Start your claude session by choosing from available system prompts.

**Discovers system prompts from:**
- `~/.claude/system-prompts` (global)
- `<launcher-parent>/system-prompts` (project-local)

No symlinks needed. I have the command aliased as `cl`.

## Configuration

### Claude Code Binary Location

The launcher automatically detects your Claude Code binary in this order:

1. `$CLAUDE_CMD` environment variable (if set)
2. `which claude` (works for npm/nvm installations)
3. `~/.claude/local/claude` (local installation)

**For npm/nvm installations (recommended):**

Add to your `~/.zshrc` or `~/.bashrc`:

```bash
export CLAUDE_CMD="$(which claude)"
```

**For custom installation paths:**

```bash
export CLAUDE_CMD="/path/to/your/claude"
```

If the launcher can't find Claude Code, it will display a helpful error message with setup instructions.

```bash
➜  code: cl
Select a Claude Code system prompt:
1) claude-code-optimizer	5) super-tdd-developer
2) d3-guru			        6) tdd-developer
3) ddd-cs-architect		    7) webstorm-productivity-coach
4) ddd-refactoring-planner	8) Cancel

Enter number: 2

Selected: d3-guru
Launching Claude Code with d3-guru system prompt...
```

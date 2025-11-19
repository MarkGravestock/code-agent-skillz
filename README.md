# Claude Skills & Composable Personas

Reusable skills and composable system prompts for Claude Code.

## Skills

### Process Orchestration

- **tdd-process** - Complete TDD state machine with red-green-refactor cycle and 11 enforced rules
- **lightweight-task-workflow** - Task lists and session state for multi-session work

### Tasks

- **switch-persona** - Mid-conversation persona switching without restart
- **lightweight-implementation-analysis-protocol** - Forces code flow tracing before implementing to prevent guessing
- **lightweight-design-analysis** - Identifies refactoring opportunities across 8 design quality dimensions

### Knowledge

- **software-design-principles** - Object calisthenics, dependency inversion, fail-fast, type-driven design, intention-revealing naming

### Personality

- **critical-peer-personality** - Professional, skeptical communication style that coaches rather than serves

## System Prompts

- **super-tdd-developer** - TDD/DDD expert that auto-loads tdd-process, software-design-principles, and critical-peer-personality skills
- **claude-code-optimizer** - Workflow optimization specialist for improving Claude Code productivity
- **requirements-expert** - Requirements analysis specialist for breaking down features into specifications

## Tools

- **claude-launcher** - Interactive system prompt selector for session start

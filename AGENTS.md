# PENTeam Agent Knowledge Base
# Persistent memory for repository-specific context

## Project Overview

**PENTeam** is an agentic loop system for mathematical research. A multi-agent team of specialized AI agents collaborates to investigate mathematical problems autonomously with human oversight.

### Team Structure

| Agent | Role | Definition |
|-------|------|------------|
| Supervisor | Orchestrates workflow | `AI/supervisor.md` |
| Creative Mathematician | Formulates theorems | `AI/creative-mathematician.md` |
| Senior Mathematician | Reviews work | `AI/senior-mathematician.md` |
| Python Coder | Implements code | `AI/python-coder.md` |
| Tester | Validates implementations | `AI/tester.md` |

## Directory Structure

```
PENTeam/
├── AI/                    # Agent role definitions
├── input/                 # Project descriptions (submit here)
├── output/                # Investigation results
├── communication/         # Discussion threads
├── decisions/            # Owner approval items
├── docker/              # Docker configuration
├── .openhands/          # OpenHands runtime config
├── .agents/             # Agent skills and definitions
├── .mcp/                # MCP server configuration
└── .cursorrules         # Project conventions
```

## Workflow

### Project Submission
1. Place project description in `/input/`
2. Supervisor detects new project
3. Creates project structure in `/output/[project]/`
4. Initializes communication thread

### Investigation Pipeline
1. **Proposal** → Creative Mathematician formulates theorems
2. **Review** → Senior Mathematician validates
3. **Implementation** → Python Coder writes code
4. **Testing** → Tester validates
5. **Summary** → Supervisor compiles results

### Decision Escalation
- Decisions requiring Owner input → `/decisions/pending/`
- Owner approves/rejects → `/decisions/approved/` or `/decisions/rejected/`

## Skills Reference

Located in `.agents/skills/`:

| Skill | Purpose |
|-------|---------|
| `math-theorem.md` | Theorem formulation guidelines |
| `math-code.md` | Code implementation best practices |
| `math-testing.md` | Testing strategies |
| `math-review.md` | Critical review guidelines |
| `coordination.md` | Project management |

## Configuration Files

### `.openhands/config.toml`
Runtime configuration for OpenHands agent runtime.

### `.openhands/agents.toml`
Agent definitions and team coordination settings.

### `.openhands/skills.toml`
Skill-to-agent mappings and trigger keywords.

### `.mcp/config.json`
Model Context Protocol configuration for resource access.

### `.cursorrules`
Project conventions for AI coding assistants.

## Quick Reference

### Submit New Project
```bash
cp my-project.md input/
```

### Check Progress
```bash
ls communication/threads/
ls decisions/pending/
ls output/
```

### Docker Commands
```bash
cd docker && ./build.sh && ./run.sh
```

## Important Notes

- Supervisor is the entry point for all projects
- All theorems require Senior Mathematician review
- All code requires Tester validation
- Project Owner decisions are tracked separately
- Use type hints and docstrings in all Python code
- Include tests with every implementation
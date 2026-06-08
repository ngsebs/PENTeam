# PENTeam Agent Definitions
# Links agent roles to their AI definitions and skills

## Agent Registry

| Role | Definition File | Primary Skills | Tools |
|------|-----------------|----------------|-------|
| supervisor | `../AI/supervisor.md` | coordination | file_editor, terminal |
| creative-mathematician | `../AI/creative-mathematician.md` | math-theorem | file_editor |
| senior-mathematician | `../AI/senior-mathematician.md` | math-review | file_editor, terminal |
| python-coder | `../AI/python-coder.md` | math-code | file_editor, terminal |
| tester | `../AI/tester.md` | math-testing | file_editor, terminal |

## Skill References

- `skills/math-theorem.md` - Theorem formulation
- `skills/math-code.md` - Code implementation
- `skills/math-testing.md` - Testing strategies
- `skills/math-review.md` - Critical review
- `skills/coordination.md` - Project coordination

## Agent Workflow

```
1. Supervisor receives project from /input/
   ↓
2. Supervisor creates project structure in /output/
   ↓
3. Supervisor delegates to appropriate agent based on phase:
   ├─ Proposal: creative-mathematician (uses math-theorem skill)
   ├─ Review: senior-mathematician (uses math-review skill)
   ├─ Implementation: python-coder (uses math-code skill)
   └─ Testing: tester (uses math-testing skill)
   ↓
4. Supervisor tracks progress in /communication/
   ↓
5. Supervisor escalates decisions to /decisions/
   ↓
6. Supervisor compiles summary to /output/[project]/summary.md
```

## Configuration

See `.openhands/agents.toml` for detailed agent configurations.
See `.openhands/skills.toml` for skill-to-agent mappings.
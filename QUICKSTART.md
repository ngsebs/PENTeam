# PENTeam Quick Start Guide

## How to Submit a Project to the Math Research Team

### Step 1: Create Your Project Description

Create a markdown file in the `input/` directory with your mathematical problem:

```bash
# Example: Create a prime numbers investigation
cat > PENTeam/input/prime-investigation.md << 'EOF'
# Prime Numbers Investigation

**Project Title**: Prime Number Distribution Analysis

**Problem Statement**: 
Investigate the distribution patterns of prime numbers and explore
the validity of the Goldbach conjecture for even numbers up to 10000.

**Background/Context**:
Prime numbers are the building blocks of arithmetic. The Goldbach 
conjecture states that every even number greater than 2 is the sum 
of two primes - unproven but verified up to very large numbers.

**Goals/Objectives**:
- Implement efficient prime number generation algorithm
- Visualize prime distribution patterns
- Test Goldbach conjecture for numbers up to 10000
- Generate statistical analysis of prime gaps

**Scope**:
- Focus on computational verification rather than proofs
- Use Sieve of Eratosthenes for prime generation
- Generate plots and statistics in output

**Success Criteria**:
- Working prime generator that handles numbers up to 1,000,000
- Complete verification of Goldbach conjecture for even numbers ≤ 10000
- Statistical summary of prime distribution
- All tests passing

**Priority**: High
EOF
```

### Step 2: Start the Docker Container

```bash
cd PENTeam/docker

# Build the image (first time only)
./build.sh

# Start the container
./run.sh
```

### Step 3: Inside the Container

The Supervisor agent automatically monitors the `input/` directory:

```bash
# Once inside the container, check for new projects
ls /app/input/

# The Supervisor will:
# 1. Detect new files in /app/input/
# 2. Create project structure in /app/output/[project-name]/
# 3. Initialize communication thread
# 4. Begin investigation pipeline
```

### Step 4: Monitor Progress

```bash
# Check communication threads
ls /app/communication/threads/

# Check pending decisions (requires your approval)
ls /app/decisions/pending/

# View current work
ls /app/output/

# Check team progress
cat /app/communication/threads/[project]/progress.md
```

### Step 5: Make Decisions

When the team needs your input, you'll find decision files in `/app/decisions/pending/`:

```bash
# Review pending decisions
ls /app/decisions/pending/

# View the decision record
cat /app/decisions/pending/[project]/decision-001.md
```

**Decision Types:**

1. **Computationally Challenging Theorems**: When theorems are mathematically valid but computationally infeasible, you'll choose:
   - **A) Skip**: Don't implement these theorems
   - **B) Approximate**: Implement simplified versions
   - **C) Theoretical Reference**: Document without implementation (default)

2. **Next Steps Escalation**: When the summary contains proposed next steps:
   - **A) Continue**: Start a new investigation project with the next steps
   - **B) Document**: Save next steps for future consideration
   - **C) End**: Consider investigation complete as-is
   - Optional custom instructions can be added to guide the continuation

**To respond to a decision:**
```bash
# Interactive decision dialog (recommended)
/app/docker/decide.sh

# Or edit the decision file manually
cat /app/decisions/pending/[project]/decision-001.md
```
Edit the decision file and add your response:
```
**Project Owner Decision**: [A/B/C]
**Rationale**: [Your reasoning]
**Approved By**: [Your name]
**Custom Prompt**: [Optional instructions for continuation]
**Date**: 2024-01-15
```

The workflow will continue once you provide your decision.

## Project Lifecycle

```
┌─────────────────────────────────────────────────────────────────┐
│                     MATH INVESTIGATION PIPELINE                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌─────────────┐     ┌──────────────┐     ┌─────────────────┐   │
│  │  /app/input │────►│  Supervisor  │────►│  /app/output/   │   │
│  │  (Your file)│     │  (Detects &  │     │  (Investigation │   │
│  └─────────────┘     │   plans)     │     │   results)      │   │
│                      └──────┬───────┘     └─────────────────┘   │
│                             │                                   │
│         ┌───────────────────┼───────────────────┐                │
│         │                   │                   │                │
│         ▼                   ▼                   ▼                │
│  ┌──────────────┐  ┌────────────────┐  ┌──────────────────┐    │
│  │   Creative   │  │     Senior     │  │    Python        │    │
│  │  Mathematician│  │  Mathematician │  │    Coder         │    │
│  │  (Theorems)  │  │   (Reviews)    │  │  (Implements)    │    │
│  └──────┬───────┘  └───────┬────────┘  └──────────────────┘    │
│         │                  │                                   │
│         │     REJECT?      │                                   │
│         │   (loop 1-3)     │                                   │
│         │◄─────────────────┘                                   │
│         │                                                      │
│         │         APPROVED                                    │
│         │◄─────────────────────────────────────────────────────┤
│         │                                                      │
│         │    ┌────────────────────────────────────────────────┐ │
│         │    │ PROJECT OWNER DECISION                        │ │
│         │    │ (if mathematically sound but computationally │ │
│         │    │  challenging - requires your input)           │ │
│         │    └────────────────────────────────────────────────┘ │
│         │                                                      │
│         └─────────────────────────────────────────────────────►│
│                                                                  │
│         ┌────────────────────────────────────────────────────┐ │
│         │                 IMPLEMENTATION                      │ │
│         │  Creative Math → Senior Review → Owner Decision     │ │
│         │         → Python Coder → Tester → Summary          │ │
│         └────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────┘
```

## Directory Reference

| Directory | Purpose | Your Action |
|-----------|---------|-------------|
| `/app/input/` | Submit projects here | Add .md files |
| `/app/output/` | View results | Read summaries |
| `/app/communication/` | Team discussions | Monitor threads |
| `/app/decisions/pending/` | Needs your approval | Review and decide |
| `/app/decisions/approved/` | Approved decisions | View only |
| `/app/decisions/rejected/` | Rejected proposals | View only |

## Example Workflow

```bash
# 1. Submit a project
echo "# My Math Project" > /app/input/my-project.md

# 2. Supervisor detects it, creates output structure:
#    /app/output/my-project/
#    ├── summary.md
#    ├── theorems/
#    ├── implementation/
#    ├── tests/
#    └── review/

# 3. Team works through phases:
#    - Creative Mathematician: proposes theorems
#    - Senior Mathematician: reviews
#    - Python Coder: implements
#    - Tester: validates

# 4. You approve final results
```

## Tips

- **Be specific** in your project description
- **Set clear success criteria** - the team works toward measurable goals
- **Check decisions/pending** regularly for items needing your input
- **All results** appear in `/app/output/[project-name]/`

## Troubleshooting

### Debug Commands

```bash
# Run inside container (./run.sh interactive)
source /app/.venv/bin/activate

# Full system diagnostic
/app/docker/debug.sh

# View LLM debug log (detailed API tracing)
/app/communication/debug.log

# Check Ollama status
curl http://localhost:11434/api/tags

# View supervisor logs
cat /app/communication/supervisor.log

# Manual supervisor start
/app/docker/supervisor.sh start

# Team status dashboard
/app/docker/monitor.sh
```

### Common Issues

| Problem | Solution |
|---------|----------|
| `openhands: command not found` | Use `python -m openhands` or `/app/docker/openhands.sh` |
| Ollama connection refused | Ensure Ollama is running on host: `ollama serve` |
| Supervisor not starting | Check logs: `cat /app/communication/supervisor.log` |
| Import errors | Activate venv: `source /app/.venv/bin/activate` |
| Empty output files / LLM errors | Check debug log: `cat /app/communication/debug.log` |
| Invalid JSON / parse errors | Enable DEBUG_LOG to trace LLM interactions |

### Debug Logging

Debug logging is enabled by default (DEBUG_LOG=true) to help troubleshoot LLM issues.

**View debug log:**
```bash
cat /app/communication/debug.log
```

**What it shows:**
- LLM model and prompt details
- JSON encoding/escaping
- Raw responses from Ollama
- File write operations

**Disable if logs get too large:**
```bash
DEBUG_LOG=false docker-compose up
```

### Run Modes

```bash
./run.sh              # Start supervisor (monitors input/)
./run.sh interactive  # Bash shell
./run.sh monitor      # Status dashboard
./run.sh debug        # Supervisor with debug logging to /app/communication/debug.log
```
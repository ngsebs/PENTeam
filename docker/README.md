# Docker Setup for PENTeam Math Research Team

This directory contains Docker configuration for running the mathematical research team inside Docker containers on macOS, with Ollama running locally on the MacBook Pro M5 host.

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    MacBook Pro M5 Host                       │
│                                                             │
│   ┌─────────────────────────────────────────────────────┐   │
│   │              Ollama (Local Models)                   │   │
│   │                                                     │   │
│   │   • llama3.2:3b  (~2GB)                            │   │
│   │   • codellama:7b  (~4GB)                            │   │
│   │                                                     │   │
│   │   Listen: localhost:11434                           │   │
│   └─────────────────────────────────────────────────────┘   │
│                         │                                   │
│                         │ host.docker.internal:11434        │
│                         ▼                                   │
│   ┌─────────────────────────────────────────────────────┐   │
│   │              Docker Container                         │   │
│   │                                                     │   │
│   │   Python venv: /app/.venv                          │   │
│   │   Python: 3.11 (auto-activated)                    │   │
│   │                                                     │   │
│   │   • Supervisor Agent  → llama3.2:3b               │   │
│   │   • Creative Math     → llama3.2:3b               │   │
│   │   • Senior Math       → llama3.2:3b               │   │
│   │   • Python Coder      → codellama:7b               │   │
│   │   • Tester            → llama3.2:3b               │   │
│   │                                                     │   │
│   │   /app/input, /app/output, /app/communication     │   │
│   └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Quick Start (macOS)

### 1. Start Ollama on MacBook (Host)

```bash
# Install Ollama (if not installed)
brew install ollama

# Start Ollama service
ollama serve

# Pull recommended models (in another terminal)
ollama pull llama3.2:3b      # For mathematicians, supervisor, tester
ollama pull codellama:7b      # For Python coder

# Verify models are available
ollama list
```

### 2. Build and Run Docker Container

```bash
# Navigate to project
cd PENTeam

# Build Docker image
cd docker && ./build.sh

# Run container (connects to Ollama on host)
./run.sh
```

## Contents

| File | Description |
|------|-------------|
| `Dockerfile` | Container image with Python venv |
| `docker-compose.yml` | Multi-service orchestration |
| `build.sh` | Build the Docker image |
| `run.sh` | Start container with Ollama connectivity |
| `stop.sh` | Stop and remove container |
| `python-env.sh` | Python environment helper script |
| `README.md` | This documentation |

## Python Virtual Environment

The container includes a pre-configured Python virtual environment:

```bash
# Inside container, venv is auto-activated
python --version              # Python 3.11
pip list                      # Show installed packages

# Use python-env.sh helper
/app/python-env.sh activate   # Activate venv
/app/python-env.sh test       # Run tests
/app/python-env.sh install    # Install dependencies

# Manual activation
source /app/.venv/bin/activate
```

### Installed Packages

| Package | Purpose |
|---------|---------|
| openhands | Agent framework |
| httpx, aiohttp | HTTP clients |
| pytest | Testing framework |
| numpy, sympy, scipy | Mathematical libraries |
| black, flake8, mypy | Code quality tools |

## How Ollama Connectivity Works (macOS)

1. **Ollama runs on host**: `ollama serve` listens on `localhost:11434`
2. **Docker accesses host**: Container uses `host.docker.internal:11434`
3. **extra_hosts**: Docker Desktop on macOS provides this hostname automatically

### Connection Details

| Component | URL |
|-----------|-----|
| Ollama on Host | `http://localhost:11434` |
| Ollama from Container | `http://host.docker.internal:11434` |

The `run.sh` script automatically:
- Adds `host.docker.internal` to `/etc/hosts` in container
- Sets `OLLAMA_HOST=host.docker.internal:11434`
- Verifies Ollama connectivity on startup |

## Ollama Configuration (Local Models)

PENTeam supports local LLM inference via Ollama. Each agent can use a different model optimized for its task.

### Agent-Specific Models

| Agent | Default Model | Purpose | Size |
|-------|---------------|---------|------|
| Supervisor | `llama3.2:3b` | Coordination, planning | ~2GB |
| Creative Mathematician | `llama3.2:3b` | Theorem formulation | ~2GB |
| Senior Mathematician | `llama3.2:3b` | Critical review | ~2GB |
| Python Coder | `codellama:7b` | Code generation | ~4GB |
| Tester | `llama3.2:3b` | Validation, testing | ~2GB |

### Environment Variables

Set these in a `.env` file or export before running:

```bash
# Ollama Configuration
OLLAMA_HOST=host.docker.internal:11434
OLLAMA_BASE_URL=http://host.docker.internal:11434

# Agent-specific models (override defaults)
SUPERVISOR_MODEL=llama3.2:3b
CREATIVE_MATH_MODEL=llama3.2:3b
SENIOR_MATH_MODEL=llama3.2:3b
PYTHON_CODER_MODEL=codellama:7b
TESTER_MODEL=llama3.2:3b

# OpenAI Fallback (if Ollama unavailable)
LLM_API_KEY=your-api-key
LLM_MODEL=gpt-4
LLM_BASE_URL=https://api.openai.com/v1
```

### Alternative Ollama Models

You can customize models based on your hardware. Recommended alternatives:

```bash
# Lighter models (for systems with less RAM)
ollama pull llama3.2:1b      # ~1GB - faster inference
ollama pull mistral:7b       # ~4GB - good balance

# Code-specialized models
ollama pull codellama:13b    # ~7GB - better code quality
ollama pull deepseek-coder:6.7b  # ~4GB - excellent for code

# Reasoning models (for mathematical proofs)
ollama pull phi3:3.8b        # ~2GB - good reasoning
ollama pull mathstral:7b     # ~4GB - math-specialized
```

## OpenAI Fallback

If you prefer cloud-based models or don't have Ollama:

```bash
# .env file
export LLM_API_KEY="your-openai-api-key"
export LLM_MODEL="gpt-4"
export LLM_BASE_URL="https://api.openai.com/v1"

# Run without Ollama
./run.sh
```

## Directory Structure

The container mounts the following directories:

| Host Path | Container Path | Mode | Purpose |
|-----------|----------------|------|---------|
| `./AI` | `/app/AI` | read-only | Team agent configurations |
| `./input` | `/app/input` | read-write | Project descriptions for the team |
| `./output` | `/app/output` | read-write | Results from completed investigations |
| `./communication` | `/app/communication` | read-write | Discussion protocols and threads |
| `./decisions` | `/app/decisions` | read-write | Decisions requiring Project Owner approval |
| `./.openhands` | `/app/.openhands` | read-write | OpenHands runtime configuration |
| `./.agents` | `/app/.agents` | read-only | Agent skills and definitions |
| `./.mcp` | `/app/.mcp` | read-only | MCP server configuration |
| `./.cursorrules` | `/app/.cursorrules` | read-only | Project conventions |
| `~/.openhands` | `/root/.openhands` | read-write | OpenHands persistence |

### Input Directory (`/app/input/`)
Place new project descriptions here for the team to investigate. The Supervisor monitors this directory for new work.

### Output Directory (`/app/output/`)
Results are organized by project:
```
output/
├── [project-name]/
│   ├── summary.md
│   ├── theorems/
│   ├── implementation/
│   ├── tests/
│   └── review/
```

### Communication Directory (`/app/communication/`)
Maintains discussion protocols and threads between all team members:
```
communication/
├── threads/[project]/
├── protocol/[project]-protocol.md
└── owner-references/[project]-ref-*.md
```

### Decisions Directory (`/app/decisions/`)
Stores decisions requiring Project Owner involvement:
```
decisions/
├── pending/[project]/
├── approved/[project]/
└── rejected/[project]/
```

## Using Docker Compose

For a more declarative setup with all services:

```bash
cd docker
docker-compose up --build
```

Docker Compose automatically:
- Mounts all project directories
- Sets up Ollama connectivity
- Configures agent-specific models

## Troubleshooting (macOS)

### Ollama not accessible from container

```bash
# 1. Verify Ollama is running on host
ollama list

# 2. Test from macOS terminal
curl http://localhost:11434/api/tags

# 3. Check Docker Desktop is running
#    Menu Bar → Docker Desktop icon should be visible

# 4. Verify host.docker.internal resolution in container
docker run --rm alpine cat /etc/hosts | grep host.docker.internal
```

### Container network issues

```bash
# Do NOT use network_mode: host on macOS - it's Linux-only
# The default bridge network works correctly

# If you have issues, check Docker Desktop networking:
# Docker Desktop → Settings → Resources → Network
```

### Model download issues (on host)

```bash
# Check available models
ollama list

# Pull a specific model
ollama pull llama3.2:3b

# Test model locally on host
ollama run llama3.2:3b "Hello, how are you?"
```

### Container won't start

```bash
# Ensure Docker Desktop is running
# Check: docker info

# Remove old container if exists
docker rm -f pent-eam-math-team

# Check port conflicts
docker ps
```

### M5/M4 Mac Performance

Apple Silicon handles local inference efficiently:
- M5 Pro/Max: Use larger models (13B+)
- M5/M4 base: Use smaller models (3B-7B)
- All models run on CPU (Apple Silicon Neural Engine optional)
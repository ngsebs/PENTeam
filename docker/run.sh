#!/bin/bash
# Run the PENTeam mathematical research team in Docker
# Supports both Ollama (local models on macOS host) and OpenAI (cloud models)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Load environment variables if .env exists
if [ -f "$PROJECT_ROOT/.env" ]; then
    echo "Loading environment from $PROJECT_ROOT/.env"
    set -a
    source "$PROJECT_ROOT/.env"
    set +a
fi

# Create workdir if it doesn't exist (legacy support)
mkdir -p "$PROJECT_ROOT/workdir"

# Create hidden directories if they don't exist
mkdir -p "$PROJECT_ROOT/.openhands"
mkdir -p "$PROJECT_ROOT/.agents"
mkdir -p "$PROJECT_ROOT/.mcp"

echo "Starting PENTeam Math Research Team..."
echo "========================================"
echo ""
echo "Platform: macOS with Docker Desktop"
echo "Ollama Host: ${OLLAMA_HOST:-host.docker.internal:11434}"
echo ""

# Display model configuration
echo "Model Configuration:"
echo "  Supervisor:        ${SUPERVISOR_MODEL:-llama3.2:3b}"
echo "  Creative Math:     ${CREATIVE_MATH_MODEL:-llama3.2:3b}"
echo "  Senior Math:       ${SENIOR_MATH_MODEL:-llama3.2:3b}"
echo "  Python Coder:      ${PYTHON_CODER_MODEL:-codellama:7b}"
echo "  Tester:           ${TESTER_MODEL:-llama3.2:3b}"
echo ""

# Check Ollama availability on macOS host
OLLAMA_URL="http://${OLLAMA_HOST:-host.docker.internal:11434}/api/tags"
if curl -s --max-time 3 "$OLLAMA_URL" > /dev/null 2>&1; then
    echo "✓ Ollama is accessible at $OLLAMA_URL"
    echo "  Available models:"
    curl -s "$OLLAMA_URL" | jq -r '.models[] | "    - \(.name) (\(.size / 1024 / 1024 / 1024 | . * 1000 | floor / 1000)GB)"' 2>/dev/null || echo "    (run 'ollama list' on host to see models)"
else
    echo "⚠ Ollama not detected at $OLLAMA_URL"
    echo "  On macOS host, run:"
    echo "    1. ollama serve"
    echo "    2. ollama pull llama3.2:3b"
    echo "    3. ollama pull codellama:7b"
fi
echo ""

# Run the container
docker run \
    --rm \
    -it \
    --name pent-eam-math-team \
    --hostname pent-eam-math-team \
    -v "$PROJECT_ROOT/AI:/app/AI:ro" \
    -v "$PROJECT_ROOT/input:/app/input:rw" \
    -v "$PROJECT_ROOT/output:/app/output:rw" \
    -v "$PROJECT_ROOT/communication:/app/communication:rw" \
    -v "$PROJECT_ROOT/decisions:/app/decisions:rw" \
    -v "$PROJECT_ROOT/.openhands:/app/.openhands:rw" \
    -v "$PROJECT_ROOT/.agents:/app/.agents:ro" \
    -v "$PROJECT_ROOT/.mcp:/app/.mcp:ro" \
    -v "$PROJECT_ROOT/.cursorrules:/app/.cursorrules:ro" \
    -v "$PROJECT_ROOT/AGENTS.md:/app/AGENTS.md:ro" \
    -v ~/.openhands:/root/.openhands \
    -w /app \
    --add-host=host.docker.internal:host-gateway \
    -p 3000:3000 \
    ${SUPERVISOR_MODEL:+-e SUPERVISOR_MODEL="$SUPERVISOR_MODEL"} \
    ${CREATIVE_MATH_MODEL:+-e CREATIVE_MATH_MODEL="$CREATIVE_MATH_MODEL"} \
    ${SENIOR_MATH_MODEL:+-e SENIOR_MATH_MODEL="$SENIOR_MATH_MODEL"} \
    ${PYTHON_CODER_MODEL:+-e PYTHON_CODER_MODEL="$PYTHON_CODER_MODEL"} \
    ${TESTER_MODEL:+-e TESTER_MODEL="$TESTER_MODEL"} \
    ${OLLAMA_HOST:+-e OLLAMA_HOST="$OLLAMA_HOST"} \
    ${OLLAMA_BASE_URL:+-e OLLAMA_BASE_URL="$OLLAMA_BASE_URL"} \
    ${LLM_API_KEY:+-e LLM_API_KEY="$LLM_API_KEY"} \
    ${LLM_MODEL:+-e LLM_MODEL="$LLM_MODEL"} \
    ${LLM_BASE_URL:+-e LLM_BASE_URL="$LLM_BASE_URL"} \
    pent-eam-math-team:latest
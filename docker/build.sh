#!/bin/bash
# Build the Docker image for PENTeam mathematical research team

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "=========================================="
echo "  Building PENTeam Docker Image"
echo "=========================================="
echo ""

# Clean up old container if exists
if docker ps -a --format '{{.Names}}' | grep -q "^pent-eam-math-team$"; then
    echo "Removing old container..."
    docker rm -f pent-eam-math-team 2>/dev/null || true
fi

# Build the image
echo "Building image..."
docker build \
    -f "$SCRIPT_DIR/Dockerfile" \
    -t pent-eam-math-team:latest \
    "$PROJECT_ROOT"

echo ""
echo "=========================================="
echo "  Build complete!"
echo "=========================================="
echo ""
echo "Image: pent-eam-math-team:latest"
echo ""
echo "Next steps:"
echo "  1. Start Ollama on macOS host: ollama serve"
echo "  2. Run the container: ./run.sh"
echo ""
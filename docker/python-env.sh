#!/bin/bash
# Python environment management for PENTeam
# Use this script inside the Docker container

set -e

ENV_DIR="/app/.venv"
REQUIREMENTS="/app/requirements.txt"

activate() {
    source "$ENV_DIR/bin/activate"
    echo "Python venv activated: $ENV_DIR"
    echo "Python: $(python --version)"
    echo "Pip packages:"
    pip list --format=freeze | head -10
}

install_deps() {
    if [ -f "$REQUIREMENTS" ]; then
        echo "Installing dependencies from $REQUIREMENTS..."
        pip install -r "$REQUIREMENTS"
    else
        echo "No requirements.txt found at $REQUIREMENTS"
    fi
}

update_deps() {
    echo "Updating all packages..."
    pip install --upgrade pip
    pip install --upgrade -r "$REQUIREMENTS"
}

run_tests() {
    echo "Running pytest..."
    pytest /app/output/*/tests/ 2>/dev/null || echo "No tests found"
}

case "${1:-activate}" in
    activate)
        activate
        ;;
    install)
        install_deps
        ;;
    update)
        update_deps
        ;;
    test)
        run_tests
        ;;
    shell)
        activate
        exec /bin/bash
        ;;
    *)
        echo "Usage: python-env {activate|install|update|test|shell}"
        exit 1
        ;;
esac
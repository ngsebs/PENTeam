FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    jq \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Install Ollama CLI for model management
RUN curl -fsSL https://ollama.com/install.sh | sh

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir openhands uv httpx aiohttp

# Set Python path
ENV PYTHONPATH=/app

# Ollama configuration
ENV OLLAMA_HOST=host.docker.internal:11434
ENV OLLAMA_BASE_URL=http://host.docker.internal:11434

# Disable CUDA for CPU-only inference (default)
ENV OLLAMA_GPU_OVERRIDE=disabled

# Default command
CMD ["bash"]
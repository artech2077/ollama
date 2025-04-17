#!/bin/bash
set -e

# Start Ollama in the background on a temp port
OLLAMA_HOST=127.0.0.1:11155 ollama serve &

# Wait for Ollama to start
for i in {1..10}; do
  if curl -s http://localhost:11155/ | grep -q "Ollama is running"; then
    echo "Ollama is running"
    break
  fi
  echo "Waiting for Ollama to start..."
  sleep 2
done

# Pull your model (DeepSeek R1)
OLLAMA_HOST=127.0.0.1:11155 ollama pull deepseek-r1:1.5b

# Stop the background Ollama process
pkill -f "ollama serve"

# Start Ollama in the foreground on the correct port for Render
export OLLAMA_HOST=0.0.0.0:11434
exec ollama serve

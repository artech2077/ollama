FROM ollama/ollama:latest

# Copy your entrypoint script into the image
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Override the default ENTRYPOINT to run your script
ENTRYPOINT ["/entrypoint.sh"]

# Expose the Ollama API port
EXPOSE 11434

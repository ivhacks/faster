FROM llamacpp

RUN mkdir -p /models

COPY models/Mistral-7B-Instruct-v0.3.Q6_K.gguf /models/model.gguf

# This combines with the ENTRYPOINT in llama.cpp/.devops/llama-server-cuda.Dockerfile
# ENTRYPOINT [ "/llama-server" ]
CMD [ "-m", "/models/model.gguf", "--port", "8080", "--host", "0.0.0.0", "-ngl", "99" ]
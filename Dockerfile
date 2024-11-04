FROM llamacpp

RUN mkdir -p /models

COPY models/Llama-3.2-3B-Instruct-Q8_0.gguf /models/model.gguf

RUN mkdir -p /templates

COPY template.txt /templates/template.txt

# This combines with the ENTRYPOINT in llama.cpp/.devops/llama-server-cuda.Dockerfile
# ENTRYPOINT [ "/llama-server" ]
# CMD [ "--jinja", "-fa", "-m", "/models/model.gguf", "--port", "8080", "--host", "0.0.0.0", "-ngl", "99" ]
CMD [ "--jinja", "-fa", "-m", "/models/model.gguf", "--chat-template-file", "/templates/template.txt" ]
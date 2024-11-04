#!/bin/bash
docker build -t llamacpp -f llama.cpp/.devops/llama-server-cuda.Dockerfile llama.cpp/
mkdir -p ./models
cd models

wget --no-clobber https://huggingface.co/MaziyarPanahi/Mistral-7B-Instruct-v0.3-GGUF/resolve/main/Mistral-7B-Instruct-v0.3.Q6_K.gguf?download=true -O Mistral-7B-Instruct-v0.3.Q6_K.gguf

cd ..

docker build -t faster .
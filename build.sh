#!/bin/bash
docker build -t llamacpp -f llama.cpp/.devops/llama-server-cuda.Dockerfile llama.cpp/
mkdir -p ./models
cd models

wget --no-clobber https://huggingface.co/lmstudio-community/Llama-3.2-3B-Instruct-GGUF/resolve/main/Llama-3.2-3B-Instruct-Q8_0.gguf?download=true -O Llama-3.2-3B-Instruct-Q8_0.gguf

cd ..

python3 llama.cpp/scripts/get_hf_chat_template.py meta-llama/Llama-3.2-3B-Instruct >> template.txt


docker build -t faster .
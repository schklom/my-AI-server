# Hardware
[Framework Desktop](https://frame.work/desktop?slug=desktop-diy-amd-aimax300) with the new [AMD Ryzen 395 AI Max+](https://frame.work/products/framework-desktop-mainboard-amd-ryzen-ai-max-300-series?v=FRAFMK0006) (has GPU Radeon 8060S)

# Software
## MLC-AI: make models in MLC format
### DeepSeek R1 70B Q8
```bash
mkdir -p ~/docker/LLMs
cd ~/docker/LLMs
# Download Q8_0 quantized GGUF
wget https://huggingface.co/unsloth/DeepSeek-R1-Distill-Llama-70B-GGUF/resolve/main/DeepSeek-R1-Distill-Llama-70B-Q8_0.gguf

# Convert to MLC format
docker run --rm -v ~/docker/LLMs:/models mlc-ai/mlc-llm:latest \
  convert /models/DeepSeek-R1-Distill-Llama-70B-Q8_0.gguf \
  --quantization q8f16_ft \
  --output /models/deepseek-70b-q8-mlc
```
### LLaVa 34B Q8
```bash
mkdir -p ~/docker/LLMs
cd ~/docker/LLMs
# Download and convert LLaVA
docker run --rm -v ~/docker/LLMs:/models mlc-ai/mlc-llm:latest \
  convert HF://liuhaotian/llava-v1.6-34b \
  --quantization q8f16_ft \
  --image-model vit-large-patch14-336 \
  --output /models/llava-34b-q8-mlc
```
## Docker
[docker-compose.yml](docker-compose.yml)

# Hardware
[Framework Desktop](https://frame.work/desktop?slug=desktop-diy-amd-aimax300) with the new [AMD Ryzen 395 AI Max+](https://frame.work/products/framework-desktop-mainboard-amd-ryzen-ai-max-300-series?v=FRAFMK0006) (has GPU Radeon 8060S)

# Software

Task 							| Best Framework 	|	Best Model(s) (2025) |	Notes
----------------- | ---------				| ----------------------------------------	| ------
Text Inference    |	MLC-AI      		|	Llama 3 70B Q8, Qwen 72B Q8, Yi 70B Q8		|	vLLM for max perf, MLC-AI for quantized models
Speech-to-Text    |	MLC-AI      		|	Whisper Large-v3 Q8	 		                 	| Deepgram Nova-3 for commercial, real-time
Text-to-Speech    |	MLC-AI		      |	Chatterbox, XTTS v2, Bark	            		| PlayHT/ElevenLabs for commercial
Image Inference   |	MLC-AI    		  |	Stable Diffusion 3.5, FLUX.1 Dev     			| GPT-4o Vision for closed, SOTA image understanding
PDF Summarization |	vLLM/MLC-AI 		|	Llama 3 70B Q8, IBM Granite 3.2, Xmind AI	| Use LLM with PDF-to-text extraction

## MLC-AI
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

## vLLM

## List of MCP servers
https://github.com/modelcontextprotocol/servers

## Docker
[docker-compose.yml](docker-compose.yml)

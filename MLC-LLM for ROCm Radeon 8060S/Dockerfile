# Dockerfile for MLC-LLM + ROCm on Radeon 8060S (architecture gfx1151)
FROM rocm/dev-ubuntu-24.04:latest
ARG HSA_OVERRIDE_GFX_VERSION=11.0.0

# Install dependencies
RUN apt update && \
    apt-get install -y \
      python3.11 pip git llvm-17 cmake && \
    apt-get -y clean && \
    apt-get -y autoremove --purge && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Build MLC-LLM from source
RUN git clone --recursive https://github.com/mlc-ai/mlc-llm.git && \
    cd mlc-llm && \
    mkdir build && \
    cd build && \
    cmake .. \
      -DUSE_ROCM=ON \
      -DROCM_ARCH=gfx1151 \
      -DHSA_OVERRIDE_GFX_VERSION=11.0.0 && \
    make -j$(nproc)

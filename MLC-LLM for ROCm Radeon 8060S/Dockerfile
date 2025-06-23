# Stage 1: Builder with full build environment
FROM rocm/dev-ubuntu-24.04:latest AS builder
ENV HSA_OVERRIDE_GFX_VERSION=11.0.0

# Install build dependencies
RUN apt update && \
    apt-get install -y --no-install-recommends \
    python3.11 git llvm-17 cmake build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/*

# Build MLC-LLM
RUN git clone --depth 1 --recursive https://github.com/mlc-ai/mlc-llm.git \
    && cd mlc-llm \
    && mkdir build \
    && cd build \
    && cmake .. \
        -DUSE_ROCM=ON \
        -DROCM_ARCH=gfx1151 \
        -DHSA_OVERRIDE_GFX_VERSION=11.0.0 \
    && make -j$(nproc)

# Stage 2: Optimized runtime image
FROM rocm/dev-ubuntu-24.04:latest
ENV HSA_OVERRIDE_GFX_VERSION=11.0.0

# Install minimal runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.11 llvm-17 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/*

# Copy only built artifacts from builder stage
COPY --from=builder /mlc-llm/build/mlc_llm /usr/local/bin/mlc_llm

# Verify binary works
RUN mlc_llm --version

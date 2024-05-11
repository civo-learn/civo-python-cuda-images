# Ubuntu 22.04 and Cuda 12.4.1
FROM ghcr.io/mamba-org/micromamba:jammy-cuda-12.4.1

# copy over the mamba dependacies
COPY --chown=$MAMBA_USER:$MAMBA_USER env.yaml /app/env.yaml

# create the micromamba cuda enviroment
RUN micromamba install -y -n base -f /app/env.yaml && \
    micromamba clean --all --yes

# activate micromamba env
ARG MAMBA_DOCKERFILE_ACTIVATE=1

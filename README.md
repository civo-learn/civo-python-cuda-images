# Civo Python CUDA Images

## Introduction

This project provides over 30 images for the following combinations:

- **OS Versions:** `jammy`, `focal`
- **CUDA Versions:** `12.4.1`, `11.8.0`
- **Container Types:** `base`, `pytorch`, `tensorflow=2.15.0`
- **Python Versions:** `3.9`, `3.10`, `3.11`

The resultant images are significantly smaller than the NVIDIA base images, with the smallest image being 399MB, which is 398% smaller than the NVIDIA base image. The images are built using [Micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html), a fast, reliable, and secure package manager for data science and machine learning.

## Images

Some of the highlights of the images are:

| Name                             | Description                                      | Image Size | Nvidia Image Size | Size Reduction |
|----------------------------------|--------------------------------------------------|------------|-------------------|----------------|
| `civo_jammy_python_3.11_cuda_12.4.1_base`             | Python 3.11, CUDA 12.4, base image               | 399.22MB   | 1.99GB            | -398.4%        |
| `civo-python-cuda12-pytorch`     | Base image with PyTorch, PyTorch-audio, etc.     | 7.93GB     | 8.68GB            | -9.45%         |
| `civo_jammy_python_3.11_cuda_12.4.1_pytorch`| Base image with PyTorch 2.3.0                    | 1.99GB     | 8.68GB            | -336%          |
| `civo_jammy_python_3.11_cuda_12.4.1_tensorflow`  | Base image with TensorFlow 2.15.0                | 2.3GB      | 6.62GB            | -187.83%       |

## Other Repositories

Check out [civo-vllm-docker](https://github.com/civo-learn/civo-vllm-docker) for an example implementation.

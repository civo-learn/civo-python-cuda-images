# Civo Python Cuda Images

## Introduction

This project provides a Python 3.11 image with CUDA 12.4.1 docker image that is 509MB, 290% smaller than the nvidia base image in size thanks to [Micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html).

## Images
| Name                             | Description                                | Image Size | Nvidia Image Size | Size Reduction |
|----------------------------------|--------------------------------------------|------------|-------------------|----------------|
| `civo-python-cuda12`             | Python 3.11, Cuda 12.4, base image         | 509MB      | 1.99 GB           | -290%          |
| `civo-python-cuda12-pytorch`     | Base Image with Pytorch, pytorch-audio, ect| 7.93GB     | 8.68 GB           | -9.45%         |
| `civo-python-cuda12-pytorch-thin`| Base Image with Pytorch 2.3.0              | 7.93GB     | 8.68 GB           | -9.45%         |
| `civo-python-cuda12-tensorflow`  | Base Image with Tensorflow 2.15.0          | 2.3GB      | 6.62 GB           | -187.83%       |


## TODO: 
- make a dagger pipeline...
- pipeline different OSs
- pipeline different python versions
- pipeline different cuda versions
- pipeline different pytorch and tensorflow distros

## Other Repos: 
Checkout [civo-vllm-docker](https://github.com/civo-learn/civo-vllm-docker) for an example implementation

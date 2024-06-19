#!/bin/bash

# List of image names
image_names=(
  "civo_jammy_python_3.10_cuda_12.4.1_pytorch"
  "civo_jammy_python_3.9_cuda_12.4.1_pytorch"
  "civo_jammy_python_3.11_cuda_12.4.1_pytorch"
  "civo_jammy_python_3.9_cuda_12.4.1_tensorflow"
  "civo_focal_python_3.10_cuda_11.8.0_tensorflow"
  "civo_jammy_python_3.10_cuda_12.4.1_base"
  "civo_focal_python_3.9_cuda_11.8.0_pytorch"
  "civo_focal_python_3.11_cuda_11.8.0_pytorch"
  "civo_jammy_python_3.10_cuda_11.8.0_pytorch"
  "civo_jammy_python_3.9_cuda_11.8.0_pytorch"
  "civo_jammy_python_3.11_cuda_12.4.1_base"
  "civo_jammy_python_3.11_cuda_11.8.0_pytorch"
  "civo_jammy_python_3.9_cuda_12.4.1_base"
  "civo_jammy_python_3.9_cuda_11.8.0_tensorflow"
  "civo_jammy_python_3.11_cuda_11.8.0_tensorflow"
  "civo_jammy_python_3.10_cuda_11.8.0_tensorflow"
  "civo_jammy_python_3.10_cuda_12.4.1_tensorflow"
  "civo_jammy_python_3.11_cuda_12.4.1_tensorflow"
  "civo_focal_python_3.9_cuda_11.8.0_tensorflow"
  "civo_focal_python_3.11_cuda_12.4.1_tensorflow"
  "civo_focal_python_3.10_cuda_12.4.1_pytorch"
  "civo_focal_python_3.9_cuda_12.4.1_tensorflow"
  "civo_focal_python_3.10_cuda_11.8.0_pytorch"
  "civo_focal_python_3.11_cuda_11.8.0_tensorflow"
  "civo_focal_python_3.10_cuda_12.4.1_tensorflow"
  "civo_focal_python_3.9_cuda_12.4.1_pytorch"
  "civo_focal_python_3.11_cuda_12.4.1_pytorch"
  "civo_jammy_python_3.9_cuda_11.8.0_base"
  "civo_focal_python_3.10_cuda_11.8.0_base"
  "civo_focal_python_3.11_cuda_11.8.0_base"
  "civo_focal_python_3.9_cuda_11.8.0_base"
  "civo_jammy_python_3.10_cuda_11.8.0_base"
  "civo_jammy_python_3.11_cuda_11.8.0_base"
  "civo_focal_python_3.10_cuda_12.4.1_base"
  "civo_focal_python_3.11_cuda_12.4.1_base"
  "civo_focal_python_3.9_cuda_12.4.1_base"
  "civo_focal_python_3.11_cuda_12.4.1_pytorch"
  "civo_jammy_python_3.9_cuda_11.8.0_base"
  "civo_focal_python_3.10_cuda_11.8.0_base"
  "civo_focal_python_3.11_cuda_11.8.0_base"
  "civo_focal_python_3.9_cuda_11.8.0_base"
  "civo_jammy_python_3.10_cuda_11.8.0_base"
  "civo_jammy_python_3.11_cuda_11.8.0_base"
  "civo_focal_python_3.10_cuda_12.4.1_base"
  "civo_focal_python_3.11_cuda_12.4.1_base"
  "civo_focal_python_3.9_cuda_12.4.1_base"
)

# Function to pull the image and fetch size of an image
get_image_size() {
  image_name="$1"
  full_image_name="ghcr.io/civo-learn/${image_name}:latest"

  # Pull the image
  docker pull "${full_image_name}" > /dev/null
  
  # Get sizes
  mb=$(docker inspect -f "{{ .Size }}" "${full_image_name}" | numfmt --to=si)
  
  echo "${mb}"
}

# Output Markdown table header
echo "| Image Name | Size |"
echo "|------------|------|"

# Loop through each image name, fetch size and print table row
for image_name in "${image_names[@]}"; do
  size=$(get_image_size "${image_name}")
  echo "| ${image_name} | ${size} |"
done

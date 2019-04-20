#!/bin/sh

CUDA_PATH=/opt/cuda
CUDA_LIB=$CUDA_PATH/lib64/

for file in $(find $CUDA_LIB -name "*.so.10"); do
    sudo ln -s $file "$file.0"
done

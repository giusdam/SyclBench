#!/bin/bash

mkdir build
cd build
cmake ../ -DComputeCpp_DIR="/home/ubuntu/SyclBench/ComputeCpp-CE-2.3.0-x86_64-linux-gnu" -DCOMPUTECPP_BITCODE=ptx64
#cmake ../ -DComputeCpp_DIR="/home/ubuntu/SyclBench/ComputeCpp-CE-2.3.0-x86_64-linux-gnu"
make

cd ..

mkdir benchmarks/

for bench in build/*; do
    if ! [[ "$bench" =~ .*"sycl".* || "$bench" =~ .*"cpp".* || "$bench" =~ .*"ake".* ]];
    then
      cp $bench benchmarks
    fi
done;


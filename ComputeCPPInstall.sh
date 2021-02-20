#!/bin/bash

#git clone https://github.com/peppekristen/SyclBench.git
#cd SyclBench

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y build-essential autoconf cmake unzip
sudo apt install -y ocl-icd-libopencl1 opencl-headers clinfo
sudo apt update -y
sudo apt upgrade -y

tar -xf computecpp-ce-2.3.0-x86_64-linux-gnu.tar.gz

#tar -xf l_opencl_p_18.1.0.015.tgz


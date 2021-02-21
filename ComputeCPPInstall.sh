#!/bin/bash

#git clone https://github.com/peppekristen/SyclBench.git
#cd SyclBench

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y build-essential autoconf cmake unzip
sudo apt install -y opencl-headers ocl-icd-libopencl1 ocl-icd-opencl-dev clinfo
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update -y
sudo apt-get install g++-7 -y
sudo apt update -y
sudo apt upgrade -y


tar -xf computecpp-ce-2.3.0-x86_64-linux-gnu.tar.gz


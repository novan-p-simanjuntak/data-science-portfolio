#!/bin/bash
set -e

# update ubuntu
sudo apt-get update && sudo apt-get -y upgrade
# update python library, pip whell, bsdist
sudo apt-get install -y python
sudo apt-get install -y python-pip

# install git
sudo apt-get install -y git
sudo apt-get install -y wget

# Installing CUDA
sudo su
echo "Checking for CUDA and installing."
# Check for CUDA and try to install.
if ! dpkg-query -W cuda-8-0; then
  # The 16.04 installer works with 16.10.
  curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
  dpkg -i ./cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
  apt-get update
  apt-get install cuda-8-0 -y
fi
# Enable persistence mode
nvidia-smi -pm 1

# Installing cuDNN yourself
cd $HOME
# Download cuDNN library (edit to download via other methods)
gsutil cp -r gs://word2vecnovan/cudnn-8.0-linux-x64-v5.0-ga.tgz .
tar xzvf cudnn-8.0-linux-x64-v5.0-ga.tgz
sudo cp cuda/lib64/* /usr/local/cuda/lib64/
sudo cp cuda/include/cudnn.h /usr/local/cuda/include/
rm -rf ~/cuda
rm cudnn-8.0-linux-x64-v5.0-ga.tgz

# clone git
git clone https://github.com/novan-p-simanjuntak/data-science-portfolio.git

# Change dir to project dogsvscats
cd data-science-portfolio/dogsvscats/

# Install virtual-env and activate it
# upgrade pip
pip install --upgrade pip
# install virtualenv
pip install --upgrade virtualenv
# create environment in .env
virtualenv .env
# activate virtual environment
source .env/bin/activate

# Install pythonlib for cuda
sudo apt-get install python-dev python-pip libcupti-dev
# install virtual env
pip install -r requirements.txt

cd nbs/data/
gsutil cp -r gs://word2vecnovan/dogscats.zip .
mkdir dogscats
tar -czvf dogscats.zip dogscats/

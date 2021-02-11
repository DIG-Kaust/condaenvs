#!/bin/bash
# 
# Installer for PyLops GPU environment with Cupy and CUDA 11.1
#
# Run: ./install_pylops_cupy.sh pylops_dir
# 
# M. Ravasi, 04/02/2021

echo 'Creating PyLops GPU environment'

# load module cuda 11.1
module load cuda/11.1.0/gcc-7.5.0-4dnx5cr
echo 'Loaded cuda:' $(which nvcc)

# create conda env
conda env create -f environment_pylops_cupy.yml --yes
source activate pylops_cupy
echo 'Created and activated environment:' $(which python)

# install pylops in developer mode
if [ -z "$1" ];
then
   echo 'No library installed in dev mode...'
else
   cd $1
   pip install -e .
fi

# check cupy works as expected
echo 'Checking cupy version and running a command...'
python -c 'import cupy as cp; print(cp.__version__); cp.ones(10000)*10'

echo 'Done!'


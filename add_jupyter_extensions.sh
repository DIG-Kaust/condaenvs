#!/bin/bash
# 
# Add jupyter notebook extensions to current environment
# 
# Run: ./add_jupyter_extensions.sh condaenv_name
#
# M. Ravasi, 05/02/2021

CONDAENV=$1
echo "Adding jupyter notebook extensions to $CONDAENV environment"

# Source conda env
source activate $CONDAENV

# Install extension
conda install -c conda-forge jupyter_contrib_nbextensions jupyter_nbextensions_configurator
jupyter contrib nbextension install
jupyter nbextensions_configurator enable

echo "Done!"

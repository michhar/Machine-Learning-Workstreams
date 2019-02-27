#!/usr/bin/env bash

# This script is intended as an initialization script used in azuredeploy.json
# See documentation here: https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux#template-deployment

# see abbreviated notes in README.md
# comments below:

adminUser=$1
azureSub=$2
azureRG=$3

echo azureSub is $azureSub
echo azureRG is $azureRG

WD=/home/$adminUser/notebooks

echo WD is $WD

if [ ! -d $WD ]; then
    echo $WD does not exist - aborting!!
    exit
else
    cd $WD
    echo "Working in $(pwd)"
fi

## now create the env...
condapath=/home/$adminUser/.conda/envs

if [ ! -d $condapath ]; then
    mkdir -p $condapath
fi

#### PYTORCH 1.0 ####

/anaconda/envs/py35/bin/conda create --name pytorch10 ipykernel conda

## update appropriate permissions
chown -R ${adminUser}:${adminUser} ${condapath}

# Install PyTorch 1.0 into environment with cuda 9.2 support as DSVM is on this now
/anaconda/envs/pytorch10/bin/python -m conda install pytorch torchvision cudatoolkit=9.2 -c pytorch -y

# LibTorch - install into /usr/local/lib
wget https://download.pytorch.org/libtorch/nightly/cu92/libtorch-shared-with-deps-latest.zip
unzip libtorch-shared-with-deps-latest.zip
sudo mv libtorch /usr/local/lib/python3.5/dist-packages/torch

## Install it as a kernel
/anaconda/envs/pytorch10/bin/python -m ipykernel install --name pytorch_preview --display-name "Python 3.5 - PyTorch 1.0"


#### PYTORCH 0.4.1 ####

/anaconda/envs/py35/bin/conda create --name pytorch041 ipykernel conda numpy pyyaml scipy ipython mkl

## update appropriate permissions
chown -R ${adminUser}:${adminUser} ${condapath}

# # Install PyTorch 0.4.1 into environment with cuda 9.2 support as DSVM is on this now
/anaconda/envs/pytorch041/bin/python -m conda install -c soumith magma-cuda92
/anaconda/envs/pytorch041/bin/conda install torchvision pytorch==0.4.1 -c pytorch

## Install it as a kernel
/anaconda/envs/pytorch041/bin/python -m ipykernel install --name pytorch_041 --display-name "Python 3.5 - PyTorch 0.4.1"


#### PYTORCH 0.3.1 ####

/anaconda/envs/py35/bin/conda create --name pytorch031 ipykernel conda numpy pyyaml scipy ipython mkl

## update appropriate permissions
chown -R ${adminUser}:${adminUser} ${condapath}

# # Install PyTorch 0.3.1 into environment with cuda 9.2 support as DSVM is on this now
/anaconda/envs/pytorch031/bin/python -m conda install -c soumith magma-cuda92
/anaconda/envs/pytorch031/bin/conda install torchvision pytorch==0.3.1 -c pytorch

## Install it as a kernel
/anaconda/envs/pytorch031/bin/python -m ipykernel install --name pytorch_031 --display-name "Python 3.5 - PyTorch 0.3.1"

## Update appropriate permissions
chown -R ${adminUser}:${adminUser} ${condapath}

## Reboot jupyterhub
systemctl restart jupyterhub

echo "Done!"
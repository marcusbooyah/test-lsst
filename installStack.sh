#!/bin/bash

clear

echo "Installing LSST Software Stack with Conda"
echo

echo "Making directory for installation"
echo
mkdir lsstSTACK
cd lsstSTACK
echo

#echo "Downloading necessary files"
#echo
#git clone https://github.com/mjuric/conda-lsst.git
#echo "Installing Miniconda"
#bash ./conda-lsst/bin/bootstrap.sh
#export PATH="$PWD/miniconda/bin:$PATH"
#echo

#echo "adding the path"
#export PATH="$PWD/conda-lsst/bin:$PATH"
#echo

#echo "Builing Conda packages"
#echo
#conda install patchelf
#conda install eups
#conda install legacy_configs

#echo "Build conda packages for LSST codes (the recipes will be stored in recipes/generated subdirectory)"
#conda lsst build build:b1488 lsst_distrib lsst_sims

echo "Installing LSST software using Conda"
echo
conda config --add channels http://eupsforge.net/conda/dev
conda install lsst-apps
source eups-setups.sh
echo

echo "Downloading demo"
echo
curl -L https://github.com/lsst/lsst_dm_stack_demo/archive/10.1.tar.gz | tar xvzf -
cd lsst_dm_stack_demo-10.1

echo "Setting up obs_sdss"
echo
setup obs_sdss

echo "Running SDSS demo"
echo
./bin/demo.sh
echo "Demo finished, now testing "
echo
./bin/compare detected-sources.txt.expected detected-sources.txt



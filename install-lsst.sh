#!/bin/bash

set -e

clear

echo "Installing LSST Software Stack with Conda"
echo

echo "Making directory for installation"
echo
mkdir lsst-stack
cd lsst-stack
echo

#
# Install Miniconda
#

if [[ ! -f "$PWD/miniconda/.installed" ]] 2>"s.out"; then
	case "$OSTYPE" in
		linux*)  MINICONDA_SH=Miniconda-latest-Linux-x86_64.sh ;;
		darwin*) MINICONDA_SH=Miniconda-latest-MacOSX-x86_64.sh ;;
		*)       echo "Unsupported OS $OSTYPE. Exiting."; exit -1 ;;
	esac

	rm -f "$MINICONDA_SH"
	rm -rf "$PWD/miniconda"
	curl -O https://repo.continuum.io/miniconda/"$MINICONDA_SH"
	bash "$MINICONDA_SH" -b -p "$PWD/miniconda"
	rm -f "$MINICONDA_SH"

	#
	# Install prerequisites
	#
	export PATH="$PWD/miniconda/bin:$PATH"
	conda install conda-build jinja2 binstar requests sqlalchemy pip --yes

	pip install requests_file

	# marker that we're done
	touch "$PWD/miniconda/.installed"
else
	echo
	echo "Found Miniconda in $PWD/miniconda; skipping Miniconda install."
	echo
fi

echo "Installing LSST software using Conda"
echo
conda config --add channels http://eupsforge.net/conda/dev
conda install lsst-apps -y
source eups-setups.sh
echo



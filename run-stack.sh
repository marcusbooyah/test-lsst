set -e

if [[ ! -d lsst-stack ]]; then
	echo "LSST stack not found, installing stack"
	bash install-lsst.sh
else
	export PATH="$PWD/lsst-stack/miniconda/bin:$PATH"
	source  eups-setups.sh
fi

cd tests
for f in *.sh; do 
	bash "$f"
done
#bash test-sdss.sh
#bash sims-maf.sh

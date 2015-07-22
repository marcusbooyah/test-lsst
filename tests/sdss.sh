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


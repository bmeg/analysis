# BMEG Analysis




### Snakemake pip install

Weird issue with installing snakemake on python 3.7

datrie fails to compile (cython incompatibility): https://github.com/pytries/datrie/issues/52

```
curl -O -L https://github.com/pytries/datrie/archive/0.7.1.tar.gz
tar xf 0.7.1.tar.gz
cd datrie-0.7.1
./update_c.sh
python3.7 setup.py build
python3.7 setup.py install
```

Then install snakemake
```
pip install snakemake
```

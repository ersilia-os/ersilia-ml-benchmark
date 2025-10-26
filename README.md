# Ersilia AutoML Benchmarks

This repository contains the benchmark data for ersilia's autoML tools. It uses [Polaris Hub](https://polarishub.io/) datasets for benchmarking

## Installation
Create a conda environment and select the right installation setting depending on the AutoML you want to test

```
conda create -n benchmark python=3.12
git clone https://github.com/ersilia-os/ersilia-ml-benchmark
cd ersilia-ml-benchmark
pip install -e .[...]
```

## Benchmark running
Add the desired benchmarks in the defaults.py list. Please use the full polaris notation, i.e `tdcommons/pgp-broccatelli`, and run the desired autoML tool. Results will be stored in the /results folder. Only the evaluation and a complete summary are stored.

```
cd ersilia-ml-benchmark/src
python lazyqsar.py
```

## Results evaluation
Use the `summary_scores.csv` file in each results folder. PolarisHub results can be found in `defaults.py` (last update: October 2025).

# Lazyqsar
[LazyQSAR](https://github.com/ersilia-os/lazy-qsar) can run in three modes, fast, slow, default. Here, we are comparing the different choices of descriptors for each mode to release a stable version. These are the results:
| benchmark | polaris | rdkit_fast | rdkit_default | rdkit_slow | no_rdkit_fast | no_rdkit_default | no_rdkit_slow | only_rdkit_fast |
|------------|----------|-------------|---------------|-------------|----------------|------------------|----------------|-----------------|
| tdcommons/bioavailability-ma | 0.729 | 0.682 | 0.733 | 0.694 | 0.658 | 0.684 | 0.644 | 0.738 |
| tdcommons/hia-hou | 0.989 | 0.996 | 0.992 | 0.994 | 0.986 | 0.966 | 0.996 | 0.986 |
| tdcommons/pgp-broccatelli | 0.954 | 0.921 | 0.905 | 0.923 | 0.909 | 0.909 | 0.928 | 0.891 |
| tdcommons/bbb-martins | 0.933 |  |  |  | 0.844 | 0.916 | 0.918 |  |
| tdcommons/cyp2c9-veith | 0.895 | 0.746 | 0.752 | 0.763 | 0.740 | 0.772 | 0.771 | 0.710 |
| tdcommons/cyp2d6-veith | 0.801 | 0.674 | 0.686 | 0.690 | 0.631 | 0.685 | 0.692 | 0.624 |
| tdcommons/cyp3a4-veith | 0.919 | 0.846 | 0.850 | 0.860 | 0.835 | 0.852 | 0.864 | 0.808 |
| tdcommons/cyp2c9-substrate-carbonmangels | 0.478 | 0.462 | 0.398 | 0.428 | 0.451 | 0.437 | 0.424 | 0.449 |
| tdcommons/cyp2d6-substrate-carbonmangels | 0.719 | 0.717 | 0.709 | 0.704 | 0.691 | 0.649 | 0.701 | 0.695 |
| tdcommons/cyp3a4-substrate-carbonmangels | 0.696 | 0.630 | 0.621 | 0.636 | 0.610 | 0.628 | 0.627 | 0.652 |
| tdcommons/herg | 0.891 | 0.856 | 0.864 | 0.869 | 0.805 | 0.839 | 0.863 | 0.842 |
| tdcommons/ames | 0.868 | 0.833 | 0.840 | 0.850 | 0.815 | 0.848 | 0.851 | 0.817 |
| tdcommons/dili | 0.933 | 0.892 | 0.908 | 0.907 | 0.893 | 0.918 | 0.920 | 0.856 |

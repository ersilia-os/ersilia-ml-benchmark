import os
import sys
import shutil
import pandas as pd
import numpy as np
import h5py

from rdkit import Chem
from rdkit.Chem import AllChem
from rdkit import DataStructs

import polaris as po
from lazyqsar.agnostic import LazyBinaryClassifier
from lazyqsar.utils.logging import logger

root = os.path.dirname(os.path.abspath(__file__))
sys.path.append(root)
from defaults import benchmarks

m = "eos3cf4"

### To run this pipeline please make sure to calculate Ersilia descriptors first and save it in the /descriptors folder
### Use the following: eosid_test/train_benchmarkname and .h5 as output

results_folder = os.path.join(root, "..", "results", "lq_agnostic", m)
if not os.path.exists(results_folder):
    os.makedirs(results_folder)

descriptor_folder = os.path.join(root, "..", "descriptors")
if not os.path.exists(descriptor_folder):
    os.mkdir(descriptor_folder)

model_folder = os.path.join(root, "..", "models")
if not os.path.exists(model_folder):
    os.mkdir(model_folder)

def load_dataset(benchmark):
    train, test = benchmark.get_train_test_split()
    train_x = train.inputs.tolist()
    train_y = train.targets.tolist()
    test_x = test.inputs.tolist()
    return train_x, train_y, test_x

def load_h5_dataset(h5_file_train, h5_file_test):
    with h5py.File(h5_file_train, "r") as f:
        X_train = f["Values"][:]
    logger.info("Number of training samples: {0}".format(len(X_train)))
    with h5py.File(h5_file_test, "r") as f:
        X_test = f["Values"][:]
    logger.info("Number of testing samples: {0}".format(len(X_test)))
    return X_train, X_test

def fit_and_evaluate(benchmark_name, output_dir, clean=True, onnx=True,):
    benchmark = po.load_benchmark(benchmark_name)
    desc_file_train = os.path.join(descriptor_folder, f"{m}_train_{benchmark_name.split("/")[1]}.h5")
    desc_file_test = os.path.join(descriptor_folder, f"{m}_test_{benchmark_name.split("/")[1]}.h5")
    logger.info("Binary classification task")
    y_train = pd.read_csv(os.path.join(descriptor_folder, f"y_train_{benchmark_name.split("/")[1]}.csv"))["y_true"]
    model = LazyBinaryClassifier()
    #X_train, X_test = load_h5_dataset(desc_file_train, desc_file_test)
    #X_train = np.array(pd.read_csv(desc_file_train))[:,2:]
    #X_test = np.array(pd.read_csv(desc_file_test))[:,2:]
    model.fit(h5_file=desc_file_train, y=y_train)
    model.save(output_dir, onnx=onnx)
    model = LazyBinaryClassifier.load(output_dir)
    y_prob = model.predict_proba(h5_file=desc_file_test)[:, 1]
    results = None
    if np.isnan(np.asarray(y_prob, dtype=float)).any():
        print("Nans found in input")
    else:
        results = benchmark.evaluate(y_prob=y_prob)
    if clean:
        logger.info("Removing temporary files from {0}".format(output_dir))
        shutil.rmtree(output_dir)
    return results

scores = {}
for b in benchmarks.keys():
    benchmark_name = b.split("/")[1]
    output_dir = os.path.join(model_folder, benchmark_name)
    results = fit_and_evaluate(b, output_dir)
    if results is None:
        print("Nan in dataset: ", f"{benchmark_name}")
        score = np.nan
    else:
        results.results.to_csv(os.path.join(results_folder, f"{benchmark_name}.csv"), index=False)
        score = results.results["Score"].iloc[0]
    scores[b] = score

df = pd.DataFrame(list(scores.items()), columns=["benchmark", "score"])
df.to_csv(os.path.join(results_folder, "summary_scores.csv"), index=False)

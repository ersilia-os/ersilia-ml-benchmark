import os
import sys
import shutil
import pandas as pd
import numpy as np

import polaris as po
from lazyqsar.qsar import LazyBinaryQSAR
from lazyqsar.utils.logging import logger

root = os.path.dirname(os.path.abspath(__file__))
sys.path.append(root)
from defaults import benchmarks

version = sys.argv[1]

results_folder = os.path.join(root, "..", "results", f"lazyqsar_{version}")
if not os.path.join(results_folder):
    os.makedirs(results_folder, exist_ok=True)

model_folder = os.path.join(root, "..", "models", f"lazyqsar_{version}")
if not os.path.join(model_folder):
    os.makedirs(model_folder, exist_ok=True)

def load_dataset(benchmark):
    train, test = benchmark.get_train_test_split()
    train_x = train.inputs.tolist()
    train_y = train.targets.tolist()
    test_x = test.inputs.tolist()
    return train_x, train_y, test_x

def fit_and_evaluate(benchmark_name, mode, output_dir, clean=True, onnx=True,):
    benchmark = po.load_benchmark(benchmark_name)
    logger.info("Binary classification task")
    smiles_train, y_train, smiles_test = load_dataset(benchmark)
    logger.info("Using featurizer")
    model = LazyBinaryQSAR(mode=mode)
    model.fit(smiles_list=smiles_train, y=y_train)
    model.save(output_dir, onnx=onnx)
    model = LazyBinaryQSAR.load(output_dir)
    y_prob = model.predict_proba(smiles_list=smiles_test)[:, 1]
    results = None
    if np.isnan(np.asarray(y_prob, dtype=float)).any():
        print("Nans found in input")
    else:
        results = benchmark.evaluate(y_prob=y_prob)
    if clean:
        logger.info("Removing temporary files from {0}".format(output_dir))
        shutil.rmtree(output_dir)
    return results

for mode in ["default", "slow"]:
    scores = {}
    results_subfolder = os.path.join(results_folder, mode)
    if not os.path.exists(results_subfolder):
        os.makedirs(results_subfolder, exist_ok=True)
    for b in benchmarks.keys():
        benchmark_name = b.split("/")[1]
        output_dir = os.path.join(model_folder, mode, benchmark_name)
        if not os.path.exists(output_dir):
            os.makedirs(results_subfolder, exist_ok=True)
        results = fit_and_evaluate(b, mode, output_dir)
        if results is None:
            print("Nan in dataset: ", f"{benchmark_name}")
            score = np.nan
        else:
            results.results.to_csv(os.path.join(results_subfolder, f"{benchmark_name}.csv"), index=False)
            score = results.results["Score"].iloc[0]
        scores[b] = score

    df = pd.DataFrame(list(scores.items()), columns=["benchmark", "score"])
    df.to_csv(os.path.join(results_subfolder, "summary_scores.csv"), index=False)
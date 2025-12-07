# Use this to create a local copy of the polaris benchmarks in use

import polaris as po
import pandas as pd
import os
import sys

root = os.path.dirname(os.path.abspath(__file__))

sys.path.append(root)
from defaults import benchmarks

descriptor_folder = os.path.join(root, "..", "descriptors")
if not os.path.exists(descriptor_folder):
    os.mkdir(descriptor_folder)

def load_dataset(benchmark):
    train, test = benchmark.get_train_test_split()
    train_x = train.inputs.tolist()
    train_y = train.targets.tolist()
    test_x = test.inputs.tolist()
    return train_x, train_y, test_x

def save_dataset(benchmark_name):
    benchmark = po.load_benchmark(benchmark_name)
    smiles_train, y_train, smiles_test, y_test = load_dataset(benchmark)
    df1 = pd.DataFrame({"smiles":smiles_train})
    df2 = pd.DataFrame({"smiles":smiles_test})
    df3 = pd.DataFrame({"y_true": y_train})
    df4 = pd.DataFrame({"y_true": y_test})
    print(df4.head())
    #df1.to_csv(os.path.join(descriptor_folder, f"smiles_train_{benchmark_name.split("/")[1]}.csv"), index=False)
    #df2.to_csv(os.path.join(descriptor_folder, f"smiles_test_{benchmark_name.split("/")[1]}.csv"), index=False)
    #df3.to_csv(os.path.join(descriptor_folder, f"y_train_{benchmark_name.split("/")[1]}.csv"), index=False)

for b in benchmarks.keys():
    benchmark_name = b.split("/")[1]
    save_dataset(b)

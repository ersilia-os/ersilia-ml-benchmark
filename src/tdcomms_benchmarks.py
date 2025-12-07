# Use this to create a local copy of the TDComms benchmarks with the test targets

from tdc.benchmark_group import admet_group
import pandas as pd
import os
import sys

root = os.path.dirname(os.path.abspath(__file__))

sys.path.append(root)
from defaults import benchmarks

descriptor_folder = os.path.join(root, "..", "descriptors", "tdcomms")
if not os.path.exists(descriptor_folder):
    os.mkdir(descriptor_folder)

group = admet_group(path = descriptor_folder)

admet_datasets = ["Bioavailability_Ma",
                  "HIA_Hou", 
                  "Pgp_Broccatelli",
                  "BBB_Martins",
                  "CYP2C9_Veith", 
                  "CYP2D6_Veith", 
                  "CYP3A4_Veith",
                  "CYP2C9_Substrate_CarbonMangels", 
                  "CYP2D6_Substrate_CarbonMangels",
                  "CYP3A4_Substrate_CarbonMangels",    
                  "hERG", 
                  'AMES', 
                  "DILI",
                ]

def get_data(dataset):
    benchmark = group.get(dataset)
    name = benchmark['name']
    print(name)
    name = name.lower().replace("_", "-")
    print(name)
    train_val, test = benchmark['train_val'], benchmark['test']
    train_val.drop(columns=["Drug_ID"], inplace=True)
    test.drop(columns=["Drug_ID"], inplace=True)
    test.rename(columns = {"Drug": "smiles", "Y": "y_true"}, inplace=True)
    train_val.rename(columns = {"Drug": "smiles", "Y": "y_true"}, inplace=True)
    test.to_csv(os.path.join(descriptor_folder, "test_{}.csv".format(name)), index=False)
    train_val.to_csv(os.path.join(descriptor_folder, "train_{}.csv".format(name)), index=False)

for b in admet_datasets:
    get_data(b)
    b_polaris = b.lower().replace("_", "-")
    polaristrain = pd.read_csv(f"../descriptors/train_{b_polaris}.csv")["smiles"].tolist()
    tdcoms_train = pd.read_csv(f"../descriptors/tdcomms/train_{b_polaris}.csv")["smiles"].tolist()
    print(b_polaris)
    print(len(polaristrain), len(tdcoms_train), len(set(polaristrain)-(set(tdcoms_train))))

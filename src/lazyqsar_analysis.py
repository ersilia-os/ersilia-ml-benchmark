import pandas as pd
import os
import sys

root = os.path.dirname(os.path.abspath(__file__))
sys.path.append(root)
from defaults import benchmarks

base_dir = os.path.join(root, "..", "results")

configs = {
    "rdkit": ["fast", "default", "slow"],
    "no_rdkit": ["fast", "default", "slow"],
    "only_rdkit": ["fast"],
}

dfs = []

scores = {}
headers = []

for k,v in benchmarks.items():
    scores[k] = [v]
headers += ["polaris"]

for config, modes in configs.items():
    for mode in modes:
        path = os.path.join(base_dir, f"lazyqsar_{config}", mode, "summary_scores.csv")
        if os.path.exists(path):
            headers += [f"{config}_{mode}"]
            df = pd.read_csv(path)
            df.set_index("benchmark", inplace=True)
            print(df.head())
            for k in scores.keys():
                if k in df.index:
                    scores[k].append(df.loc[k, "score"])
                else:
                    scores[k].append(float("nan"))

df = pd.DataFrame.from_dict(scores, orient="index", columns=headers)
df.index.name = "benchmark"
df.reset_index(inplace=True)

out_path = os.path.join(base_dir, "lazyqsar_comparison.csv")
df.to_csv(out_path, index=False)


"""

for config, modes in configs.items():
    for mode in modes:
        path = os.path.join(base_dir, f"lazyqsar_{config}", mode, "summary_scores.csv")
        if os.path.exists(path):
            df = pd.read_csv(path)
            df = df.rename(columns={"score": f"{mode}_{config}"})
            dfs.append(df)
        else:
            print(f"⚠️ Missing: {path}")




from functools import reduce
merged_df = reduce(lambda left, right: pd.merge(left, right, on="benchmark", how="outer"), dfs)

# Sort columns nicely (optional)
cols = ["benchmark"] + sorted([c for c in merged_df.columns if c != "benchmark"])
merged_df = merged_df[cols]

# Save final unified table
out_path = os.path.join(base_dir, "lazyqsar_all_results.csv")
merged_df.to_csv(out_path, index=False)

print(f"✅ Unified results saved to {out_path}")
print(merged_df.head())
"""
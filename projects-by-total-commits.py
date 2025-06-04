# Sort projects by total commits

import pandas as pd

pd.set_option("display.max_rows", None)

if __name__ == "__main__":
    df = pd.read_csv("data/git-commits.csv")
    df = df.groupby(["project"]).sum().reset_index()
    df = df[["project", "num_commits"]]
    df = df.sort_values(["num_commits"], ascending=False)
    print(df)

# Sort projects by number of weeks with commits

import pandas as pd

pd.set_option("display.max_rows", None)

if __name__ == "__main__":
    df = pd.read_csv("data/git-commits.csv")
    df = df.groupby(["project"]).count().reset_index()
    df = df[["project", "num_commits"]]
    df = df.rename(columns={"num_commits": "weeks_with_commits"})
    df = df.sort_values(["weeks_with_commits"], ascending=False)
    print(df)

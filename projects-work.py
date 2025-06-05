# Fix up raw work commits to include language

import pandas as pd

if __name__ == "__main__":
    commits = pd.read_csv("data/git-commits-work-raw.csv")
    lang = pd.read_csv("data/projects-lang.csv")

    # rename project with old Hadoop commits so it is treated as Hadoop
    commits["project"] = commits["project"].replace({"hadoop-pre-HADOOP-4687": "hadoop"})

    commits = commits.join(lang.set_index('project'), on='project')

    commits.to_csv("data/git-commits-work.csv", index=False)

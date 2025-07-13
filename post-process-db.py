# Add git status to projects db

import pandas as pd

if __name__ == "__main__":
    projects = pd.read_csv("data/projects-db.csv")
    git_status = pd.read_csv("data/git-status.csv")

    projects_final = projects.join(git_status.set_index('project'), on='name')

    projects_final.to_csv("data/projects-db-final.csv", index=False)

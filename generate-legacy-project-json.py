# Compare with projects.json from tomwhite.github.com
# The plan is to retire projects.json and replace with projects-db.csv
import json
import pandas as pd

if __name__ == "__main__":
    df = pd.read_csv("data/projects-db.csv")
    df = df[df["published"] == "Y"]
    df = df[["name", "description", "homepage", "html_url", "topics", "date"]]
    df = df.sort_values(by=["date"], ascending=False)
    j = df.to_json(orient="records")
    parsed = json.loads(j)
    with open("data/projects-generated.json", mode="w") as f:
        json.dump(parsed, f, indent=2)

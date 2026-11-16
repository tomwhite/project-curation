# Project Curation

Curating, publishing, and visualizing my projects

## Web pages

Run `python -m http.server`

## Updating the data

Python scripts declare their dependencies inline, so no venv is needed.

### Project database

* Update the [Projects DB spreadsheet](https://docs.google.com/spreadsheets/d/1ZIM1VVZgo9rpyjtbJWgUkX1gUMwzMc7FVnYDvrOsSTw/edit?gid=0#gid=0).
    * Run `ls -lt ~/projects-workspace | head` to see if there are any new projects.
    * Download as csv
    * `mv ~/Downloads/Projects\ DB\ -\ Sheet1.csv data/projects-db.csv`

### Everything else

```shell
./update.sh
```

This pulls the work repos, regenerates the commit counts and git status, and rebuilds
`projects-db-final.csv` and `projects-generated.json`. To compare the legacy projects.json:

```shell
diff data/projects-generated.json ../tomwhite.github.com/projects/projects.json
```

The individual steps, if you want to run one on its own:

```shell
./git-commits-all.sh > data/git-commits.csv # git commit counts by project and date
./git-commits-work.sh > data/git-commits-work.csv # git commit counts for work projects (in repos/) by project and date
./git-status.sh > data/git-status.csv # whether project is in local git and github
./post-process-db.py # add git status to projects DB -> data/projects-db-final.csv
./generate-legacy-project-json.py # -> data/projects-generated.json
```

## More queries

```shell
./github-not-forked.sh # on github but not forked
./git-dirty.sh  # dirty git status
./projects-by-commit-weeks.py # projects sorted by number of weeks with commits
```

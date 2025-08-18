# Project Curation

Curating, publishing, and visualizing my projects

## Web pages

Run `python -m http.server`

### Project database

* Update the [Projects DB spreadsheet](https://docs.google.com/spreadsheets/d/1ZIM1VVZgo9rpyjtbJWgUkX1gUMwzMc7FVnYDvrOsSTw/edit?gid=0#gid=0).
    * Run `ls -lt ~/projects-workspace | head` to see if there are any new projects.
    * Download as csv
    * `mv ~/Downloads/Projects\ DB\ -\ Sheet1.csv data/projects-db.csv`

### Git commits

* Update the commits csv (see `git-commits.sh` command below)
* Update projects DB with git status:

```shell
python post-process-db.py
```

* Regen legacy projects.json

```shell
python generate-legacy-project-json.py
cp data/projects-generated.json ../tomwhite.github.com/projects/projects.json
```

## More queries

```shell
./github-not-forked.sh # on github but not forked
./git-dirty.sh  # dirty git status
./git-commits-all.sh > data/git-commits.csv # git commit counts by project and date
./git-status.sh > data/git-status.csv # whether project is in local git and github
```

```shell
./git-commits-work.sh > data/git-commits-work.csv # git commit counts for work projects by project and date
sed -i '' 's/hadoop-pre-HADOOP-4687/hadoop/' data/git-commits-work.csv
```

# Project Curation

Curating, publishing, and visualizing my projects

## Web pages

### Project database

* Update the [Projects DB spreadsheet](https://docs.google.com/spreadsheets/d/1ZIM1VVZgo9rpyjtbJWgUkX1gUMwzMc7FVnYDvrOsSTw/edit?gid=0#gid=0).
    * Run `ls -lt ~/projects-workspace | head` to see if there are any new projects.
    * Download as csv
    * `mv ~/Downloads/Projects\ DB\ -\ Sheet1.csv data/projects-db.csv`


## Location

```shell
./no-git.sh # list projects that are not in git
./no-github.sh # git but not github
./github.sh # on github
```

### Counts

```shell
ls -ld ../* | wc -l
./no-git.sh | wc -l
./no-github.sh | wc -l
./github.sh | wc -l
```

## More queries

```shell
./github-not-forked.sh # on github but not forked
./git-dirty.sh  # dirty git status
./git-commits.sh > data/git-commits.csv # git commit counts by project and date
```

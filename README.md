# Project Curation

Curating, publishing, and visualizing my projects

```shell
./no-git.sh # list projects that are not in git
./no-github.sh # git but not github
./github.sh # on github
```

Counts

```shell
ls -ld ../* | wc -l
./no-git.sh | wc -l
./no-github.sh | wc -l
./github.sh | wc -l
```

More queries

```shell
./github-not-forked.sh # on github but not forked
./git-dirty.sh  # dirty git status
./git-commits.sh > data/git-commits.csv # git commit counts by project and date
```

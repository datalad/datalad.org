#!/bin/bash
# This script was converted using cast2script from:
# /home/mih/hacking/datalad/git/docs/casts/seamless_nested_repos.sh
set -e -u
export GIT_PAGER=cat

# DataLad makes a tree of nested Git repositories feel like a big
# monorepo...

# Let's create a root dataset
datalad create demo
cd demo

# Any DataLad dataset is just a Git repo with some initial
# configuration
git log --oneline

# We can nest datasets, by telling DataLad to register a new dataset
# in a parent dataset
datalad create -d . sub1

# A subdataset is a regular Git submodule
git submodule

# Datasets can be nested arbitrarily deep
datalad create -d . sub1/justadir/sub2

# Unlike Git, DataLad automatically takes care of committing all
# changes associated with the added subdataset up to the given
# parent dataset
datalad status

# Let's create some content in the deepest subdataset
mkdir sub1/justadir/sub2/anotherdir
touch sub1/justadir/sub2/anotherdir/afile

# Git only reports changes within a repository, in the case the
# whole subdataset
git status

# DataLad considers the entire tree
datalad status -r

# Like Git, it can report individual untracked files, but also across
# repository boundaries
datalad status -r --untracked all

# Adding this new content with Git or git-annex would be an exercise
git add sub1/justadir/sub2/anotherdir/afile || true

# Again, DataLad does not require users to determine the correct
# repository
datalad save -d . sub1/justadir/sub2/anotherdir/afile

# All associated changes in the entire dataset tree were committed
datalad status

# DataLad's 'diff' is able to report the changes from these related
# commits throughout the repository tree
datalad diff -r -f @~1

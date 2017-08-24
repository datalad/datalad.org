#!/bin/bash
# This script was converted using cast2script from:
# docs/casts/simple_provenance_tracking.sh
set -e -u
export GIT_PAGER=cat

# It is often helpful to keep track of the origin of data files. When
# generating data from other data, it is also useful to know what
# process led to these new data, and what inputs were used.

# DataLad can be used to keep such a record...

# We start with a dataset
datalad create demo
cd demo

# Let's say we are taking a mosaic image composed of flowers from
# Wikimedia, and extract some of them into individual files -- maybe
# to use them in an art project later.

# We can use git-annex to obtain this image straight from the web
git annex addurl https://upload.wikimedia.org/wikipedia/commons/a/a5/Flower_poster_2.jpg --file sources/flowers.jpg

# We save it in the dataset
datalad save -m 'Added flower mosaic from wikimedia'

# Now we can use DataLad's 'run' command to process this image,
# and extract one of the mosaic tiles into its own JPEG file.
datalad run convert -extract 1522x1522+0+0 sources/flowers.jpg flower1.jpg

# All we have to do, is to prefix ANY command with 'datalad
# run'. DataLad will inspect the dataset after the command finished,
# and save all modifications.

# In order to reliably detect modifications, a dataset must not
# contain unsaved modifications prior running a command
touch dirt
datalad run convert -extract 1522x1522+1470+1470 sources/flowers.jpg flower2.jpg || true

# It has to be clean
rm dirt
datalad run convert -extract 1522x1522+1470+1470 sources/flowers.jpg flower2.jpg

# Every processing step is saved in the dataset, including the exact
# command, and the content that was changed.
git show --stat

# On top of that, the origin of any dataset content obtained from
# elsewhere is on record too
git annex whereis sources/flowers.jpg

# Based on this information, we can always reconstruct how any data
# file came to be -- across the entire life-time of a project
git log --oneline @~3..@
datalad diff --revision @~3..@

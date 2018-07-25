#!/bin/bash
# This script was converted using cast2script from:
# docs/casts/basic_search.sh
set -e -u
export GIT_PAGER=cat

# DataLad allows to aggregate dataset-level meta-data, i.e. data
# describing the dataset (description, authors, etc), from a variety
# of formats (see http://docs.datalad.org/en/latest/metadata.html
# for more info).

# In this example we will start from a point where someone who has
# not used datalad before decided to find datasets which related to
# "raiders" (after "Raiders of the Lost Ark" movie) and neuroimaging.

# As you will see below, upon the very first invocation of
# "datalad search" command, DataLad will need first to acquire
# aggregated meta-data for our collection of datasets available at
# http://datasets.datalad.org and for that it will install that top
# level super-dataset (a pure git repository) under ~/datalad:
datalad search raiders neuroimaging

# "search" searches within current dataset (unless -d option is used),
# and if it is outside of any it would offer to search within the
# ~/datalad we have just installed
datalad search raiders neuroimaging

# To avoid interactive question, you can specify to search within
# that dataset by using -d /// . And now let's specialize the search
# to not only list the dataset location, but also report the fields
# where match was found.  This time let's search for datasets with
# Haxby among the authors
datalad search -d /// -s author -R haxby

# For convenience let's switch to that directory, and now all result
# paths to datasets (not yet installed) would be relative to current
# directory
cd ~/datalad
datalad search -s author -R haxby

# Instead of listing all matching fields, you could specify which
# fields to report using -r option (using * would list all of them)
datalad search -s author -r name -r author Haxby

# Enough of searching!  Let's actually get all those interesting
# datasets (for now without all the data) we found.

# We could easily do that by passing those reported path as arguments
# to datalad install command
datalad search -s author haxby | xargs datalad install

# and explore what we have got
datalad ls -Lr . | grep -v 'not installed'
cat openfmri/ds000105/dataset_description.json

# and get data we are interested in, e.g. all the anatomicals within
# those installed BIDS datasets
datalad get -J4 openfmri/ds000*/sub-*/anat
datalad ls -Lr . | grep -v 'not installed'

# Now it is your turn to find some interesting datasets for yourself!

#!/bin/bash
# This script was converted using cast2script from:
# ../git/docs/casts/boxcom.sh
set -e -u
export GIT_PAGER=cat

# Many people that need to exchange data use cloud storage services.

# One of these services is 'box.com' -- they offer similar features
# as dropbox, but provide more storage for free (10GB at the moment)

# Here is how DataLad can be configured to use box.com for data
# storage and exchange...

# For the purpose of this demo, we'll set up a dataset that contains
# a 1MB file with some random binary data
datalad create demo
cd demo
datalad run dd if=/dev/urandom of=big.dat bs=1M count=1

# Next we configure box.com as a remote storage location, using a
# git-annex command.

# Git-annex requires the login credentials to be given as environment
# variables. This demo uses a script that hides the real credentials
# and give some fake output to illustrate the basic idea
. ~/box.com_work.sh

# Now for the actual box.com configuration.

# Key argument is the access URL: 'team/project_one' is where the
# data will be stored in the box.com account.
git annex initremote box.com type=webdav url=https://dav.box.com/dav/team/project_one chunk=50mb encryption=none

# The 'chunk' and 'encryption' arguments further tailor the
# setup. Files will be automatically split into chunks less than
# 50MB. This make synchronization faster, and allows for storing really
# large files. File can be encrypted before upload to prevent access
# without a secure key -- for this demo we opted to not use encryption

# The next step is optional

# We set up a (possibly private) GitHub repo to exchange/synchronize
# the dataset itself (but not its data). If you just want to have
# off-site data storage, but no collaboration with others, this is
# not needed

# For this demo we opt to create the dataset at
# github.com/datalad/exchange-demo
datalad create-sibling-github --github-organization datalad --publish-depends box.com --access-protocol ssh exchange-demo

# We configured DataLad to automatically copy data over to box.com
# when the dataset is published to GitHub, so we can achieve both in
# one step:
datalad publish --to github big.dat
git annex whereis

# The data file was automatically copied to box.com

# Now let's see how a collaborator could get access to the data(set)

# Anyone with permission to access the dataset on GitHub can install it
cd ../
datalad install -s git@github.com:datalad/exchange-demo.git fromgh

# DataLad has reported the presence of a storage sibling 'box.com'

# Anyone with permission to access a box.com account that the original
# box.com folder has been shared with can get access to the stored
# content
datalad siblings -d ~/fromgh enable -s box.com

# If DataLad does not yet know about a user's box.com account,
# the above command would have prompted the user to provide access
# credentials

# Let's confirm that the newly installed dataset is only aware of
# the GitHub and box.com locations
cd fromgh
git remote -v

# Now we can obtain the data file, without having to worry about
# where exactly it is hosted
datalad get big.dat
ls -sLh big.dat

# Similar configurations are possible for any data
# storage solutions supported by git-annex. See
# https://git-annex.branchable.com/special_remotes for more info.

#!/bin/bash
# This script was converted using cast2script from:
# docs/casts/reproducible_analysis.sh
set -e -u
export GIT_PAGER=cat

# Scientific studies should be reproducible, and with the increasing
# accessibility of data, there is not much excuse for lack of
# reproducibility anymore.

# DataLad can help with the technical aspects of reproducible
# science...

# It always starts with a dataset
datalad create demo
cd demo

# For this demo we are using two public brain imaging datasets that
# were published on OpenFMRI.org, and are available from DataLad's
# datasets.datalad.org
datalad install -d . -s ///openfmri/ds000001 inputs/ds000001

# BTW: '///' is just short for http://datasets.datalad.org
datalad install -d . -s ///openfmri/ds000002 inputs/ds000002

# Both datasets are now registered as subdatasets, and their precise
# versions are on record
datalad --output-format '{path}: {revision_descr}' subdatasets

# However, very little data were actually downloaded (the full datasets
# are several gigabytes in size):
du -sh inputs/

# DataLad datasets are fairly lightweight in size, they only contain
# pointers to data and history information in their minimal form.

# Both datasets contain brain imaging data, and are compliant with
# the BIDS standard. This makes it really easy to locate particular
# images and perform analysis across datasets.

# Here we will use a small script that performs 'brain extraction'
# using FSL as a stand-in for a full analysis pipeline
mkdir code
cat << EOT > code/brain_extraction.sh
# enable FSL
. /etc/fsl/5.0/fsl.sh

# obtain all inputs
datalad get \$@
# perform brain extraction
count=1
for nifti in \$@; do
  subdir="sub-\$(printf 000 \$count)"
  mkdir -p \$subdir
  echo "Processing \$nifti"
  bet \$nifti \$subdir/anat -m
  count=\$((count + 1)) 
done
EOT

# Note that this script uses the 'datalad get' command which
# automatically obtains the required files from their remote source --
# we will see this in action shortly

# We are saving this script in the dataset. This way we will know
# exactly which code was used for the analysis. Also, we track this
# code file with Git, so we can see more easily how it was edited
# over time.
datalad add code -m "Brain extraction script" --to-git

# In addition, we will "tag" this state of the dataset. This is
# optional, but it can help to identify important milestones more
# easily
datalad save --version-tag setup_done

# Now we can run our analysis code to produce results. However, instead
# of running it directly, we will run it with DataLad -- this will
# automatically create a record of exactly how this script was executed

# For this demo we will just run it on the structural images of
# the first subject from each dataset. The uniform structure of the
# datasets makes this very easy. Of course we could run it on all
# subjects; we are simply saving some time for this demo.

# While the command runs, you should notice a few things:

# 1) We run this command with 'bash -e' to stop at any failure that
# may occur

# 2) You'll see the required data files being obtained as they
# are needed -- and only those that are actually required will be
# downloaded
datalad run bash -e code/brain_extraction.sh inputs/ds*/sub-01/anat/sub-01_T1w.nii.gz

# The analysis step is done, all generated results were saved in the
# dataset. All changes, including the command that caused them are
# on record
git show --stat

# DataLad has enough information stored to be able to re-run a command.

# On command exit, it will inspect the results and save them gain,
# but only if they are different.

# In our case, the re-run yields bit-identical results, hence nothing
# new is saved.
datalad run --rerun

# Now that we are done, and have checked that we can reproduce the
# results ourselves, we can clean up

# DataLad can easily verify if any part of our input dataset was
# modified since we configured our analysis
datalad diff --revision setup_done inputs

# Nothing was changed.

# With DataLad with don't have to keep those inputs around -- without
# losing the ability to reproduce an analysis.

# Let's uninstall them -- checking the size on disk before and after
du -sh
datalad uninstall inputs/*
du -sh .

# All inputs are gone...
ls inputs/*

# Only the remaining data (our code and the results) need to be kept
# and require a backup for long term archival. Everything else can
# be re-obtained as needed, when needed.

# As DataLad knows everything needed about the inputs, including where
# to get the right version, we can re-run the analysis with a single
# command. Watch how DataLad re-obtains all required data, re-runs
# the code, and checks that none of the results changed and need saving
datalad run --rerun

# Reproduced!

# This dataset could now be published and enable anyone to replicate
# the exact same analysis. Public data for the win!

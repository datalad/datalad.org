#!/bin/bash
# This script was converted using cast2script from:
# docs/casts/heudiconv_dicom_to_bids.sh
set -e -u
export GIT_PAGER=cat
set -eu  # Fail early if any error happens

# Heudiconv (Heuristic DICOM Converter,
# https://github.com/nipy/heudiconv) now allows to create DataLad
# datasets with your neuroimaging data as soon as it comes from the
# MRI scanner.

# In this example we will use a heudiconv heuristic developed and used
# at DBIC (Dartmouth Brain Imaging Center) to have all collected data
# made available as BIDS datasets. See http://goo.gl/WEoCge describing
# the naming convention.

# We will demonstrate it on some data acquired on a phantom, mimicking
# multiple studies/subjects/sessions setup, and already available
# through datalad:
datalad install -r -g -J4 ///dicoms/dartmouth-phantoms/bids_test4-20161014

# We will now run heudiconv pointing to DBIC heuristic on data for the
# first five sessions (could be done one scanning session at a time,
# or entire directory as well), while instructing heudiconv to place
# produced data under DataLad control.

# First we will download the heuristic file from heudiconv's
# repository:
wget https://raw.githubusercontent.com/nipy/heudiconv/master/heuristics/dbic_bids.py

# and then run heudiconv instructing to process multiple sessions,
# and place all converted data under a dataset called 'demo' (for
# the purpose of the demo we will convert only all anatomicals):
heudiconv --bids --datalad -f ./dbic_bids.py -o demo bids_test4-20161014/phantom-[1-5]/*{scout,T1w}*

# Heudiconv has created a hierarchy of DataLad datasets, with levels
# PI/Researcher/study
datalad ls -r demo

# where separate scanning sessions detected by heudiconv were
# contributed as separate commits to the sub-dataset corresponding
# to the specific study (as discovered from 'Study Description'
# field in DICOM):
cd demo/Halchenko/Yarik/950_bids_test4
git log --pretty=oneline

# Not only that all DICOMs were converted into a BIDS-compliant
# dataset, this heuristic also provided templates for mandatory files
# in BIDS format, some of which were placed directly under git to
# ease modification and integration of changes:
cat dataset_description.json

# and you can easily find files/fields which need adjustment with
# information only you might know (design, author, license, etc)
# by searching for TODO
git grep TODO

# All binary data and otherwise 'sensitive' files (e.g. _scans.tsv
# files) where placed under git-annex control:
git annex list

# Original DICOMS, converted anatomicals (which are not yet defaced),
# and _scans.tsv files also obtained a meta-data tag to allow easy
# identification of data which did not go through anonimization step
# yet and might potentially contain subject-identifying information:
datalad metadata sourcedata/sub-phantom1sid1

# These datasets are ready to be installed from this location to the
# processing box. In the demo we will just perform it on the localhost
# and only for the current study since sub-datasets are independent
# of their supers:
datalad install -g -r -s localhost:$PWD ~/950_bids_test4-process
cd ~/950_bids_test4-process

# Data now could be processed/analyzed/etc in this dataset 'sibling'.

# According to BIDS derivative (e.g. preprocessed) data should reside
# under derivatives/, so we create a new subdataset
datalad create -d . derivatives/preprocess1

# and do our thorough preprocessing (see
# http://bids-apps.neuroimaging.io for ready to use pipelines like
# mriqc and fmriprep), in our case a sample brain extraction:
source /etc/fsl/fsl.sh   # to enable FSL on NeuroDebian systems
mkdir -p derivatives/preprocess1/sub-phantom1sid1/ses-localizer/anat/  # create target output directory
bet {,derivatives/preprocess1/}sub-phantom1sid1/ses-localizer/anat/sub-phantom1sid1_ses-localizer_T1w.nii.gz

# To keep control over the versions of all data we work with, we add
# results of pre-processing under DataLad version control
datalad add -m 'added initial preprocessing (well -- BETing output)' derivatives/preprocess1/*

# and then also adjust meta-data templates heudiconv pre-generated
# for us:
sed -i -e 's,First1 Last1,Data Lad,g' -e '/TODO/d' dataset_description.json

# We save all so far accumulated changes
datalad save -m 'Finished initial preprocessing, specified PI in dataset description and removed TODOs.'

# Whenever more data is acquired, heudiconv conversion could be ran
# again to complement previously acquired datasets with new data.
cd
heudiconv --bids --datalad -f ./dbic_bids.py -o demo bids_test4-20161014/phantom-[6-9]/*{scout,T1w}*

# Now we can go to the processing 'box' again and update the entire
# hierarchy (in our case actually just one but we could have cloned
# entire tree for a PI) of the datasets while incorporating with
# possible changes already done on the processing box, while git
# would track the entire history of modifications.
cd ~/950_bids_test4-process
datalad update --merge -r
git status  # all clear
cat dataset_description.json  # and our changes are still in place

# Now you could process newly acquired data... rinse repeat, while
# keeping the full history of actions:
git log --pretty=oneline

# See also demos on how data could be exported and/or published
# whenever you are ready to share it publicly or with your
# collaborators.

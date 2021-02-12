#!/bin/bash
# This script was converted using cast2script from:
# docs/casts/track_data_from_webpage.sh
set -e -u
export GIT_PAGER=cat

# With a few lines DataLad is set up to track data posted on a website,
# and obtain changes made in the future...

# The website http://www.fmri-data-analysis.org/code provides code
# and data file for examples in a text book.

# We will set up a dataset that DataLad uses to track the content
# linked from this webpage

# Let's create the dataset, and configure it to track any text file
# directly in Git. This will make it very convenient to see how source
# code changed over time.
datalad create --text-no-annex demo
cd demo

# DataLad's crawler functionality is used to monitor the webpage. It's
# configuration is stored in the dataset itself.

# The crawler comes with a bunch of configuration templates. Here we
# are using one that extract all URLs that match a particular pattern,
# and obtains the linked data. In case of this webpage, all URLs of
# interest on that page seems to have 'd=1' suffix
datalad crawl-init --save --template=simple_with_archives url=http://www.fmri-data-analysis.org/code 'a_href_match_=.*d=1$'
datalad diff --revision @~1
cat .datalad/crawl/crawl.cfg

# With this configuration in place, we can ask DataLad to crawl
# the webpage.
datalad crawl

# All files have been obtained and are ready to use. Here is what
# DataLad recorded for this update
git show @ -s

# Any file from the webpage is available locally.
ls

# The webpage can be queried for potential updates at any time by
# re-running the 'crawl' command.
datalad crawl

# Files can be added, or removed from this dataset without impairing
# the ability to get updates from the webpage. DataLad keeps the
# necessary information in dedicated Git branches.
git branch

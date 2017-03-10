Bits from DataLad #1
********************

:date: 2014-10-02 21:15
:date: 2014-10-11 01:00
:slug: bits_1
:tags: development, bits
:author: Yaroslav Halchenko
:summary: Summary report of recent activities

Welcome to the first, what we hope would be monthly, summary of the
DataLad project activities and development.  September of 2014 was the
first official month of the project for the US side (Yaroslav
Halchenko at Dartmouth College) and we hope that German side (Michael
Hanke at Magdeburg) will be cleared out to start in December 2014.
Because of being the first month, it was heavily organizational (going
through necessary paper works for the collaborators, deciding and
obtaining quotes for some hardware) and bootstrapping for the upcoming
development. Luckily this month coincided with my trip to Germany,
where with Michael we taught PyMVPA course at Giessen.  It gave us an
ample opportunity to have productive few days discussing various
aspects of the DataLad project, the most burning issue was to choose a
...

New project name
================

Originally we have called the project DataGit.  And instead of staying
ignorantly blessed of possible trademark issues with using Git in our
project name, I have sent out an inquiry to the software freedom
conservancy early in this year.  Unfortunately whenever they reached
back to us, we were denied use of Git as in DataGit name for our
project.  After considering few dozens of alternative names, gaining
and then surrendering rights for another tentative name on GitHub, we
have called our project DataLad.  So now you can find us on `twitter
<http://twitter.com/datalad>`_, `GitHub <http://github.com/datalad>`_,
`Google groups <https://groups.google.com/forum/#!forum/datalad>`_,
etc.  We hope you will get to like the name, and we will come up with
a beautiful project logo soonish.  Meanwhile enjoy a functional
colorful qrcode you might find associated with DataLad on those pages.


Re-Design
=========

With the original design (or actually the lack of such) of the DataLad
crawl command, it is already capable of easily specifying (continuous)
scraping of arbitrary websites to get their data fetched and committed
to Git/Git-annex repository.  Unfortunately such original code was
more of a prototype to try hands-on and identify additional use-cases
and possible implementation approaches.  `A new design sketch
<datalad_crawl_design>`_ formalizes a viable approach on how to
establish more flexible specification and design which could address
majority of discovered use-cases.  Further brainstorming and actual
coding will be initiated soon to provide initial re-implementation.
Meanwhile, `DataLad on Github <http://github.com/datalad/datalad>`_
obtained `integration with Travis-CI and coveralls.io
<https://github.com/datalad/datalad/#code-status>`_ -- apparently we
are at 85% coverage of the codebase, not bad at all for starters.  So
you are welcome to submit pull requests without a fear of breaking our
*beautiful code*.


Use-cases
=========

A very important part of this project is also to identify cases of
git-annex use specific to managing and sharing scientific data.  We
are happy to have git-annex author, Joey Hess, on board helping us to
where possibly resolve then without creating workarounds in the
DataLad land.  One of the interesting use cases was to `Facilitate
space-efficient throw-away clones (GH#1)
<https://github.com/datalad/datalad/issues/1>`_ -- now if you clone
git-annex repository within the same drive using `git clone --shared`
on a modern file system, you can benefit from hard-linking of the key
store content.  We invite you to browse `the other issues
<https://github.com/datalad/datalad/issues?q=label%3Agit-annex+is%3Aissue+>`_
we have identified (such as "upgrade" operation for existing files)
which might find a reasonable resolution at the git-annex level.

If you are looking for a real rich neuroimaging dataset to get your
hands dirty and identify more of new use-cases you would like to get
addressed, consider playing with or analyzing the
http://www.studyforrest.org dataset on auditory perception.

OpenfMRI
--------

`OpenfMRI.org <http://openfmri.org>`_ (PI: R. Poldrack, supported by
NSF as well) is a great data resource collating data from a growing
number of studies.  It also works on unification of data layout across
studies, and providing multiple ways to download the data (tarballs +
plain files from AWS S3).  We have been in touch with OpenfMRI folks
helping to iron out detected by us glitches among provided files.
Also another little `issue
<https://github.com/datalad/datalad/issues/8>`_ we are yet to tackle
is to efficiently invoke re-computation of ETags which would be great
to have corresponding to files' md5sums.

XNAT
----

`XNAT <http://www.xnat.org>`_ is the most well established informatics
platform in neuroimaging.  It is behind
https://db.humanconnectome.org, http://www.nitrc.org/ir and other
portals, and that is why on our radar for this project. In a
video-conference with XNAT developers I have presented a high-level
design and goal behind DataLad project and we had initial discussion
on possible ways to obtain desired for us data versioning (currently
absent in XNAT) and access schemes.  Further discussion will happen or
be referenced at `GH#2 issue
<https://github.com/datalad/datalad/issues/2>`_.  Related discussion is
also on `providing interface to Aspera client
<https://github.com/datalad/datalad/issues/5>`_ to facilitate efficient
data download schemes with git-annex/DataLad.

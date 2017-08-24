Get DataLad
###########
:save_as: get_datalad.html
:url: /get_datalad.html

Binaries are provided for for Debian and Ubuntu (see below). For all other
systems, DataLad can easily be installed via pip_. To automatically install
DataLad and its software dependencies type ::

  pip install datalad

.. _pip: https://pip.pypa.io

In addition, it is necessary to have a recent version of git-annex_ installed,
which is not set up automatically by using the pip method.

.. _git-annex: http://git-annex.branchable.com

Advanced users can chose from several installation schemes (e.g.
``publish``, ``metadata``, ``tests`` or ``crawl``)::

  pip install datalad[SCHEME]

where ``SCHEME`` could be

- ``crawl`` to also install `scrapy` which is used in some crawling constructs
- ``tests`` to also install dependencies used by unit-tests battery of the DataLad
- ``full`` to install all dependencies

(Neuro)Debian, Ubuntu, and similar systems
------------------------------------------

For Debian-based operating systems, the most convenient installation method
is to enable the NeuroDebian_ repository. The following command installs DataLad
and all its software dependencies (including the git-annex-standalone package)::

  sudo apt-get install datalad

.. _neurodebian: http://neuro.debian.net

OS X
----

A simple way to install packages on OS X is via the homebrew_ package manager.
git-annex is installed by the command ::

  brew install git-annex

Once git-annex is available, DataLad can be installed via ``pip`` as described
above. ``pip`` comes with Python distributions, such as anaconda_.

.. _homebrew: http://brew.sh
.. _anaconda: https://www.continuum.io/downloads

Why DataLad?
************
:save_as: about.html
:url: /about.html

When publishing data, merely providing file access is insufficient for a simple
reason: data are not static. Released data often (and should!) continue to
evolve; file formats can change, bugs will be fixed, new data are added, and
derived data needs to be integrated.

While version control systems are a de-facto standard for open source software
development, a similar level of tooling and culture is not present in the open
data community.

DataLad builds on top of `git-annex`_ and extends it with an intuitive
command-line interface. It enables users to operate on data using familiar
concepts, such as files and directories, while transparently managing data
access and authorization with underlying hosting providers.

A powerful and complete Python API is also provided to enable authors of
data-centric applications to bring versioning and the fearless acquisition of
data into continuous integration workflows.

From the Makers of
==================

.. raw:: html

    <div id="makers">
      <a href="http://neuro.debian.net"><img src="/img/logo/neurodebian.png" alt="NeuroDebian logo"></a>
      <a href="http://www.pymvpa.org"><img src="/img/logo/pymvpa.png" alt="PyMVPA logo"></a>
      <a href="http://studyforrest.org"><img src="/img/logo/studyforrest.png" alt="Studyforrest logo"></a>
    </div>

Acknowledgments
===============
A US-German collaboration for a computational neuroscience (CRCNS)
project. *DataGit: converging catalogues, warehouses, and deployment
logistics into a federated "data distribution"*
(`Halchenko <http://haxbylab.dartmouth.edu/ppl/yarik.html>`_ /
`Hanke <http://www.psychoinformatics.de>`_), co-funded by
the US National Science Foundation
(`NSF 1429999 <http://www.nsf.gov/awardsearch/showAward?AWD_ID=1429999>`_)
and the German Federal Ministry of Education and Research (BMBF 01GQ1411).

.. raw:: html

    <div id="ack">
      <a href="https://www.nsf.gov"><img src="/img/logo/nsf.png" alt="NSF logo"></a>
      <a href="https://www.dartmouth.edu"><img src="/img/logo/dartmouth.png" alt="Dartmouth logo"></a>
      <a href="https://www.bmbf.de"><img src="/img/logo/bmbf.png" alt="BMBF logo"></a>
      <a href="http://www.ovgu.de"><img src="/img/logo/ovgu.png" alt="OvGU logo"></a>
    </div>

.. _git-annex: http://git-annex.branchable.com
.. _git: http://git-scm.com

Datasets
********
:save_as: datasets.html
:url: /datasets.html

DataLad can track any data files that are published on the web. It is able
to monitor and incorporate modifications made to such data sources over time,
and to `publish </features.html#data-sharing>`_ entire distributions of datasets created by this
`automated process </features.html#for-data-consumers>`_.
The DataLad team maintains `data trackers
<https://github.com/datalad/datalad/tree/master/datalad/crawler/pipelines>`__
for a number of public data portals.

Such automatically generated and some manually created and curated
datasets were then collated into a
`DataLad superdataset <http://docs.datalad.org/en/latest/glossary.html#superdataset>`_.
Generated superdataset was then published in its entirety
publicly at http://datasets.datalad.org, thus establishing the "official" DataLad
data distribution (datalad resource identifier `/// <http://datasets.datalad.org>`__).  Note that to download data
for some of those datasets (e.g. `///crcns <http://datasets.datalad.org/?dir=/crcns>`_),
you might still need to provide authentication credentials, but otherwise access to them is
completely uniform regardless of the data origin.  DataLad has also aggregated
datasets' `metadata <http://docs.datalad.org/en/latest/metadata.html>`_
allowing for efficient `search </features.html#data-discovery>`_.

At present, our official distribution offers uniform access to over
10TB of scientific data. Here is a sample of dataset sources with their DataLad
resource identifiers you could pass to `datalad install
<http://docs.datalad.org/en/latest/generated/man/datalad-install.html>`_
command:

- `OpenFMRI <https://openfmri.org>`_ -- `///openfmri <http://datasets.datalad.org/?dir=/openfmri>`__
- `NeuroVault <https://neurovault.org>`_ --
  `///neurovault <http://datasets.datalad.org/?dir=/neurovault>`__
- `International Neuroimaging Data-sharing Initiative (INDI) <http://fcon_1000.projects.nitrc.org>`_ --
  `///indi <http://datasets.datalad.org/?dir=/indi>`__
- `Healthy Brain Network Serial Scanning Initiative (HBN-SSI) <http://fcon_1000.projects.nitrc.org/indi/hbn_ssi/>`_ --
  `///hbnssi <http://datasets.datalad.org/?dir=/hbnssi>`__
- `Data sharing for Collaborative Research in Computational Neuroscience (CRCNS.org) <http://crcns.org>`_ --
  `///crcns <http://datasets.datalad.org/?dir=/crcns>`__
- several individual research labs --
  `///labs <http://datasets.datalad.org/?dir=/labs>`__
- ... many more ... --  `/// <http://datasets.datalad.org>`__


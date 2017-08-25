Features
********
:template: asciinema
:save_as: features.html
:url: /features.html

.. raw:: html

   <ul>
     <li><a href="#data-discovery">Data Discovery</a></li>
     <li><a href="#for-data-consumers">Data Consumption</a></li>
     <li><a href="#data-sharing">Data Sharing</a></li>
     <li><a href="#for-git-and-git-annex-users">For Git Users</a></li>
     <li><a href="#reproducible-science">Reproducible Science</a></li>
     <li><a href="#automation-and-control-of-data-acquisition">Automation and Control of Data Acquisition</a></li>
   </ul>

Data Discovery
##############

With the growing quantities and variety of data, it is getting progressively
harder to determine whether and where given data are available. DataLad
aids data discovery through a built-in, extensible system for automated metadata
extraction and homogenization.

Being a tool for decentralized data management, DataLad does not require a
central service to perform metadata queries. Instead, any DataLad installation
provides all the necessary functionality to automatically index and search any
data it was made aware of — whether it's one's personal data, the data of an
entire lab, all the data of an institution, or a complete public data portal.

The following demo shows how one can quickly find desired datasets,
install them, and selectively obtain necessary files across multiple datasets.

.. raw:: html

    <asciinema-player src="/asciicast/basic_search.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/basic_search.sh">Download this demo's script</a></div>


For Data Consumers
##################

Data are key to many applications, and while an enormous amount of data is
available, it is all-too-often impossible for interested parties to consume the
relevant pieces efficiently, become aware when any part of it changes,
and why it changed.

For a growing number of data portals, the DataLad team provides `native
DataLad datasets </datasets.html>`__ that offer fine-grained access to current
and historic version of many datasets.

However, the vast majority of all available data are scattered around the web
using an incomprehensible variety of sites, access methods, and formats. In
order to help mitigate this complexity, DataLad provides tools to
monitor non-DataLad data sources on the web. With these tools, DataLad users
are able to track their changes over time, curate them, and even re-publish
them as native DataLad datasets.

The following demo shows how one can create a readily usable dataset from data
and code posted on a textbook's companion website.

.. raw:: html

    <asciinema-player src="/asciicast/track_data_from_webpage.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/track_data_from_webpage.sh">Download this demo's script</a></div>

Data Sharing
############

Sharing data, code, and results is a key element of the scientific process.
Sharing comes in many flavors, for example:

1) sharing with yourself, and having certainty that the copy on your laptop
   matches what you have been working with on your workstation;
2) sharing with colleagues, and making sure they all know when data changed and
   which results have to be recomputed; and
3) sharing with the world, to make sure that your work has maximum impact.

DataLad aids many types of sharing efforts. It supports synchronization of
multiple instances of a dataset belonging to a single person. It provides
on-demand updates of datasets shared with local or remote collaborators. It
offers a wide variety of publications methods, ranging from a (cloud) server,
to services such as GitHub, DropBox, or box.com.

The following demo shows...


For Git and git-annex Users
###########################

DataLad is built atop of Git and git-annex, and if you are familiar with these
tools, you should feel at home with DataLad too. DataLad aims to be a unifying
top-level layer that makes working with Git and git-annex easier — without
getting in the way of power-users.

DataLad's most unique feature, compared to Git and git-annex, is its ability to
seamlessly work with an entire tree of nested repositories (i.e. Git submodules).
This is best explained in a brief demo:

.. raw:: html

    <asciinema-player src="/asciicast/seamless_nested_repos.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/seamless_nested_repos.sh">Download this demo's script</a></div>

The following table helps to illustrate which features are contributed by which
technology layer.

================================================  =============  ===============  ==============
Feature                                            Git            git-annex       DataLad
================================================  =============  ===============  ==============
Version control (text, code)                      |chk|          |chk|            |chk|
Version control (binary data)                     (not advised)  |chk|            |chk|
Auto-crawling available resources                                |chk| RSS feeds  |chk| flexible
Unified dataset handling                                                          |chk|
- recursive operation on datasets                                                 |chk|
- seamless operation across datasets boundaries                                   |chk|
- meta-data support                                              |chk| per-file   |chk|
- meta-data aggregation                                                           |chk| flexible
Unified authentication interface                                                  |chk|
================================================  =============  ===============  ==============

.. |chk| raw:: html

   <i class="icon-ok"></i>

Reproducible Science
####################

DataLad is an ideal tool for conducting reproducible science. It can track and
`obtain shared data </for/dataconsumers.html>`__ and `publish results
</for/datasharing.html>`__. Importantly, it jointly manages both analysis input
data and the associated analysis code --- critical to reproduce any analysis.
Lastly, DataLad is able to temporally capture the exact commands used to
produce the results.

All together, DataLad can automatically create an extensive provenance record,
with all the information necessary to rerun an analysis from beginning to end
and demonstrate reproducibility.

Here is a quick demo of how DataLad captures the results derived from input
data. Scroll further down for a more in-depth demo of a full analysis.

.. raw:: html

    <asciinema-player src="/asciicast/simple_provenance_tracking.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/simple_provenance_tracking.sh">Download this demo's script</a></div>

The next demo shows the complete setup, execution, and replication of a brain
imaging analysis on real data — in just five minutes. You'll see how easy it is
to automatically yield a reproducible outcome. It also demonstrates how DataLad
helps to maintain a strict separation of inputs and outputs to clearly identify
what needs to be archived alongside a publication.

.. raw:: html

    <asciinema-player src="/asciicast/reproducible_analysis.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/reproducible_analysis.sh">Download this demo's script</a></div>

Automation and Control of Data Acquisition
##########################################

In MRI research, data typically comes as a set of DICOM files which need to be
first converted to a data format convenient for visualization and analysis,
typically NIfTI. Another step further is to layout and organize the data
according to `BIDS (Brain Imaging Data Structure) <http://bids.neuroimaging.io>`__.
One of the tools available to assist with such conversions is `HeuDiConv
(Heuristic DICOM Converter) <https://github.com/nipy/heudiconv/>`__,
which also has an option to place converted data and pre-generated templates
under DataLad's control. This makes it immediately possible to distribute
collected data across processing infrastructure, track provenance of derived
data, and also updating datasets with more of freshly acquired data while
relying on git's powerful merge mechanisms.

Whenever the data are ready for public sharing, it is a `datalad publish` away,
while also allowing to to easily control and restrict the public release to only
data files which do not carry any possibly subject identifying information
(e.g., non-defaced high-resolution anatomicals).

.. raw:: html

    <asciinema-player src="/asciicast/heudiconv_dicom_to_bids.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/heudiconv_dicom_to_bids.sh">Download this demo's script</a></div>

Features
********
:template: asciinema
:save_as: features.html
:url: /features.html

- `For Data Discovery <#data-discovery>`_
- `For Data Consumption <#for-data-consumers>`_
- `For Data Sharing <#data-sharing>`_
- `For Git Users <#for-git-and-git-annex-users>`_
- `For Reproducible Science <#reproducible-science>`_

Data Discovery
##############

Hakuna Mah'data

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

Share it like it's hot.

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

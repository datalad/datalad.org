DataLad features for Git and git-annex users
********************************************
:template: asciinema
:save_as: for/gitusers.html
:url: /for/gitusers.html

DataLad is built off of Git and git-annex, and if you are familiar with these
tools, you should feel at home with DataLad too. DataLad aims to be a unifying
top-level layer that makes working for Git and git-annex easier, without
getting in the way of power-users.

DataLad's most unique feature, compared to Git and git-annex is its ability to
seamlessly work with an entire tree of nested repositories (i.e. Git submodules).
This is best explained in a brief demo:

.. raw:: html

    <asciinema-player src="/asciicast/seamless_nested_repos.json" cols="80" rows="24"></asciinema-player>


To better illustrate the what features are contributed by which technology layer,
please see the following table.

================================================  =============  ===============  ==============
Feature                                            Git            Git-annex       DataLad
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

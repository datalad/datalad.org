For Git and git-annex Users
***************************
:template: asciinema
:save_as: for/git-users.html
:url: /for/git-users.html

DataLad is built atop of Git and git-annex, and if you are familiar with these
tools, you should feel at home with DataLad too. DataLad aims to be a unifying
top-level layer that makes working with Git and git-annex easier — without
getting in the way of power-users.

DataLad's most unique feature, compared to Git and git-annex, is its ability to
seamlessly work with an entire tree of nested repositories (i.e. Git submodules).
This is best explained in a brief demo:

.. raw:: html

    <asciinema-player src="/asciicast/seamless_nested_repos.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/seamless_nested_repos.sh">Get the script for this demo</a></div>

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
- metadata support                                               |chk| per-file   |chk|
- metadata aggregation                                                            |chk| flexible
Unified authentication interface                                                  |chk|
================================================  =============  ===============  ==============

.. |chk| raw:: html

   <i class="icon-ok"></i>

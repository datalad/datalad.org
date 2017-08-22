Git Users
*********
:save_as: for/gitusers.html
:url: /for/gitusers.html

Although it is possible, and intended, to use DataLad without ever invoking git
or git-annex commands directly, it is useful to appreciate that DataLad is
build atop of very flexible and powerful tools.  Knowing basics of git and
git-annex in addition to DataLad helps to not only make better use of
DataLad but also to enable more advanced and more efficient data management
scenarios. Datalad makes use of lower-level configuration and data structures
as much as possible. Consequently, it is possible to manipulate Datalad
datasets with low-level tools if needed. Moreover, Datalad datasets are
compatible with tools and services designed to work with plain Git repositories,
such as the popular GitHub_ service.

.. _github: https://github.com

To better illustrate the different scopes, the following table provides an
overview of the features that are contributed by each software technology
layer.

================================================  =============  ===============  ==============
Feature                                            Git            Git-annex       DataLad
================================================  =============  ===============  ==============
Version control (text, code)                      |tup|          |tup| can mix    |tup| can mix
Version control (binary data)                     (not advised)  |tup|            |tup|
Auto-crawling available resources                                |tup| RSS feeds  |tup| flexible
Unified dataset handling                                                          |tup|
- recursive operation on datasets                                                 |tup|
- seamless operation across datasets boundaries                                   |tup|
- meta-data support                                              |tup| per-file   |tup|
- meta-data aggregation                                                           |tup| flexible
Unified authentication interface                                                  |tup|
================================================  =============  ===============  ==============

.. |tup| unicode:: U+2713 .. check mark

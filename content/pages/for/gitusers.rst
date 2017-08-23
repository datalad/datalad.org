Git Users
*********
:save_as: for/gitusers.html
:url: /for/gitusers.html

Although it is possible, and intended, to use DataLad without ever invoking git
or git-annex commands directly, it is useful to appreciate that DataLad is
build atop very flexible and powerful tools. Knowing the basics of git and
git-annex in addition to DataLad helps to not only make better use of
DataLad but also to enable more advanced and more efficient data management
scenarios. DataLad makes use of lower-level configuration and data structures
as much as possible. Consequently, it is possible to manipulate DataLad
datasets with low-level tools if needed. By design, DataLad datasets are
compatible with tools and services designed to work with plain Git repositories,
such as the popular GitHub_ platform.

.. _github: https://github.com

To better illustrate the different scopes, the following table provides an
overview of the features that are contributed by each software technology
layer.

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

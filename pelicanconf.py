#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

#
# About the site
#
AUTHOR = 'DataLad Developers'
SITETITLE = 'datalad.org'
# SITESUBTITLE = 'at <a href="http://www.fz-juelich.de/inm/inm-7/EN/Home/home_node.html">Jülich</a>'
SITENAME = 'DataLad'
SITEURL = ''

TIMEZONE = 'Europe/Berlin'
DEFAULT_LANG = 'en'
LOCALE = 'en_US.UTF-8'

#
# Configure Pelican a bit
#
PATH = 'content'
PLUGIN_PATHS = ['pelican-plugins']
PLUGINS = [ 'sitemap' ]
SITEMAP = { 'format': 'xml' }

DIRECT_TEMPLATES = ['404']  # unset all templates; add 404
THEME = 'theme'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None

#
# Configure the site
#
MENUITEMS = (
    ('resources', '#resources'),
    ('use cases', '#integrate'),
    ('install datalad', '#install'),
    ('cite datalad', '#cite'),
)
STATIC_PATHS = ['img/', 'static/']
EXTRA_PATH_METADATA = {
    "static/apple-touch-icon.png": {'path': ''},
    "static/browserconfig.xml": {'path': ''},
    "static/favicon-16x16.png": {'path': ''},
    "static/favicon-32x32.png": {'path': ''},
    "static/favicon.ico": {'path': ''},
    "static/humans.txt": {'path': ''},
    "static/leitfaden.pdf": {'path': ''},
    "static/manifest.json": {'path': ''},
    "static/mstile-150x150.png": {'path': ''},
    "static/robots.txt": {'path': ''},
}



DEFAULT_PAGINATION = False

# We prefer document-relative URLs
RELATIVE_URLS = True

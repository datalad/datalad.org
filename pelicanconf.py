#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

#
# About the site
#
AUTHOR = 'DataLad Developers'
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

THEME = 'theme'
DIRECT_TEMPLATES = []  # unset all templates
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

FEED_ALL_ATOM = None

#
# Configure the site
#
MENUITEMS = (
    ('about', '/#what-is-datalad'),
    ('install', '/#install'),
    ('use cases', '/#use-cases'),
    ('resources', '/#resources'),
    ('cite', '/#cite'),
)

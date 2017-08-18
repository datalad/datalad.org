#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

#
# About the site
#
AUTHOR = u'DataLad Team'
SITENAME = u'DataLad'
SITEURL = ''

TIMEZONE = 'Europe/Berlin'
DEFAULT_LANG = u'en'
LOCALE = u'en_US.UTF-8'

#
# Configure Pelican a bit
#
PLUGIN_PATHS = ['pelican-plugins']
PLUGINS = ['summary', 'liquid_tags.notebook']

THEME = 'theme/'

FEED_ALL_ATOM = None
RELATIVE_URLS = True

#
# Configure the site
#
STATIC_PATHS = ['images', 'pics', 'css', 'js', 'img']
MENUITEMS = [ ('About', '/about.html'),
              ('Development', '/development.html'),
              ('Articles', '/category/articles.html'),
              ('Installation', 'https://github.com/datalad/datalad#installation'),
              ('Datasets', 'http://datasets.datalad.org'),
              ('Docs', 'http://docs.datalad.org'),
]

DEFAULT_PAGINATION = 10

#
# Analytics and Social media
#
ADDTHIS_PROFILE = 'ra-54357285299eeaa8'
ADDTHIS_DATA_TRACK_ADDRESSBAR = False

GOOGLE_ANALYTICS = "UA-55535442-1"

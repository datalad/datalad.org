WWW_DIR = generated
WWW_UPLOAD_HOST=falkor.datalad.org
WWW_UPLOAD_PATH=/srv/datalad.org/www/
RSYNC_OPTS_UP = -rzlhv --delete --copy-links --exclude=_files

all: html

html:
	$(MAKE) -C src html

publish:
	rm -f generated/fonts
	$(MAKE) -C src publish
	ln -ft generated src/static/*

upload: publish
	rsync $(RSYNC_OPTS_UP) $(WWW_DIR)/* $(WWW_UPLOAD_HOST):$(WWW_UPLOAD_PATH)/
	ssh $(WWW_UPLOAD_HOST) chmod -R a+rX $(WWW_UPLOAD_PATH)


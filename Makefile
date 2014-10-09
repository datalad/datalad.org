WWW_DIR = generated
WWW_UPLOAD_URI=datalad.org:/todo
RSYNC_OPTS_UP = -rzlhv --delete --copy-links

all:
	$(MAKE) -C src html

publish:
	rm -f generated/fonts
	$(MAKE) -C src publish
	ln -ft generated src/static/*

upload: publish
	rsync $(RSYNC_OPTS_UP) $(WWW_DIR)/* $(WWW_UPLOAD_URI)/


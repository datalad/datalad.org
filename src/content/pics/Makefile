all:: pics

# Optionally some PICS could be ignored. By default XXX ones.
# PICS_IGNORE must contain a rule for grep
PICS_IGNORE ?= "XXX"
# For every .svg we must have a pdf
#PICS=$(shell find . -iname \*svg \
#	| sed -e 's/svg/pdf/g' -e 's/\([^\]\)\([ \t:]\)/\1\\\\\2/g' \
#	| grep -v -e $(PICS_IGNORE) \
#	| grep -v -e neuropy_history_tuned \
# )
PICS=datalad-openfmri-demo_sw.png timeline2.png

PICS_CONVERTED =

SVGIS=$(shell  find . -iname \*.svgtune | sed -e 's/.svgtune/_tuned/g')

pics: $(PICS) $(SVGIS)

#
# SVGTune
#
%_tuned:: %.svgtune %.svg
	@echo "Splitting SVG using $<"
# Use gqview to prevew svgs -- quite nice
	@../../../tools/svgtune/svgtune $<
# Touch it to adjust the timestamp so make does not think that we are
# out of date later on
	@touch "$@"
# And assure that we have ignore ... cannot be in deps since would cause
# regeneration over and over again
	@$(MAKE) ignore-$@

# we use it inside
datalad-openfmri-demo_tuned:: datalad-openfmri-demo_sw.png

#
# Inkscape rendered figures
#
%.pdf: %.svg ignore-%.pdf
	@echo "Rendering $@"
	@inkscape -z -f "$<" -A "$@"

%.eps: %.svg ignore-%.eps
	@echo "Rendering $@"
	@inkscape -z -T -f "$<" -E "$@"

%.png: %.svg ignore-%.png
	@echo "Rendering $@"
	@inkscape -z -f "$<" -e "$@" -d 150

%.pdf: %.tex Makefile
	pdflatex $<
	pdflatex $<

%.png: %.pdf
	pdftoppm -png $< >| $@

# PNG at slide width
SLIDE_WIDTH=1024
SLIDE_HEIGHT=768
%_sw.png: %.svg ignore-%_sw.png
	@echo "Rendering $@ at slide width of $(SLIDE_WIDTH)"
	@inkscape -z -f "$<" -e "$@" --export-width=$(SLIDE_WIDTH)

# Following two rules will try imagemagick's to convert an image to
# the corresponding size...
# TODO: figure out how to make them match for both jpg and png
#       files as sources
%_sw.png: %.jpg ignore-%_sw.png
	@echo "Converting $@ at slide width of $(SLIDE_WIDTH)"
	@convert -geometry $(SLIDE_WIDTH) "$<" "$@"

%_sh.png: %.jpg ignore-%_sh.png
	@echo "Converting $@ at slide height of $(SLIDE_HEIGHT)"
	@convert -geometry x$(SLIDE_HEIGHT) "$<" "$@"

%_15dpi.png: %.svg ignore-%_15dpi.png
	@echo "Rendering $@"
	@inkscape -z -f "$<" -e "$@" -d 15

%_75dpi.png: %.svg ignore-%_75dpi.png
	@echo "Rendering $@"
	@inkscape -z -f "$<" -e "$@" -d 75

%_600dpi.png: %.svg ignore-%_600dpi.png
	@echo "Rendering $@"
	@inkscape -z -f "$<" -e "$@" -d 600


.PHONY: ignore-%
ignore-%:
	@grep -q "^$*$$" .gitignore || { \
	  echo "$*" >> .gitignore; echo "Ignore $@"; }

clean::
	-rm $(PICS_CONVERTED)
	-for p in *.svg; do rm -f $${p%*.svg}.{pdf,eps,png}; done
	-rm -fr *_tuned

.PHONY: all pics

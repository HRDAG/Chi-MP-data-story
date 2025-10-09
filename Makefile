# vim: set ts=8 sts=0 sw=8 si fenc=utf-8 noet:
# vim: set fdm=marker fmr={{{,}}} fdl=0 foldcolumn=4:
# Authors:     BP
# Maintainers: BP
# Copyright:   2025 HRDAG, GPL v2 or later
# =========================================

intro := data_story_story-pj
nb1 := what-is-an-mp-event-nb1-pj
nb2 := what-happens-after-mp-event-nb2-pj

.PHONY: all clean

all: output/$(intro).html \
	output/$(nb1).html \
	output/$(nb2).html

clean:
	-rm output/*

output/$(intro).html: notebooks/$(intro).ipynb
	jupyter nbconvert --to notebook --inplace --execute notebooks/$(intro).ipynb
	jupyter nbconvert --to html --template pj notebooks/$(intro).ipynb
	mv notebooks/$(intro).html $@

output/$(nb1).html: notebooks/$(nb1).ipynb
	jupyter nbconvert --to notebook --inplace --execute notebooks/$(nb1).ipynb
	jupyter nbconvert --to html --template pj notebooks/$(nb1).ipynb
	mv notebooks/$(nb1).html $@

output/$(nb2).html: notebooks/$(nb2).ipynb
	jupyter nbconvert --to notebook --inplace --execute notebooks/$(nb2).ipynb
	jupyter nbconvert --to html --template pj notebooks/$(nb2).ipynb
	mv notebooks/$(nb2).html $@


# done.

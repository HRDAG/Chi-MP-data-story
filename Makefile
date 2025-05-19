# vim: set ts=8 sts=0 sw=8 si fenc=utf-8 noet:
# vim: set fdm=marker fmr={{{,}}} fdl=0 foldcolumn=4:
# Authors:     BP
# Maintainers: BP
# Copyright:   2025 HRDAG, GPL v2 or later
# =========================================

intro := notebooks/data_story_story-pj.ipynb
nb1 := notebooks/what-is-an-mp-event-nb1-pj.ipynb

.PHONY: all clean nb1_html

all: intro_html nb1_html

clean:
	-rm output/*

intro_html:
	jupyter nbconvert --to notebook --inplace --execute $(intro)
	jupyter nbconvert --to html --template pj $(intro)
	mv notebooks/data_story_story-pj.html output

nb1_html:
	jupyter nbconvert --to notebook --inplace --execute $(nb1)
	jupyter nbconvert --to html --template pj $(nb1)
	mv notebooks/what-is-an-mp-event-nb1-pj.html output


# done.

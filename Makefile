# vim: set ts=8 sts=0 sw=8 si fenc=utf-8 noet:
# vim: set fdm=marker fmr={{{,}}} fdl=0 foldcolumn=4:
# Authors:     BP
# Maintainers: BP
# Copyright:   2025 HRDAG, GPL v2 or later
# =========================================

SRC_DIR := notebooks
intro := $(SRC_DIR)/data_story_story-pj.ipynb
nb1 := $(SRC_DIR)/what-is-an-mp-event-nb1-pj.ipynb
nb2 := $(SRC_DIR)/what-happens-after-mp-event-nb2-pj.ipynb
SOURCES := $(intro) $(nb1) $(nb2)

OUT_DIR := output
CHAPTERS := $(patsubst $(SRC_DIR)/%.ipynb, $(OUT_DIR)/%.html, $(SOURCES))

.PHONY: all clean

all: $(CHAPTERS)

clean:
	-rm $(OUT_DIR)/*

$(OUT_DIR)/%.html: $(SRC_DIR)/%.ipynb | $(OUT_DIR)
	jupyter nbconvert --to notebook --inplace --execute $<
	jupyter nbconvert --to html --template pj $<
	mv notebooks/$*.html $@
	

$(OUT_DIR):
	mkdir -p $@

# done.

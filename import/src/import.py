#!/usr/bin/env python3
# vim: set ts=4 sts=0 sw=4 si fenc=utf-8 et:
# vim: set fdm=marker fmr={{{,}}} fdl=0 foldcolumn=4:
# Authors:     BP
# Maintainers: BP
# Copyright:   2023, HRDAG, GPL v2 or later
# =========================================
# dependencies {{{
from pathlib import Path
from sys import stdout
import argparse
import logging
import pandas as pd
# }}}

# support methods {{{
def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", default=None)
    parser.add_argument("--output", default=None)
    args = parser.parse_args()
    assert Path(args.input).exists()
    return args


def get_logger(sname, file_name=None):
    logger = logging.getLogger(sname)
    logger.setLevel(logging.DEBUG)
    formatter = logging.Formatter("%(asctime)s - %(levelname)s " +
                                  "- %(message)s", datefmt='%Y-%m-%d %H:%M:%S')
    stream_handler = logging.StreamHandler(stdout)
    stream_handler.setFormatter(formatter)
    logger.addHandler(stream_handler)
    if file_name:
        file_handler = logging.FileHandler(file_name)
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)
    return logger
# }}}

# main
if __name__ == '__main__':
    # setup logging
    logger = get_logger(__name__, "output/import.log")

    # arg handling
    args = get_args()
    mp = pd.read_parquet(args.input)
    logger.info(f'read table with shape:\t{mp.shape[0]}')
    logger.info(f'found columns:\n{sorted(mp.columns)}')

    logger.info('applying filter steps')
    mp = mp.loc[mp.year_occurred < 2023]
    mp.info()
    
    logger.info(f'writing table with shape:\t{mp.shape[0]}')
    mp.to_parquet(args.output)
    
    logger.info('done')
# done
#!/bin/bash
dir=$(dirname "$0")
des=daehyun@carbon.uedalab.local:/home/daehyun/notebooks/SP8_2014B

rsync -rptLDP --delete --stats \
    "$dir"/site-packages \
    "$des"/ \
    &
rsync -rptLDP --delete --stats \
    "$dir"/MongoDB \
    "$des"/ \
    &
rsync -rptLDP --delete --stats \
    "$dir"/02_N2_430eV/exported.parquet \
    "$des"/02_N2_430eV/ \
    &
rsync -rptLDP --delete --stats \
    "$dir"/06_Ar_15atm_258eV/exported.parquet \
    "$des"/06_Ar_15atm_258eV/ \
    &
rsync -rptLDP --delete --stats \
    "$dir"/07_Ar_15atm_268eV/exported.parquet \
    "$des"/07_Ar_15atm_268eV/ \
    &

wait

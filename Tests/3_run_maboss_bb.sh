#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../BuildingBlocks/Resources/images/
export PERMEDCOE_ASSETS=$(pwd)/../../BuildingBlocks/Resources/assets/

data=$(pwd)/../Resources/data/
results=$(pwd)/results/

per_results=${results}/personalize_patient
mut_results=${results}/mutant_results

source aux.sh
disable_pycompss

# 1st patient

mkdir -p ${mut_results}/SIDM00003

maboss_BB -d \
    -i ${per_results}/SIDM00003/ \
       ${data}/genes_druggable.csv \
       ${data}/genes_target.csv \
    -o ${mut_results}/SIDM00003/sensitivity.json \
    -c ${data}/personalization.yml \
    --mount_points ${PERMEDCOE_ASSETS}/MaBoSS/:${PERMEDCOE_ASSETS}/MaBoSS/

mkdir -p ${mut_results}/SIDM00023

maboss_BB -d \
    -i ${per_results}/SIDM00023/ \
       ${data}/genes_druggable.csv \
       ${data}/genes_target.csv \
    -o ${mut_results}/SIDM00023/sensitivity.json \
    -c ${data}/personalization.yml \
    --mount_points ${PERMEDCOE_ASSETS}/MaBoSS/:${PERMEDCOE_ASSETS}/MaBoSS/

mkdir -p ${mut_results}/SIDM00040

maboss_BB -d \
    -i ${per_results}/SIDM00040/ \
       ${data}/genes_druggable.csv \
       ${data}/genes_target.csv \
    -o ${mut_results}/SIDM00040/sensitivity.json \
    -c ${data}/personalization.yml \
    --mount_points ${PERMEDCOE_ASSETS}/MaBoSS/:${PERMEDCOE_ASSETS}/MaBoSS/

enable_pycompss

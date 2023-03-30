#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/

data=${SCRIPT_DIR}/../Resources/data/
results=${SCRIPT_DIR}/results/

per_results=${results}/personalize_patient
mut_results=${results}/mutant_results

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

# 1st patient

mkdir -p ${mut_results}/SIDM00003

TEMP_DIRECTORY=$(pwd)/MaBoSS_SIDM00003_wd
mkdir -p ${TEMP_DIRECTORY}

MaBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    sensitivity \
    --model_folder ${per_results}/SIDM00003/ \
    --genes_druggable ${data}/genes_druggable.csv \
    --genes_target ${data}/genes_target.csv \
    --result_file ${mut_results}/SIDM00003/sensitivity.json


mkdir -p ${mut_results}/SIDM00023

TEMP_DIRECTORY=$(pwd)/MaBoSS_SIDM00023_wd
mkdir -p ${TEMP_DIRECTORY}

MaBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    sensitivity \
    --model_folder ${per_results}/SIDM00023/ \
    --genes_druggable ${data}/genes_druggable.csv \
    --genes_target ${data}/genes_target.csv \
    --result_file ${mut_results}/SIDM00023/sensitivity.json


mkdir -p ${mut_results}/SIDM00040

TEMP_DIRECTORY=$(pwd)/MaBoSS_SIDM00040_wd
mkdir -p ${TEMP_DIRECTORY}

MaBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    sensitivity \
    --model_folder ${per_results}/SIDM00040/ \
    --genes_druggable ${data}/genes_druggable.csv \
    --genes_target ${data}/genes_target.csv \
    --result_file ${mut_results}/SIDM00040/sensitivity.json


enable_pycompss

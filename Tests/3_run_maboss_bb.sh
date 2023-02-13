#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/

data=${SCRIPT_DIR}/../Resources/data/
results=${SCRIPT_DIR}/results/

per_results=${results}/personalize_patient
mut_results=${results}/mutant_results

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

MABOSS_ASSETS=$(python3 -c "import MaBoSS_BB; import os; print(os.path.dirname(MaBoSS_BB.__file__))")

# 1st patient

mkdir -p ${mut_results}/SIDM00003

WORKING_DIRECTORY=$(pwd)/MaBoSS_SIDM00003_wd
mkdir -p ${WORKING_DIRECTORY}

MaBoSS_BB -d \
    --mount_point ${MABOSS_ASSETS}/assets:${MABOSS_ASSETS}/assets,${WORKING_DIRECTORY}:${WORKING_DIRECTORY} \
    sensitivity \
    --model_folder ${per_results}/SIDM00003/ \
    --genes_druggable ${data}/genes_druggable.csv \
    --genes_target ${data}/genes_target.csv \
    --result_file ${mut_results}/SIDM00003/sensitivity.json \
    --working_directory ${WORKING_DIRECTORY}


mkdir -p ${mut_results}/SIDM00023

WORKING_DIRECTORY=$(pwd)/MaBoSS_SIDM00023_wd
mkdir -p ${WORKING_DIRECTORY}

MaBoSS_BB -d \
    --mount_point ${MABOSS_ASSETS}/assets:${MABOSS_ASSETS}/assets,${WORKING_DIRECTORY}:${WORKING_DIRECTORY} \
    sensitivity \
    --model_folder ${per_results}/SIDM00023/ \
    --genes_druggable ${data}/genes_druggable.csv \
    --genes_target ${data}/genes_target.csv \
    --result_file ${mut_results}/SIDM00023/sensitivity.json \
    --working_directory ${WORKING_DIRECTORY}


mkdir -p ${mut_results}/SIDM00040

WORKING_DIRECTORY=$(pwd)/MaBoSS_SIDM00040_wd
mkdir -p ${WORKING_DIRECTORY}

MaBoSS_BB -d \
    --mount_point ${MABOSS_ASSETS}/assets:${MABOSS_ASSETS}/assets,${WORKING_DIRECTORY}:${WORKING_DIRECTORY} \
    sensitivity \
    --model_folder ${per_results}/SIDM00040/ \
    --genes_druggable ${data}/genes_druggable.csv \
    --genes_target ${data}/genes_target.csv \
    --result_file ${mut_results}/SIDM00040/sensitivity.json \
    --working_directory ${WORKING_DIRECTORY}


enable_pycompss

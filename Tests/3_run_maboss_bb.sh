#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ -z "${PERMEDCOE_IMAGES}" ]]; then
  default_images=$(realpath ${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/)/
  export PERMEDCOE_IMAGES=${default_images}
  echo "WARNING: PERMEDCOE_IMAGES environment variable not set. Using default: ${default_images}"
else
  echo "INFO: Using PERMEDCOE_IMAGES from: ${PERMEDCOE_IMAGES}"
fi
export COMPUTING_UNITS=1

data=${SCRIPT_DIR}/../Resources/data/
results=${SCRIPT_DIR}/results/
per_results=${results}/personalize_patient
mut_results=${results}/mutant_results


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

#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/
if [ -z "${CONTAINER}" ] && [ "${CONTAINER}" == "True" ]
then
  export PERMEDCOE_ASSETS=${SCRIPT_DIR}/../../BuildingBlocks/Resources/assets/
else
  export PERMEDCOE_ASSETS=/root/assets/
fi

data=${SCRIPT_DIR}/../Resources/data/
results=${SCRIPT_DIR}/results/

per_results=${results}/personalize_patient
mut_results=${results}/mutant_results

source ${SCRIPT_DIR}/aux.sh
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

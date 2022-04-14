#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/

data=${SCRIPT_DIR}/../Resources/data/
results=${SCRIPT_DIR}/results/

mod_results=${results}/build_model
per_results=${results}/personalize_patient

# Data is too big for github, so I compressed it. Need to uncompress first
tar -zxvf ${data}/data_celllines.tar.gz --directory ${data}

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

PERSONALIZE_PATIENT_ASSETS=$(python3 -c "import personalize_patient_BB; import os; print(os.path.dirname(personalize_patient_BB.__file__))")

# 1st cell line
cell_line=SIDM00003
mkdir -p ${per_results}/${cell_line}/

personalize_patient_BB -d \
    -i ${data}/rnaseq_fpkm_20191101.csv \
       ${data}/mutations_20191101.csv.csv \
       ${data}/cnv_gistic_20191101.csv \
       ${cell_line} \
       ${mod_results}/model.bnd \
       ${mod_results}/model.cfg \
    -o ${per_results}/${cell_line}/ \
    -c ${data}/personalization.yml \
    --mount_point ${PERSONALIZE_PATIENT_ASSETS}/assets:${PERSONALIZE_PATIENT_ASSETS}/assets

# 2nd cell line

cell_line=SIDM00023

mkdir -p ${per_results}/${cell_line}/

personalize_patient_BB -d \
    -i ${data}/rnaseq_fpkm_20191101.csv \
       ${data}/mutations_20191101.csv.csv \
       ${data}/cnv_gistic_20191101.csv \
       ${cell_line} \
       ${mod_results}/model.bnd \
       ${mod_results}/model.cfg \
    -o ${per_results}/${cell_line}/ \
    -c ${data}/personalization.yml \
    --mount_point ${PERSONALIZE_PATIENT_ASSETS}/assets:${PERSONALIZE_PATIENT_ASSETS}/assets


# 3rd cell line

cell_line=SIDM00040

mkdir -p ${per_results}/${cell_line}/

personalize_patient_BB -d \
    -i ${data}/rnaseq_fpkm_20191101.csv \
       ${data}/mutations_20191101.csv.csv \
       ${data}/cnv_gistic_20191101.csv \
       ${cell_line} \
       ${mod_results}/model.bnd \
       ${mod_results}/model.cfg \
    -o ${per_results}/${cell_line}/ \
    -c ${data}/personalization.yml \
    --mount_point ${PERSONALIZE_PATIENT_ASSETS}/assets:${PERSONALIZE_PATIENT_ASSETS}/assets

enable_pycompss

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

mod_results=${results}/build_model
per_results=${results}/personalize_patient

# Data is too big for github, so I compressed it. Need to uncompress first
tar -zxvf ${data}/data_celllines.tar.gz --directory ${data}

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

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
    --mount_points ${PERMEDCOE_ASSETS}/personalize_patient/:${PERMEDCOE_ASSETS}/personalize_patient/

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
    --mount_points ${PERMEDCOE_ASSETS}/personalize_patient/:${PERMEDCOE_ASSETS}/personalize_patient/


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
    --mount_points ${PERMEDCOE_ASSETS}/personalize_patient/:${PERMEDCOE_ASSETS}/personalize_patient/

enable_pycompss

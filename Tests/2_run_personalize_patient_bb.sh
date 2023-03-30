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

# 1st cell line

cell_line=SIDM00003
mkdir -p ${per_results}/${cell_line}/

TEMP_DIRECTORY=$(pwd)/personalize_patient_${cell_line}_wd
mkdir -p ${TEMP_DIRECTORY}

personalize_patient_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    uc2 \
    --expression ${data}/rnaseq_fpkm_20191101.csv \
    --cnv ${data}/mutations_20191101.csv \
    --mutation ${data}/cnv_gistic_20191101.csv \
    --cell_type ${cell_line} \
    --model_bnd ${mod_results}/model.bnd \
    --model_cfg ${mod_results}/model.cfg \
    --model_output_dir ${per_results}/${cell_line}/

# 2nd cell line

cell_line=SIDM00023
mkdir -p ${per_results}/${cell_line}/

TEMP_DIRECTORY=$(pwd)/personalize_patient_${cell_line}_wd
mkdir -p ${TEMP_DIRECTORY}

personalize_patient_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    uc2 \
    --expression ${data}/rnaseq_fpkm_20191101.csv \
    --cnv ${data}/mutations_20191101.csv \
    --mutation ${data}/cnv_gistic_20191101.csv \
    --cell_type ${cell_line} \
    --model_bnd ${mod_results}/model.bnd \
    --model_cfg ${mod_results}/model.cfg \
    --model_output_dir ${per_results}/${cell_line}/

# 3rd cell line

cell_line=SIDM00040
mkdir -p ${per_results}/${cell_line}/

TEMP_DIRECTORY=$(pwd)/personalize_patient_${cell_line}_wd
mkdir -p ${TEMP_DIRECTORY}

personalize_patient_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    uc2 \
    --expression ${data}/rnaseq_fpkm_20191101.csv \
    --cnv ${data}/mutations_20191101.csv \
    --mutation ${data}/cnv_gistic_20191101.csv \
    --cell_type ${cell_line} \
    --model_bnd ${mod_results}/model.bnd \
    --model_cfg ${mod_results}/model.cfg \
    --model_output_dir ${per_results}/${cell_line}/

enable_pycompss

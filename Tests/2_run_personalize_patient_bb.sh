#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../BuildingBlocks/Resources/images/
export PERMEDCOE_ASSETS=$(pwd)/../../BuildingBlocks/Resources/assets/

data=$(pwd)/../Resources/data/
results=$(pwd)/results/

mod_results=${results}/build_model
per_results=${results}/personalize_patient

# Data is too big for github, so I compressed it. Need to uncompress first
tar -zxvf ${data}/data_celllines.tar.gz --directory ${data}

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

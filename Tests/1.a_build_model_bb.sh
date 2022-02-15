#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../BuildingBlocks/Resources/images/
export PERMEDCOE_ASSETS=$(pwd)/../../BuildingBlocks/Resources/assets/

data=$(pwd)/../Resources/data/
results=$(pwd)/results/

mkdir -p ${results}/build_model/

build_model_from_species_BB -d \
    -i ${data}/Sub_genes.csv \
    -o ${results}/build_model/model.bnd ${results}/build_model/model.cfg \
    -c ${data}/scenario_1_a.yml \
    --mount_point ${PERMEDCOE_ASSETS}/FromSpeciesToMaBoSSModel:${PERMEDCOE_ASSETS}/FromSpeciesToMaBoSSModel

#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../BuildingBlocks/Resources/images/
export PERMEDCOE_ASSETS=$(pwd)/../../BuildingBlocks/Resources/assets/

data=$(pwd)/../Resources/data/
results=$(pwd)/results/

mkdir -p ${results}/build_model/

source aux.sh
disable_pycompss

build_model_from_species_BB -d \
    -i ${data}/prova.sif \
    -o ${results}/build_model/model.bnd ${results}/build_model/model.cfg \
    -c ${data}/scenario_1_b.yml \
    --mount_point ${PERMEDCOE_ASSETS}/FromSpeciesToMaBoSSModel:${PERMEDCOE_ASSETS}/FromSpeciesToMaBoSSModel

enable_pycompss

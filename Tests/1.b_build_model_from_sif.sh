#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/

data=${SCRIPT_DIR}/../Resources/data/
results=${SCRIPT_DIR}/results/

mkdir -p ${results}/build_model/

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

TEMP_DIRECTORY=$(pwd)/build_model_from_species_sif_wd
mkdir -p ${TEMP_DIRECTORY}

build_model_from_species_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    --build_model_from sif \
    --input_file ${data}/prova.sif \
    --output_bnd_file ${results}/build_model/model.bnd \
    --output_cfg_file ${results}/build_model/model.cfg

enable_pycompss

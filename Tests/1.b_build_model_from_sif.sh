#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/

data=${SCRIPT_DIR}/../Resources/data/
results=${SCRIPT_DIR}/results/

mkdir -p ${results}/build_model/

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

BUILD_MODEL_FROM_SPECIES_ASSETS=$(python3 -c "import build_model_from_species_BB; import os; print(os.path.dirname(build_model_from_species_BB.__file__))")

WORKING_DIRECTORY=$(pwd)/build_model_from_species_sif_wd
mkdir -p ${WORKING_DIRECTORY}

build_model_from_species_BB -d \
    --mount_point ${BUILD_MODEL_FROM_SPECIES_ASSETS}/assets:${BUILD_MODEL_FROM_SPECIES_ASSETS}/assets \
    --build_model_from sif \
    --input_file ${data}/prova.sif \
    --output_bnd_file ${results}/build_model/model.bnd \
    --output_cfg_file ${results}/build_model/model.cfg \
    --working_directory ${WORKING_DIRECTORY}

enable_pycompss

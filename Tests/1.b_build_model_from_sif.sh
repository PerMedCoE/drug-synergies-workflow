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

mkdir -p ${results}/build_model/

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

build_model_from_species_BB -d \
    -i ${data}/prova.sif \
    -o ${results}/build_model/model.bnd ${results}/build_model/model.cfg \
    -c ${data}/scenario_1_b.yml \
    --mount_point ${PERMEDCOE_ASSETS}/FromSpeciesToMaBoSSModel:${PERMEDCOE_ASSETS}/FromSpeciesToMaBoSSModel

enable_pycompss

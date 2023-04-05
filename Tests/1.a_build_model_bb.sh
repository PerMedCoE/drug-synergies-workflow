#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ -z "${PERMEDCOE_IMAGES}" ]]; then
  default_images=$(realpath ${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/)/
  export PERMEDCOE_IMAGES=${default_images}
  echo "WARNING: PERMEDCOE_IMAGES environment variable not set. Using default: ${default_images}"
else
  echo "INFO: Using PERMEDCOE_IMAGES from: ${PERMEDCOE_IMAGES}"
fi
export COMPUTING_UNITS=1

data=${SCRIPT_DIR}/../Resources/data/
results=${SCRIPT_DIR}/results/
mkdir -p ${results}/build_model/
TEMP_DIRECTORY=$(pwd)/build_model_from_species_wd
mkdir -p ${TEMP_DIRECTORY}

build_model_from_species_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    --build_model_from genes \
    --input_file ${data}/Sub_genes.csv \
    --output_bnd_file ${results}/build_model/model.bnd \
    --output_cfg_file ${results}/build_model/model.cfg


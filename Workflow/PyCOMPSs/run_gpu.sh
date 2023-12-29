#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ -z "${PERMEDCOE_IMAGES}" ]]; then
  default_images=$(realpath ${SCRIPT_DIR}/../../../BuildingBlocks/Resources/images/)/
  export PERMEDCOE_IMAGES=${default_images}
  echo "WARNING: PERMEDCOE_IMAGES environment variable not set. Using default: ${default_images}"
else
  echo "INFO: Using PERMEDCOE_IMAGES from: ${PERMEDCOE_IMAGES}"
fi

data=$(realpath ${SCRIPT_DIR}/../../Resources/data/)/
results=${SCRIPT_DIR}/results/

if [ -d "$results" ]; then
    rm -rf $results;
fi
mkdir -p $results

# Prepare environment file:
env_script="$(pwd)/worker_env.sh"
echo "export PERMEDCOE_IMAGES=${PERMEDCOE_IMAGES}" > ${env_script}

runcompss -gd \
    --env_script=${env_script} \
    --python_interpreter=python3 \
    ${SCRIPT_DIR}/src/uc2_gpu.py \
    ${data}/Sub_genes.csv \
    ${data}/rnaseq_fpkm_20191101.csv \
    ${data}/mutations_20191101.csv \
    ${data}/cnv_gistic_20191101.csv \
    ${data}/genes_druggable.csv \
    ${data}/genes_target.csv \
    ${results}

rm ${env_script}

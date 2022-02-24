#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=$(realpath ${SCRIPT_DIR}/../../../BuildingBlocks/Resources/images/)/
if [ -z "${CONTAINER}" ] && [ "${CONTAINER}" == "True" ]
then
  export PERMEDCOE_ASSETS=$(realpath ${SCRIPT_DIR}/../../../BuildingBlocks/Resources/assets/)/
else
  export PERMEDCOE_ASSETS=/root/assets/
fi

data=$(realpath ${SCRIPT_DIR}/../../Resources/data/)/
results=${SCRIPT_DIR}/results/

if [ -d "$results" ]; then
    rm -rf $results;
fi
mkdir -p $results

runcompss \
    --python_interpreter=python3 \
    ${SCRIPT_DIR}/src/uc2.py \
    ${data}/Sub_genes.csv \
    ${data}/rnaseq_fpkm_20191101.csv \
    ${data}/mutations_20191101.csv \
    ${data}/cnv_gistic_20191101.csv \
    ${data}/genes_druggable.csv \
    ${data}/genes_target.csv \
    ${results}

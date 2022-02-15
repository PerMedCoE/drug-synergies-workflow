#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../../BuildingBlocks/Resources/images/
export PERMEDCOE_ASSETS=$(pwd)/../../../BuildingBlocks/Resources/assets/

data=$(pwd)/../../Resources/data/
results=$(pwd)/results/

if [ -d "$results" ]; then
    rm -rf $results;
fi
mkdir -p $results


runcompss \
    -t \
    --python_interpreter=python3 \
    $(pwd)/src/uc2.py \
    ${data}/Sub_genes.csv \
    ${data}/rnaseq_fpkm_20191101.csv \
    ${data}/mutations_20191101.csv \
    ${data}/cnv_gistic_20191101.csv \
    ${data}/genes_druggable.csv \
    ${data}/genes_target.csv \
    ${results}

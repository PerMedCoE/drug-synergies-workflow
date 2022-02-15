#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../BuildingBlocks/Resources/images/
export PERMEDCOE_ASSETS=$(pwd)/../../BuildingBlocks/Resources/assets/

data=$(pwd)/../Resources/data/
results=$(pwd)/results/

mut_results=${results}/mutant_results
rep_results=${results}/report

# 1st patient
mkdir -p ${rep_results}

print_drug_results_BB -d \
    -i ${mut_results} \
    -o ${rep_results} \
    --mount_points ${PERMEDCOE_ASSETS}/print_drug_results/:${PERMEDCOE_ASSETS}/print_drug_results/

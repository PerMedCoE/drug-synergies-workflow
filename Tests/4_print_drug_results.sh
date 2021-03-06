#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/

data=${SCRIPT_DIR}/../Resources/data/
results=${SCRIPT_DIR}/results/

mut_results=${results}/mutant_results
rep_results=${results}/report

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

PRINT_DRUG_RESULTS_ASSETS=$(python3 -c "import print_drug_results_BB; import os; print(os.path.dirname(print_drug_results_BB.__file__))")

# 1st patient
mkdir -p ${rep_results}

print_drug_results_BB -d \
    -i ${mut_results} \
    -o ${rep_results} \
    --mount_point ${PRINT_DRUG_RESULTS_ASSETS}/assets:${PRINT_DRUG_RESULTS_ASSETS}/assets

enable_pycompss

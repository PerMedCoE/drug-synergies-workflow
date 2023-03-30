#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/

results=${SCRIPT_DIR}/results/

mut_results=${results}/mutant_results
rep_results=${results}/report

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

# 1st patient
mkdir -p ${rep_results}

TEMP_DIRECTORY=$(pwd)/print_drug_results_wd
mkdir -p ${TEMP_DIRECTORY}

print_drug_results_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    --results_folder ${mut_results} \
    --reports_folder ${rep_results}

enable_pycompss

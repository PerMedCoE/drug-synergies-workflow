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

mut_results=${results}/mutant_results
rep_results=${results}/report

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

# 1st patient
mkdir -p ${rep_results}

print_drug_results_BB -d \
    -i ${mut_results} \
    -o ${rep_results} \
    --mount_points ${PERMEDCOE_ASSETS}/print_drug_results/:${PERMEDCOE_ASSETS}/print_drug_results/

enable_pycompss

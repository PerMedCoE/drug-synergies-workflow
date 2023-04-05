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

results=${SCRIPT_DIR}/results/
mut_results=${results}/mutant_results
rep_results=${results}/report


# Get final results

mkdir -p ${rep_results}
TEMP_DIRECTORY=$(pwd)/print_drug_results_wd
mkdir -p ${TEMP_DIRECTORY}

print_drug_results_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    --results_folder ${mut_results} \
    --reports_folder ${rep_results}

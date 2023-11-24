#!/usr/bin/env bash

echo "Downloading drug-synergies-workflow required containers... Please wait..."

CURRENT_DIR=$(pwd)
CONTAINER_FOLDER=$(pwd)/drug-synergies-workflow-containers
mkdir -p ${CONTAINER_FOLDER}
cd ${CONTAINER_FOLDER}

apptainer pull from_species_to_maboss_model.sif docker://ghcr.io/permedcoe/from_species_to_maboss_model:latest
apptainer pull physicell_covid19.sif docker://ghcr.io/permedcoe/physicell_covid19:latest
apptainer pull maboss.sif docker://ghcr.io/permedcoe/maboss:latest
apptainer pull print_results.sif docker://ghcr.io/permedcoe/print_results:latest

cd ${CURRENT_DIR}

echo "drug-synergies-workflow required containers downloaded"
echo ""
echo "Containers stored in: ${CONTAINER_FOLDER}"
echo ""
echo "Please, don't forget to run:"
echo "    export PERMEDCOE_IMAGES=${CONTAINER_FOLDER}"
echo "Before running the workflow."
echo ""

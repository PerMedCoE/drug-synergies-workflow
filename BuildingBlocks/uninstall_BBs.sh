#!/usr/bin/env bash

echo "Uninstalling drug-synergies-workflow required Building Blocks... Please wait..."

CURRENT_DIR=$(pwd)
# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd ../../BuildingBlocks

cd build_model_from_species
./uninstall.sh
cd ..

cd personalize_patient
./uninstall.sh
cd ..

cd MaBoSS
./uninstall.sh
cd ..

cd print_drug_results
./uninstall.sh
cd ..

cd ${CURRENT_DIR}

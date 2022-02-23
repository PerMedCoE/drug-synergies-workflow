#!/usr/bin/env bash

echo "Installing covid-19-workflow required Building Blocks... Please wait..."

CURRENT_DIR=$(pwd)
# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd ../../BuildingBlocks

cd build_model_from_species
./install.sh
cd ..

cd personalize_patient
./install.sh
cd ..

cd MaBoSS
./install.sh
cd ..

cd print_drug_results
./install.sh
cd ..

cd ${CURRENT_DIR}

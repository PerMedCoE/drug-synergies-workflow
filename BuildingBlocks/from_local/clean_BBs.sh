#!/usr/bin/env bash

echo "Cleaning drug-synergies-workflow required Building Blocks... Please wait..."

CURRENT_DIR=$(pwd)
# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd ../../../BuildingBlocks

cd build_model_from_species
./clean.sh
cd ..

cd personalize_patient
./clean.sh
cd ..

cd MaBoSS
./clean.sh
cd ..

cd MaBoSSG
./clean.sh
cd ..

cd print_drug_results
./clean.sh
cd ..

cd ${CURRENT_DIR}

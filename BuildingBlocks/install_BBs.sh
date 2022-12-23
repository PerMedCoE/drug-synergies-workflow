#!/usr/bin/env bash

echo "Installing drug-synergies-workflow required Building Blocks... Please wait..."

python3 -m pip install 'git+https://github.com/PerMedCoE/BuildingBlocks.git@main#subdirectory=build_model_from_species'
python3 -m pip install 'git+https://github.com/PerMedCoE/BuildingBlocks.git@main#subdirectory=personalize_patient'
python3 -m pip install 'git+https://github.com/PerMedCoE/BuildingBlocks.git@main#subdirectory=MaBoSS'
python3 -m pip install 'git+https://github.com/PerMedCoE/BuildingBlocks.git@main#subdirectory=print_drug_results'

echo "drug-synergies-workflow required Building Blocks installed"

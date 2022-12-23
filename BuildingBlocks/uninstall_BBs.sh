#!/usr/bin/env bash

echo "Uninstalling drug-synergies-workflow required Building Blocks... Please wait..."

python3 -m pip uninstall -y build_model_from_species-BB
python3 -m pip uninstall -y personalize_patient-BB
python3 -m pip uninstall -y MaBoSS-BB
python3 -m pip uninstall -y print_drug_results-BB

echo "Uninstall finished"

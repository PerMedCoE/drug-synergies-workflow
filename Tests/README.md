# Drug Synergies Workflow Tests

This folder contains tests for the Drug Synergies Building Blocks.

## Scripts

There is a set of scripts to ease the Building Blocks testing:

```bash
.
├── 1.a_build_model_bb.sh
├── 1.b_build_model_from_sif.sh
├── 2_run_personalize_patient_bb.sh
├── 3_run_maboss_bb.sh
└── 4_print_drug_results.sh
```

These scripts can be executed one after the other.

**WARNING:** Please, update the ``PERMEDCOE_IMAGES`` environment
variables exported within each script to the appropriate
singularity container folder and assets folder accordingly.

Finally, there is a ``clean.sh`` script aimed at cleaning the results of the
building blocks execution.

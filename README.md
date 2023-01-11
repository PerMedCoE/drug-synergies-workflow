# Drug Synergies Screening Workflow

## Table of Contents

- [Drug Synergies Screening Workflow](#drug-synergies-screening-workflow)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Contents](#contents)
    - [Building Blocks](#building-blocks)
    - [Workflows](#workflows)
    - [Resources](#resources)
    - [Tests](#tests)
  - [Instructions](#instructions)
    - [Local machine](#local-machine)
      - [Requirements](#requirements)
      - [Usage steps](#usage-steps)
    - [MareNostrum 4](#marenostrum-4)
      - [Requirements in MN4](#requirements-in-mn4)
      - [Usage steps in MN4](#usage-steps-in-mn4)
  - [License](#license)
  - [Contact](#contact)

## Description

This pipeline simulates a drug screening on personalised cell line models. It automatically builds Boolean models of interest, then uses cell lines data (expression, mutations, copy number variations) to personalise them as MaBoSS models. Finally, this pipeline simulates multiple drug intervention on these MaBoSS models, and lists drug synergies of interest.

The workflow uses the following building blocks, described in order of execution:

1. Build model from species
2. Personalise patient
3. MaBoSS
4. Print drug results

For details on individual workflow steps, see the user documentation for each building block.

[`GitHub repository`](https://github.com/PerMedCoE/drug-synergies-workflow>)

## Contents

### Building Blocks

The ``BuildingBlocks`` folder contains the script to install the
Building Blocks used in the Drug Synergies Workflow.

### Workflows

The ``Workflow`` folder contains the workflows implementations.

Currently contains the implementation using PyCOMPSs.

### Resources

The ``Resources`` folder contains a small dataset for testing purposes.

### Tests

The ``Tests`` folder contains the scripts that run each Building Block
used in the workflow for a small dataset.
They can be executed individually *without PyCOMPSs installed* for testing
purposes.

## Instructions

### Local machine

This section explains the requirements and usage for the Drug Synergies Workflow in a laptop or desktop computer.

#### Requirements

- [`permedcoe`](https://github.com/PerMedCoE/permedcoe) package
- [PyCOMPSs](https://pycompss.readthedocs.io/en/stable/Sections/00_Quickstart.html)
- [Singularity](https://sylabs.io/guides/3.0/user-guide/installation.html)

#### Usage steps

1. Clone this repository:

  ```bash
  git clone https://github.com/PerMedCoE/drug-synergies-workflow.git
  ```

2. Install the Building Blocks required for the COVID19 Workflow:

  ```bash
  drug-synergies-workflow/BuildingBlocks/./install_BBs.sh
  ```

3. Get the required Building Block images from the project [B2DROP](https://b2drop.bsc.es/index.php/f/444350):

  - Required images:
      - PhysiCell-COVID19.singularity
      - printResults.singularity
      - MaBoSS_sensitivity.singularity
      - FromSpeciesToMaBoSSModel.singularity

  The path where these files are stored **MUST be exported in the `PERMEDCOE_IMAGES`** environment variable.

  > :warning: **TIP**: These containers can be built manually as follows (be patient since some of them may take some time):
  1. Clone the `BuildingBlocks` repository
     ```bash
     git clone https://github.com/PerMedCoE/BuildingBlocks.git
     ```
  2. Build the required Building Block images
     ```bash
     cd BuildingBlocks/Resources/images
     sudo singularity build PhysiCell-COVID19.sif PhysiCell-COVID19.singularity
     sudo singularity build printResults.sif printResults.singularity
     sudo singularity build MaBoSS_sensitivity.sif MaBoSS_sensitivity.singularity
     sudo singularity build FromSpeciesToMaBoSSModel.sif FromSpeciesToMaBoSSModel.singularity
     cd ../../..
     ```

**If using PyCOMPSs in local PC** (make sure that PyCOMPSs in installed):

4. Go to `Workflow/PyCOMPSs` folder

   ```bash
   cd Workflows/PyCOMPSs
   ```

5. Execute `./run.sh`
  > **TIP**: If you want to run the workflow with a different dataset, please update the `run.sh` script setting the `dataset` variable to the new dataset folder and their file names.

### MareNostrum 4

This section explains the requirements and usage for the Drug Synergies Workflow in the MareNostrum 4 supercomputer.

#### Requirements in MN4

- Access to MN4

All Building Blocks are already installed in MN4, and the Drug Synergies Workflow available.

#### Usage steps in MN4

1. Load the `COMPSs`, `Singularity` and `permedcoe` modules

   ```bash
   export COMPSS_PYTHON_VERSION=3
   module load COMPSs/3.1
   module load singularity/3.5.2
   module use /apps/modules/modulefiles/tools/COMPSs/libraries
   module load permedcoe
   ```

   > **TIP**: Include the loading into your `${HOME}/.bashrc` file to load it automatically on the session start.

   This commands will load COMPSs and the permedcoe package which provides all necessary dependencies, as well as the path to the singularity container images (`PERMEDCOE_IMAGES` environment variable) and testing dataset (`DRUG_SYNERGIES_WORKFLOW_DATASET` environment variable).

2. Get a copy of the pilot workflow into your desired folder

   ```bash
   mkdir desired_folder
   cd desired_folder
   get_drug_synergies_workflow
   ```

3. Go to `Workflow/PyCOMPSs` folder

   ```bash
   cd Workflow/PyCOMPSs
   ```

4. Execute `./launch.sh`

  This command will launch a job into the job queuing system (SLURM) requesting 2 nodes (one node acting half master and half worker, and other full worker node) for 20 minutes, and is prepared to use the singularity images that are already deployed in MN4 (located into the `PERMEDCOE_IMAGES` environment variable). It uses the dataset located into `../../Resources/data` folder.

  > :warning: **TIP**: If you want to run the workflow with a different dataset, please edit the `launch.sh` script and define the appropriate dataset path.

  After the execution, a `results` folder will be available with with Drug Synergies Workflow results.

## License

[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)

## Contact

<https://permedcoe.eu/contact/>

This software has been developed for the [PerMedCoE project](https://permedcoe.eu/), funded by the European Commission (EU H2020 [951773](https://cordis.europa.eu/project/id/951773)).

![](https://permedcoe.eu/wp-content/uploads/2020/11/logo_1.png "PerMedCoE")

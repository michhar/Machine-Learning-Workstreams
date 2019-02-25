An Azure Machine Learning Pipeline for Computer Vision
==============================

Using Azure Machine Learning Service and the Data Science Virtual Machine to create a computer vision machine learning pipeline.  The example here is using PyTorch for an instance segmentation task.

Purpose
---

The purpose for this repo is to provide a mechanism to set up an environment and workflow for a computer vision task.  The setup includes experimentation features for data exploration and model training as well as a production pipeline phase.

Azure Machine Learning Service is used in the experimentation phase to track and record metrics for training runs, register the models in model management with metadata and potentially sending training jobs to a remote compute if deemed necessary (e.g. a GPU cluster).

What Get Deploys
---

* Azure Storage Account
* Azure Machine Learning Workspace
* Ubuntu Data Science Virtual Machine (NC6)

What Tools are Automatically Set Up on the DSVM
---

* Tools
  * VGG Image Annotator
* PyTorch Extensions for NMS and ROI Alignment
* Cloned notebooks and scripts from this repository

Steps
---

### Frame Reduction and Annotation

1.  Reduce frames in video based on content
2.  Annotate the selected frames by drawing polygons with the VGG Image Annotation (VIA tool) around objects of interest

### Exploratory Data Analysis

This could be an Azure ML pipeline and even generate a report.

1.  View class distribution - notebook
2.  Prepare training dataset - notebook
5.  View training dataset - notebook

### Experimentation Phase

This could be an Azure ML pipeline.

1.  Train model and iterate - notebook
2.  Export a training script for production - script

### Productionization Phase

This will be an Azure ML Pipeline or sequence of automated steps.

1.  Train production model - script
2.  Deploy model as webservice - script
3.  Test webservice - script


Other Options for Interacting with Notebooks
---

Papermill for remotely executing notebooks:  https://github.com/nteract/papermill

References
---

* [Azure Machine Learning Service Docs](https://docs.microsoft.com/en-us/azure/machine-learning/service/)
* [Data Science Virtual Machine Docs](https://docs.microsoft.com/en-us/azure/machine-learning/data-science-virtual-machine/)

Credits
---

* Inspired by https://github.com/Azure/Machine-Learning-Containers

Project Organization
------------

    ├── LICENSE
    ├── Makefile           <- Makefile with commands like `make data` or `make train`
    ├── README.md          <- The top-level README for developers using this project.
    ├── data
    │   ├── external       <- Data from third party sources.
    │   ├── interim        <- Intermediate data that has been transformed.
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
    │
    ├── docs               <- A default Sphinx project; see sphinx-doc.org for details
    │
    ├── models             <- Trained and serialized models, model predictions, or model summaries
    │
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         the creator's initials, and a short `-` delimited description, e.g.
    │                         `1.0-jqp-initial-data-exploration`.
    │
    ├── references         <- Data dictionaries, manuals, and all other explanatory materials.
    │
    ├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   └── figures        <- Generated graphics and figures to be used in reporting
    │
    ├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
    │                         generated with `pip freeze > requirements.txt`
    │
    ├── setup.py           <- makes project pip installable (pip install -e .) so src can be imported
    ├── src                <- Source code for use in this project.
    │   ├── __init__.py    <- Makes src a Python module
    │   │
    │   ├── data           <- Scripts to download or generate data
    │   │   └── make_dataset.py
    │   │
    │   ├── features       <- Scripts to turn raw data into features for modeling
    │   │   └── build_features.py
    │   │
    │   ├── models         <- Scripts to train models and then use trained models to make
    │   │   │                 predictions
    │   │   ├── predict_model.py
    │   │   └── train_model.py
    │   │
    │   └── visualization  <- Scripts to create exploratory and results oriented visualizations
    │       └── visualize.py
    │
    └── tox.ini            <- tox file with settings for running tox; see tox.testrun.org


--------

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>

#!/bin/bash
set -e
PYTHONV=3.7
VENV=./.cenv$PYTHONV
[ -d $VENV ] && rm -Rf $VENV
time conda create --prefix $VENV -y python=$PYTHONV --override-channels -c defaults
conda activate $VENV
conda install -y git pip --override-channels  -c defaults
#conda config --show channels
pip install -U pip wheel setuptools
conda install pytorch-cpu torchvision-cpu --override-channels -c defaults -c pytorch
pip install -r requirements.txt

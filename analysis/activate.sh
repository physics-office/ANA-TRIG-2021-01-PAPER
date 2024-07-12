#!/bin/bash


source envs.sh
source /setup_envs.sh


if [ -d "$VIRTUALENV_NAMESPACE" ]; then
    echo "$VIRTUALENV_NAMESPACE exists."
    source $VIRTUALENV_NAMESPACE/bin/activate
else
    make build_local
    source $VIRTUALENV_NAMESPACE/bin/activate
fi

export PATH=$PATH:$PWD/scripts
export PYTHONPATH=$PYTHONPATH:$PWD
export PYTHONPATH=$PYTHONPATH:$PWD/rootplotlib

#
pip install -r requirements.txt

jupyter-lab #--NotebookApp.token='' --NotebookApp.password='' --allow-root

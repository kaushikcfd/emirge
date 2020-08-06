#!/bin/bash

set -o errexit

echo "==== Installing Conda packages for $(which conda)"

conda info --envs

conda install --yes pocl pyvisfile pyopencl islpy

[[ $(uname -m) == "x86_64" ]] && conda install --yes clinfo

# We need an MPI installation to build mpi4py.
# Install OpenMPI if none is available.
if ! command -v mpicc &> /dev/null ;then
    conda install --yes openmpi openmpi-mpicc
fi
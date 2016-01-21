#!/bin/bash

# Use "force" to force downloading the tar file.

source SEEDtk/user-env.sh
cd SEEDtk/Data
if [ ! -e reprepo.tar.gz ] || [ "$1" == "force" ]; then
    echo Downloading load tar file.
    curl -sO "ftp://ftp.kbase.us/SEEDtk/reprepo.tar.gz"
fi
ShrubLoad --clear --exclusive --store --tar=reprepo.tar.gz
echo Cleaning up.
rm reprepo.tar.gz
rm -rf Inputs/GenomeData/*
rm -rf Inputs/SubSystemData/*
rm -rf Inputs/ModelSEEDDatabase
rm -rf Inputs/Other/*
rm -rf LoadFiles/*
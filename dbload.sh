#!/bin/bash
source SEEDtk/user-env.sh
cd SEEDtk/Data
echo Downloading load tar file.
curl -sO "ftp://ftp.kbase.us/SEEDtk/reprepo.tar.gz"
ShrubLoad --clear --exclusive --store --tar=reprepo.tar.gz
echo Cleaning up.
rm reprepo.tar.gz
rm -rf Inputs/GenomeData/*
rm -rf Inputs/SubsystemData/*
rm -rf LoadFiles/*
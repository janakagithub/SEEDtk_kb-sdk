#!/bin/bash
if [ -d "SEEDtk" ]; then
    source SEEDtk/user-env.sh
else
    git clone https://github.com/SEEDtk/seedtk.git SEEDtk
    cd SEEDtk
    ./seedtk-setup
    source user-env.sh
    mkdir Data
    Config --dirs --dna=no --dbhost=db3.chicago.kbase.us --dbpass=when26crazy --dbuser=seedtk --dbname=seedtk_shrub --kbase=../lib/FIG_Config.pm Data
    cd Data/Global
    echo Downloading global data files.
    curl -sO "ftp://ftp.kbase.us/SEEDtk/Global/kmer_db.json"
    curl -sO "ftp://ftp.kbase.us/SEEDtk/Global/peg_md5_cdd.tbl"
    curl -sO "ftp://ftp.kbase.us/SEEDtk/Global/roles_cdd.tbl"
    curl -sO "ftp://ftp.kbase.us/SEEDtk/Global/rep_roles.tbl"
    curl -sO "ftp://ftp.kbase.us/SEEDtk/Global/uni_roles.tbl"
    echo Global data files downloaded.
fi

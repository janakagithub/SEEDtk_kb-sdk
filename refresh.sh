#!/bin/bash
if [! -d “SEEDtk” ]; then
    git clone https://github.com/SEEDtk/seedtk.git SEEDtk
    cd SEEDtk
    ./seedtk-setup
    source user-env.sh
    mkdir Data
    Config --dirs --dbhost=db3.chicago.kbase.us --dbpass=when26crazy --dbuser=seedtk --dbname=seedtk_shrub Data
    cd Data/Global
    wget -q -nH --cut-dirs=100 -m "ftp://ftp.kbase.us/SEEDtk/Global/"
    cd ../../Data/DnaRepo  
    # wget -q -nH --cut-dirs=100 -m "ftp://ftp.kbase.us/SEEDtk/DnaRepo/"
fi
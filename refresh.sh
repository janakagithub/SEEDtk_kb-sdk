#!/bin/bash
if [ -d "SEEDtk" ]; then
    source SEEDtk/user-env.sh
else
    git clone https://github.com/SEEDtk/seedtk.git SEEDtk
    cd SEEDtk
    ./seedtk-setup
    source user-env.sh
    mkdir Data
    Config --dirs --dbhost=db3.chicago.kbase.us --dbpass=when26crazy --dbuser=seedtk --dbname=seedtk_shrub Data
    cd Data/Global
    curl -O kmer_db.json "ftp://ftp.kbase.us/SEEDtk/Global/kmer_db.json"
    curl -O peg_md5_cdd.tbl "ftp://ftp.kbase.us/SEEDtk/Global/peg_md5_cdd.tbl"
    curl -O roles_cdd.tbl "ftp://ftp.kbase.us/SEEDtk/Global/roles_cdd.tbl"
    curl -O rep_roles.tbl "ftp://ftp.kbase.us/SEEDtk/Global/rep_roles.tbl"
    curl -O uni_roles.tbl "ftp://ftp.kbase.us/SEEDtk/Global/uni_roles.tbl"
    cd ../../Data/DnaRepo  
    # wget -q -nH --cut-dirs=100 -m "ftp://ftp.kbase.us/SEEDtk/DnaRepo/"
fi

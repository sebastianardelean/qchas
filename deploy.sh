#!/bin/bash

OLD_VERSION=0
NEW_VERSION=0
ERROR_NUMBER=0;

function print_help(){
    echo -e "usage: $0 [-g] [-v version]"
    }

#update version
function extract_version() {  
    versionFile=$(ls ./ | grep qchas.*)
    #grep previous values from qchas.cabal
    OLD_VERSION=$(grep -Eo '^version:\s+([0-9]\.[0-9]\.[0-9]\.[0-9])$' $versionFile | grep -Eo '[0-9]\.[0-9]\.[0-9]\.[0-9]')
    ERROR_NUMBER=$(echo $?)             #get error number
    if [ $ERROR_NUMBER -ne 0 ]; then
        exit $ERROR_CODE
    fi
    echo -e "Current package version is: $OLD_VERSION"
    }

function set_new_version_number() {
    versionFile=$(ls ./ | grep qchas.*)                            
    sed -i "s/^version:.*$/version:             ${NEW_VERSION}/" $versionFile
    }    

function copy_documentation(){
    rm docs/*.*
    rm -r docs/src
    #copy new documentation
    cp -r .stack-work/install/x86_64-linux-nopie/lts-8.23/8.0.2/doc/qchas-1.0.0/*.* docs/
    mkdir docs/src
    cp -r .stack-work/install/x86_64-linux-nopie/lts-8.23/8.0.2/doc/qchas-1.0.0/src/*.* docs/src

    }

function start_build(){
    NEW_VERSION=$1
    if [[ $NEW_VERSION =~ ^[0-9]\.[0-9]\.[0-9]\.[0-9]$ ]] 
    then
        set_new_version_number
    else
        echo -e "Version $NEW_VERSION is invalid."
        exit 1
    fi

    # echo -e "Start deployment[$(date +"%T")]...\n"
    # echo -e "\nRemoving old dist/ folder...[$(date +"%T")]\n"
    # rm -r dist/

    # echo -e "\nCreating changelog...[$(date +"%T")]\n"
    # github_changelog_generator

    # echo -e "\nGenerating documentation...[$(date +"%T")]\n"
    # stack haddock
    # echo -e "\nUpdating documentation...[$(date +"%T")]\n"
    # copy_documentation

    # echo -e "\nCreating cabal configuration...[$(date +"%T")]\n"
    # cabal configure

    # echo -e "\nCreating cabal distribution package...[$(date +"%T")]\n"
    # cabal sdist

    }

while getopts hgb: opt
do
    case "$opt" in
      g)  extract_version;;
      b)  start_build "$OPTARG";;
      h)  print_help;;
      *)  exit 1;;
    esac
done
shift `expr $OPTIND - 1`















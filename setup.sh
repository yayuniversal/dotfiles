#!/bin/bash
cd $(dirname ${BASH_SOURCE[0]})

if [[ $# -eq 0 ]]; then
    for setup_script in setup_scripts/*; do
        [[ -x $setup_script ]] || chmod +x "$setup_script"
        echo "Setting up $(basename "$setup_script")..."
        "$setup_script"
        echo
    done
else
    if [[ -f setup_scripts/$1 ]]; then
        [[ -x setup_scripts/$1 ]] || chmod +x "setup_scripts/$1"
        setup_script="setup_scripts/$1"
        shift
        "$setup_script" "$@"
    else
        echo "No setup script with name \"$1\" found"
        exit 1
    fi
fi
#!/bin/bash
cd $(dirname ${BASH_SOURCE[0]})

if [[ $# -eq 0 ]]; then
    for script in setup-scripts/*; do
        if [[ -f $script && -x $script ]]; then
            echo "Setting up $(basename "$script")..."
            "$script"
            echo
        fi
    done
else
    script="setup-scripts/$1"
    if [[ -f $script ]]; then
        shift
        "$script" "$@"
    else
        echo "No setup script with name \"$1\" found" >&2
        exit 1
    fi
fi

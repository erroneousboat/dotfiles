#!/bin/bash
function alias() {
    echo -e "Overview of .alias commands:"
    while read -r line; do
        if [[ $line == \#!* ]]; then
            continue
        fi
        
        if [[ $line == \#* ]]; then
            if [[ $line =~ \#[[:space:]]\$ ]]; then
                echo -e "\n"
            fi
            echo "$line" | sed 's/#//'
        fi
    done < $HOME/.alias
}

function functions() {
    echo -e "Overview of .functions commands:"
    while read -r line; do
        if [[ $line == \#!* ]]; then
            continue
        fi
        
        if [[ $line == \#* ]]; then
            if [[ $line =~ \#[[:space:]]\$ ]]; then
                echo -e "\n"
            fi
            echo "$line" | sed 's/#//'
        fi
    done < $HOME/.functions
}

function usage() {
    echo "cmd.sh"
    echo
    echo "This script outputs the aliases and/or functions defined in the"
    echo ".alias and .functions files."
    echo
    echo "Usage:"
    echo
    echo "  all             - show all"
    echo "  alias           - show alias"
    echo "  functions       - show functions"

}

function main() {
    local cmd=$1

    if [[ -z "$cmd" ]]; then
        usage
        exit 1
    fi

    if [[ $cmd == "all" ]]; then
        alias
        functions
    elif [[ $cmd == "alias" ]]; then
        alias
    elif [[ $cmd == "functions" ]]; then
        functions
    fi
}

main "$@"

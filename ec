#!/bin/bash

# For remote editing

params=()
for p in "$@"; do
    if [ "$p" == "-n" ]; then
        params+=("$p")
    elif [ "${p:0:1}" == "+" ]; then
        params+=("$p")
    else
        params+=("/ssh:spicy-emacs:"$(readlink -f $p))
    fi
done

echo emacsclient -f $HOME/.emacs.d/server/server-t460s "${params[@]}"
emacsclient -f $HOME/.emacs.d/server/server-t460s "${params[@]}"

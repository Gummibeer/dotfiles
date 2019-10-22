#!/bin/bash

function error_exit {
    echo "$1" >&2   ## Send message to stderr. Exclude >&2 if you don't want it that way.
    exit "${2:-1}"  ## Return a code specified by $2 or 1 by default.
}

if [ $# -eq 0 ]; then
    error_exit "No input filepath given"
fi

if [ ! -f "$1" ]; then
    error_exit "Input file does not exist"
fi

if [[ $(file --mime-type -b "$1") != image/gif ]]; then
    error_exit "Input file is not a gif image"
fi

INPUT=$1

if [ $# -eq 2 ]; then
    OUTPUT=$2
else
    OUTPUT="$INPUT.mp4"
fi

echo "convert [$INPUT] to [$OUTPUT]"

ffmpeg -f gif -i $INPUT -pix_fmt yuv420p -y $OUTPUT

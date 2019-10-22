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

if [[ $(file --mime-type -b "$1") != video/mp4 ]]; then
    error_exit "Input file is not a mp4 video"
fi

INPUT=$1
LENGTH=10
OUTPUT="part_%03d.mp4"

if [ $# -eq 2 ]; then
    LENGTH=$2
fi

if [ $# -eq 3 ]; then
    LENGTH=$2
    OUTPUT=$3
fi

echo "split [$INPUT] every [$LENGTH]s"

ffmpeg -i $INPUT -map 0 -c copy -f segment -segment_time $LENGTH -reset_timestamps 1 $OUTPUT

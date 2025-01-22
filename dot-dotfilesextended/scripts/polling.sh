#!/bin/bash

DIR_TO_WATCH=${1}

trap "echo Exited!; exit;" SIGINT SIGTERM

while [[ 1=1 ]]
do
    watch --chgexit -n 4 "ls --all -l --recursive --full-time ${DIR_TO_WATCH} | sha256sum " && ${2} && ${3} && ${4} && sleep 7
    echo "DONE!"
    echo "DONE!"
    echo "DONE!"
    echo "DONE!"
    echo "DONE!"
    echo "DONE!"
done

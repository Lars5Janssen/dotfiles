#! /bin/bash
filedir="$(dirname $1)"
nvim $1 -c "Neotree dir=$filedir"

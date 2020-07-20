#!/bin/bash
# Author:  Louis de Charsonville
# Description: search for content in line of a directory
# Arguments
# $1 : str, regex for content
# $2 : str (optional, default='*'), regex for filename

# Check arguments
if [ -z "$1" ]; then
   echo "ERROR: search is to be used with at least one argument"
   echo "-> search regex_for_content [regex_for_filename | '*' ]"
   exit 1
else
   echo "Searching..."
fi
if [ -z "$2" ]; then
   regex_filename="*"
else
   regex_filename="${2}"
fi

function search_in_file {
   while read data; do
       awk -v file=${data} -v regex=${1} '{if ($0 ~ regex) {print "File:",file,"| Line:",NR,"|",$0}}' ${data}
   done
}

find . -name "${regex_filename}" -type f | search_in_file "${1}"

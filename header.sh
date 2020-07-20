# file print the header of a file
# @ Arguments
# $1 : str, path to file
# $2 : str (optional, default=','), field separator
# $3 : int (optional, default=1), header line number
# ------------------------------------------
if (( $# < 1 )); then
    echo "ERROR: header requires at least one argument, the path to a csv file"
    echo "-> header PATH_TO_CSV [SEPARATOR | ,] [HEADER_LINE_NUMBER | 1]"
    exit 1
else
    if [ -z "${2}" ]; then sep=","; else sep="${2}"; fi
    if [ -z "${3}" ]; then headerLineNb=1; else headerLineNb="${3}"; fi
    echo "Header of file ${1}"
    echo "--------------------------"
    head -${headerLineNb} ${1} | tail -1 | awk -F"${sep}" -v ofs="${2}" 'BEGIN{OFS=ofs; print "# - FIELD NAME";}{for (i=1; i<NF+1; i+=1) {$i=i" - "$i;}}1' | tr "${sep}" $'\n' | column -t -s="-"
fi

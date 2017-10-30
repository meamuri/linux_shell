#!/bin/bash
# Вывести список пользователей, присутствующих в файле /etc/group, список уникален,
# отсортирован, для каждого вывести количество повторений

# Задача 4 также делается шелл-скриптом, но делается при помощи AWK, при этом
# конечный результат при помощи latex выводится в PDF-файл. Команды AWK могут
# быть написаны прямо в тексте шелл-скрипта либо лежать отдельными файлами и
# дергаться из шелл-скрипта, совершенно не принципиально. Файл Latex пишется из
# AWK.

USAGE="
Usage: n4_ex2_tex output
Task: Вывести список пользователей, присутствующих в файле /etc/group, список уникален, 
отсортирован, для каждого вывести количество повторений"

HEADER="
\\documentclass{article}
\\usepackage[english]{babel}
\\usepackage{longtable}
\\begin{document}
\\begin{longtable}{ |l|l| }
\\hline 
\\multicolumn{1}{|c|}{Depth} &
\\multicolumn{1}{c|}{PID} \\\\
\\endfirsthead
\\hline
\\endhead
\\hline
\\endfoot
"

AWK_CODE='
{
  depth[NR] = $1
  nfs[NR] = NF
  for (i = 2; i <= NF; i++)
    a[NR, i - 1] = $i
}
END {
  for (i = 1; i <= NR; i++) {
    printf "\\hline " depth[i] "\n"
    for (j = 1; j < nfs[i]; j++) {
      printf " & " a[i, j] " \\\\ \n"
    }
  }
}
'


TAIL="
\\end{longtable}
\\end{document}
"

function make_pdf {
    IN="$1"
    OUT="$2"
    TMP=`mktemp`
    echo "$HEADER" > "$TMP"
    awk "$AWK_CODE" "$IN" >> "$TMP"
    echo "$TAIL" >> "$TMP"
    pdflatex "$TMP" > /dev/null
    rm "$TMP"
    rm tmp.log tmp.aux
    mv "tmp.pdf" "$OUT"
}


if [ "$1" == "-h" ] || [[ $# != 1 ]]; then
    echo "$USAGE"
    exit 0
fi

OUT="res.pdf"
INFO=$(cat /etc/group | grep "[a-z,]\+$" -o | tr ',' '\n' | sort | uniq -c)
make_pdf $INFO $OUT
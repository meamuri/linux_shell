#!/bin/bash
# Вывести список пользователей, присутствующих в файле /etc/group, список уникален,
# отсортирован, для каждого вывести количество повторений

# Задача 4 также делается шелл-скриптом, но делается при помощи AWK, при этом
# конечный результат при помощи latex выводится в PDF-файл. Команды AWK могут
# быть написаны прямо в тексте шелл-скрипта либо лежать отдельными файлами и
# дергаться из шелл-скрипта, совершенно не принципиально. Файл Latex пишется из
# AWK.

USAGE="
Usage: n4_ex2_tex
Task: Вывести список пользователей, присутствующих в файле /etc/group, список уникален, 
отсортирован, для каждого вывести количество повторений"

if [ "$1" == "-h" ] || [[ $# != 0 ]]; then
    echo "$USAGE"
    exit 0
fi

AWK_CODE='
BEGIN{
  printf "\\documentclass{article}"
  printf "\\usepackage[english]{babel}"
  printf "\\usepackage{longtable}"
  printf "\\begin{document}"
}
{ 
  print $0 "\n"
}
END{
  printf "\\end{document}"
}'

INFO=$(cat /etc/group | grep "[a-z,]\+$" -o | tr ',' '\n'| sort | uniq -c)
TMP=`mktemp`
echo "$INFO" | awk "$AWK_CODE" >> "$TMP"
pdflatex "$TMP" > /dev/null
rm "$TMP"
rm tmp.log tmp.aux
mv "tmp.pdf" "res.pdf"
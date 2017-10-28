#!/bin/bash
# Вывести список пользователей, присутствующих в файле /etc/group, список уникален,
# отсортирован, для каждого вывести количество повторений

# Задача 4 также делается шелл-скриптом, но делается при помощи AWK, при этом
# конечный результат при помощи latex выводится в PDF-файл. Команды AWK могут
# быть написаны прямо в тексте шелл-скрипта либо лежать отдельными файлами и
# дергаться из шелл-скрипта, совершенно не принципиально. Файл Latex пишется из
# AWK.

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

TAIL="
\\end{longtable}
\\end{document}
"
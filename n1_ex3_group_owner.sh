#!/bin/bash
# Найти в директории файлы, группа-владелец которых содержит текущего
# пользователя и являются обычными файлами

USAGE="Usage: n1_ex3_group_owner [--help]"
INFO="Найти в директории файлы, группа-владелец которых содержит \n
текущего пользователя и являются обычными файлами"

if [[ $# >0 && $1 -eq '--help' ]]; then
	echo $USAGE
	echo $INFO
else
    u="$USER"
	# find . -type f -gname -print
    echo $u
    find . -type f -print
fi
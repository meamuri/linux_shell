#!/bin/bash
# Найти в директории файлы, группа-владелец которых содержит текущего
# пользователя и являются обычными файлами

USAGE="Usage: n1_ex3_group_owner [--help]"
INFO="Найти в директории файлы, группа-владелец которых содержит \n
текущего пользователя и являются обычными файлами"

if [[ $# > 1 && $1 -eq '--help' ]]; then
	echo $USAGE
	echo $INFO
	exit 0
fi 

COMMAND_PART=`groups | sed 's/ / -or -group /g'`
/usr/bin/find . -type f -group $COMMAND_PART
#!/bin/bash
# Найти в директории файлы, группа-владелец которых содержит текущего
# пользователя и являются обычными файлами

USAGE="
Usage: n1_ex3_group_owner [--help]
Найти в директории файлы, группа-владелец которых содержит 
текущего пользователя и являются обычными файлами"

if [[ $1 == "--help" ]]; then
	echo "$USAGE"
	exit 0
fi 

COMMAND_PART=`groups | sed 's/ / -or -group /g'`
/usr/bin/find . -type f -group $COMMAND_PART
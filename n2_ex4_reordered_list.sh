#!/bin/bash
# Используя команду last, вывести уникальный обратно-упорядоченный список
# пользователей, которыми был осуществлен вход в систему за вчера (вчера — это от
# полночи до полночи, независимо от текущего часа и минуты)

last -t "-1 day" '+%Y-%m-%d' | awk '{print $1;}' | sort -r | uniq
# date -d "-1 day" '+%Y-%m-%d'
# last -t "yesterday" '+%Y-%m-%d' | sort -r | uniq
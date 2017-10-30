#!/bin/bash
# Используя команду last, вывести уникальный обратно-упорядоченный список
# пользователей, которыми был осуществлен вход в систему за вчера (вчера — это от
# полночи до полночи, независимо от текущего часа и минуты)

last | grep "`date -d "-1 day" | awk '{print $1 " " $2 " " $3 }'`"
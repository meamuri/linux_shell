#!/bin/bash
# Вывести список пользователей, присутствующих в файле /etc/group, список уникален,
# отсортирован, для каждого вывести количество повторений

cat /etc/group | sort | uniq -c
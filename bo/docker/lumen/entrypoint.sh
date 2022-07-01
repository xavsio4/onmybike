#!/bin/bash

PIDS=();
nginx -g "daemon off;" & PIDS+=($!);
php-fpm & PIDS+=($!);

FLAG=''
trap '
  if [ ! "$FLAG" ]; then
    FLAG=true
    ((${#PIDS[@]})) && kill "${PIDS[@]}"
  fi
' CHLD

set -m;
wait;
set +m
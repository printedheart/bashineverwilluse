#!/bin/bash

RETURNED_IPv4=$(dig +short @$1 $2)

if [ "$RETURNED_IPv4" == "$3" ]
  then
    echo 0
    exit 0
   else
    echo 1
    exit 1
fi

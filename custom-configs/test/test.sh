#!/bin/bash

RESPONSE=$(wget --server-response https://spring-music.com/ --no-check-certificate 2>&1 | awk '/HTTP\// {print $2}')

if [ $RESPONSE = 200 ]; then
    echo "Spring-music Application is UP"
else
    echo "Got error $RESPONSE. Spring-music Application is DOWN :("
    exit 1
fi
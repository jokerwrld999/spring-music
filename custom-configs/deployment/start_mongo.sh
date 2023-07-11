#!/bin/sh

nohup sh -c 'mongod &'
sleep 4
nohup sh -c 'java -jar -Dserver.port=8080 -Dspring.profiles.active=mongodb ./spring-music-1.0.jar &'
tail -f /dev/null
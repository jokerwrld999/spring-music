#!/bin/bash

WORKING_DIR=$(echo $HOME/spring-music-app/)

/usr/bin/java -jar -Dserver.port=8090 -Dspring.profiles.active=mongodb $WORKING_DIR/spring-music-1.0.jar & echo $! > $WORKING_DIR/pid1.file & > /dev/null 2>&1
#java -jar -Dserver.port=8091 -Dspring.profiles.active=mongodb $artifact & echo $! > ./pid2.file &
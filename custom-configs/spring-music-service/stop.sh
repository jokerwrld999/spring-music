#!/bin/bash

WORKING_DIR=$(echo $HOME/spring-music-app/)

kill $(cat $WORKING_DIR/spring-music/spring-music-service/pid1.file)
#kill $(cat ./pid2.file)
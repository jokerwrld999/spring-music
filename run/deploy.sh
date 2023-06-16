#!/bin/bash

SRC=$(echo $(pwd)../)
ARTIFACT=$(echo $SRC/build/libs/spring-music-1.0.jar)
APP_DIR=$HOME/spring-music-app

mkdir $APP_DIR
yes | cp -rf $ARTIFACT $APP_DIR/
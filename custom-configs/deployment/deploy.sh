#!/bin/bash

ARTIFACT=$(echo $SRC/build/libs/spring-music-1.0.jar)
APP_DIR=$HOME/spring-music-app

mkdir $APP_DIR
yes | cp -rf $ARTIFACT $APP_DIR/
yes | cp -rf $SRC/custom-configs/spring-music-service $APP_DIR/
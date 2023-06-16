#!/bin/bash

ARTIFACT=$(echo $SRC/build/libs/spring-music-1.0.jar)
APP_DIR=$HOME/spring-music-app

echo "  ----- setup base directory -----  "
mkdir $APP_DIR
yes | cp -rf $ARTIFACT $APP_DIR/
yes | cp -rf $SRC/custom-configs/spring-music-service $APP_DIR/

echo "  ----- copy unit file for application -----  "
sudo mv -f $SRC/custom-configs/spring-music-service/spring-music.service /etc/systemd/system/spring-music.service

echo "  ----- start the application -----  "
sudo systemctl start spring-music
sudo systemctl enable spring-music
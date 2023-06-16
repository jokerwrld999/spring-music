#!/bin/bash

ARTIFACT=$(echo $SRC/build/libs/spring-music-1.0.jar)
APP_DIR=$HOME/spring-music-app

echo "  ----- setup base directory -----  "
mkdir $APP_DIR
yes | cp -rf $ARTIFACT $APP_DIR/
sudo chmod 500 $APP_DIR/spring-music-1.0.jar

echo "  ----- copy unit file for application -----  "
sudo mv -f $SRC/custom-configs/spring-music-service/spring-music.service /etc/systemd/system/spring-music.service

echo "  ----- start the application -----  "
sudo systemctl enable --now spring-music
#sudo systemctl stop spring-music
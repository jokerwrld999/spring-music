#!/bin/bash


echo $artifact
java -jar -Dserver.port=8090 -Dspring.profiles.active=mongodb $artifact & echo $! > ./pid1.file &
#java -jar -Dserver.port=8091 -Dspring.profiles.active=mongodb $artifact & echo $! > ./pid2.file &
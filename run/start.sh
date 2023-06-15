#!/bin/bash
pipeline=$(pwd)
artifact=$(echo /home/jokerwrld/jenkins_slave/workspace/Spring-music-Pipeline/build/libs/spring-music-1.0.jar)

java -jar -Dserver.port=8090 -Dspring.profiles.active=mongodb /home/jokerwrld/jenkins_slave/workspace/Spring-music-Pipeline/build/libs/spring-music-1.0.jar & echo $! > ./pid1.file &
java -jar -Dserver.port=8091 -Dspring.profiles.active=mongodb $artifact & echo $! > ./pid2.file &
#!/bin/bash
#java -jar -Dserver.port=8090 -Dspring.profiles.active=mongodb ../build/libs/spring-music-1.0.jar & echo $! > ./pid1.file &
java -jar -Dserver.port=8091 -Dspring.profiles.active=mongodb ../build/libs/spring-music-1.0.jar & echo $! > ./pid2.file &
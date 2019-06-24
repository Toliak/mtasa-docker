#!/bin/bash
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
mkdir -p deathmatch modules
docker-compose up -d --build
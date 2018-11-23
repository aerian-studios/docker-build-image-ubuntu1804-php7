#!/bin/bash
####################################
#
# Build the docker image
#
####################################

#exit on error
set -e 

project=$1

owner="aerian-studios-jenkins"
version="0.0.1"

#docker build --no-cache -t $project .
docker build -t $project .

docker tag "$project:latest" "$owner/$project:$version"

#push the image to github/ECR
#docker login
#docker push "$owner/$project:$version"
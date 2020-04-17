#!/bin/bash
####################################
#
# Build the docker image
#
####################################

#exit on error
set -e 

project=$1

now=$(date +"%d-%m-%Y")

owner="aerian-studios-jenkins"
version="0.0.1"

#docker build --no-cache -t $project .
docker build -t $project .

echo "Tagging latest image"
docker tag "$project:latest" "$owner/$project:$version"
echo "Tagging dated image"
docker tag "$project:latest" "$owner/$project:$now"

#push the image to github/ECR
#docker login
#docker push "$owner/$project:$version"
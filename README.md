# docker-build-image-ubuntu1804-php7

*Build the image*
```
project="ubuntu1804-php7"
docker build -t $project .

#without cache (build fresh)
#docker build --no-cache -t $project .
```

*Push to remote*

Login to ECR:
```
ecsLogin=`aws --profile myprofile ecr get-login --no-include-email --region eu-west-1`
echo $ecsLogin
${ecsLogin}
```

Login to dockerhub:
```
docker login
```

Tag and push:
```
project="ubuntu1804-php7"
owner="aerian-studios"
version="0.0.1"
docker tag "$project:latest" "$owner/$project:$version"
docker push "$owner/$project:$version"
```

*Test the image locally*
```
project="ubuntu1804-php7"
volumePath="/path/to/folder/to/mount"
docker run -d -v $volumePath:/home/docker -t "$project:latest"
```

*Use the image in a Jenkinsfile* 

Has to be on same machine image was built

```
pipeline {
    agent {
      docker {
        image 'docker-build-image-ubuntu1804-php7:latest'
        args '--user=root'
      }
    }
...
```
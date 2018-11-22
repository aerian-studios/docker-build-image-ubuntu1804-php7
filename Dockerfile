FROM ubuntu:18.04

# Installing apt tools
RUN apt update
RUN apt-get install -y npm nodejs curl wget jq git unzip zip maven default-jdk
RUN export PATH=/usr/bin:/usr/local/bin:$PATH

# Installing npm/node
RUN npm install -g n npm@6.1.0 --unsafe-perm
RUN n 8.10

# Installing github release tool
RUN curl -L https://github.com/aktau/github-release/releases/download/v0.7.2/linux-amd64-github-release.tar.bz2 | tar -xjC /tmp && chmod +x /tmp/bin/linux/amd64/github-release

# Installing AWS CLI
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -b /usr/local/bin/aws
RUN aws --version
RUN rm awscli-bundle.zip

# Installing Terraform
RUN wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
RUN unzip terraform_0.11.7_linux_amd64.zip
RUN cp terraform /usr/local/bin/terraform
RUN rm terraform_0.11.7_linux_amd64.zip

# Upgrade npm
RUN npm install -g npm@6.1.0

FROM ubuntu:20.04
LABEL maintainer="Robert Jensen - robert@robert-jensen.dk"
LABEL description="CD/CD Container, containing all buld tools, used in my Buld Pipelines"
WORKDIR /tmp
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \ 
    python3-pip \
    unzip &&\ 
    # Install Docker-Compose
    export VER="1.28.2" &&\
    curl -L "https://github.com/docker/compose/releases/download/${VER}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&\
    chmod +x /usr/local/bin/docker-compose &&\
    # Install Packer
    export VER="1.6.6" &&\
    wget https://releases.hashicorp.com/packer/${VER}/packer_${VER}_linux_amd64.zip &&\
    unzip packer_${VER}_linux_amd64.zip &&\
    rm packer_${VER}_linux_amd64.zip &&\
    mv packer /usr/local/bin &&\
    #Install Packer Windows Update provisioner
    export VER="0.10.1" &&\
    wget https://github.com/rgl/packer-provisioner-windows-update/releases/download/v${VER}/packer-provisioner-windows-update_${VER}_linux_amd64.tar.gz &&\
    tar xf packer-provisioner-windows-update_${VER}_linux_amd64.tar.gz &&\
    rm packer-provisioner-windows-update_${VER}_linux_amd64.tar.gz &&\
    chmod +x packer-provisioner-windows-update &&\
    mv packer-provisioner-windows-update /usr/local/bin &&\
    rm LICENSE.txt &&\
    rm README.md &&\
    # Install Terraform
    export VER="0.14.6" &&\
    wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip &&\
    unzip terraform_${VER}_linux_amd64.zip &&\
    rm terraform_${VER}_linux_amd64.zip &&\
    mv terraform /usr/local/bin &&\
    #Get latest Terraform repo for VRA & VMC
    mkdir terraform &&\
    git clone https://github.com/vmware/terraform-provider-vra.git ./terraform/vra && \
    git clone https://github.com/vmware/terraform-provider-vmc.git ./terraform/vmc

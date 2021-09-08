FROM ubuntu:20.04
LABEL maintainer="Robert Jensen - robert@robert-jensen.dk"
LABEL description="CI/CD Container, containing all buld tools, used in my Buld Pipelines"
WORKDIR /tmp
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Copenhagen"
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \ 
    nano \ 
    golang \
    python3-pip \
    docker.io \
    unzip &&\ 
    # Install Docker-Compose
    export VER="1.29.2" &&\
    curl -L "https://github.com/docker/compose/releases/download/${VER}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&\
    chmod +x /usr/local/bin/docker-compose &&\
    echo "----------------------------------------" &&\
    echo "!!! Docker-Compose install complete !!!" &&\
    docker-compose --version &&\
    echo "----------------------------------------" &&\
    # Install Packer
    export VER="1.7.4" &&\
    wget https://releases.hashicorp.com/packer/${VER}/packer_${VER}_linux_amd64.zip &&\
    unzip packer_${VER}_linux_amd64.zip &&\
    rm packer_${VER}_linux_amd64.zip &&\
    mv packer /usr/local/bin &&\
    echo "----------------------------------------" &&\
    echo "!!! Packer install complete !!!" &&\
    packer --version &&\
    echo "----------------------------------------" &&\
    #Install Packer Windows Update provisioner
    wget https://github.com/rgl/packer-plugin-windows-update/releases/download/v0.14.0/packer-plugin-windows-update_v0.14.0_x5.0_linux_arm64.zip &&\
    unzip packer* &&\
    rm *.zip &&\
    chmod +x packer-plugin-windows-update* &&\
    mv packer-plugin-windows* /usr/local/bin &&\
    rm LICENSE.txt &&\
    rm README.md &&\
    echo "----------------------------------------" &&\
    echo "!!! Packer Windows Update provisioner install complete !!!" &&\
    echo "----------------------------------------" &&\
    # Install Terraform
    export VER="1.0.6" &&\
    wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip &&\
    unzip terraform_${VER}_linux_amd64.zip &&\
    rm terraform_${VER}_linux_amd64.zip &&\
    mv terraform /usr/local/bin &&\
    echo "----------------------------------------" &&\
    echo "!!! Terraform install complete !!!" &&\
    terraform --version &&\
    echo "----------------------------------------" &&\
    # Install Terraform VRA provider
    wget https://github.com/vmware/terraform-provider-vra/releases/download/v0.3.10/terraform-provider-vra_0.3.10_linux_amd64.zip &&\
    unzip terraform-provider* &&\
    rm *.zip &&\
    mkdir -p ~/.terraform.d/plugins/linux_amd64 &&\
    mv terraform-provider* ~/.terraform.d/plugins/ &&\
    rm LICENSE &&\
    rm README.md &&\
    echo "----------------------------------------" &&\
    echo "!!! Terraform VRA provider install complete !!!" &&\
    echo "----------------------------------------" &&\
    echo "Build Complete"

FROM registry.cmplab.dk/proxy/library/ubuntu:20.04
LABEL maintainer="Robert Jensen - robert@robert-jensen.dk"
LABEL description="CI/CD Container, containing all buld tools, used in my Buld Pipelines"
WORKDIR /tmp
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Copenhagen"
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \ 
    golang \
    python3-pip \
    docker.io \
    unzip &&\ 
    # Install Docker-Compose
    export VER="1.28.2" &&\
    curl -L "https://github.com/docker/compose/releases/download/${VER}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&\
    chmod +x /usr/local/bin/docker-compose &&\
    # Install Packer
    export VER="1.7.0" &&\
    wget https://releases.hashicorp.com/packer/${VER}/packer_${VER}_linux_amd64.zip &&\
    unzip packer_${VER}_linux_amd64.zip &&\
    rm packer_${VER}_linux_amd64.zip &&\
    mv packer /usr/local/bin &&\
    #Install Packer Windows Update provisioner
    export VER="0.11.0" &&\
    wget https://github.com/rgl/packer-provisioner-windows-update/releases/download/v${VER}/packer-provisioner-windows-update_${VER}_linux_amd64.tar.gz &&\
    tar xf packer-provisioner-windows-update_${VER}_linux_amd64.tar.gz &&\
    rm packer-provisioner-windows-update_${VER}_linux_amd64.tar.gz &&\
    chmod +x packer-provisioner-windows-update &&\
    mv packer-provisioner-windows-update /usr/local/bin &&\
    rm LICENSE.txt &&\
    rm README.md &&\
    # Install Terraform
    export VER="0.14.7" &&\
    wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip &&\
    unzip terraform_${VER}_linux_amd64.zip &&\
    rm terraform_${VER}_linux_amd64.zip &&\
    mv terraform /usr/local/bin &&\
    # Install Terraform VRA provider
    export VER="0.1.9" &&\
    wget -q https://github.com/vmware/terraform-provider-vra/releases/download/v${VER}/terraform-provider-vra-linux_amd64-v${VER}.tgz &&\
    tar xvf terraform-provider-vra-linux_amd64-v${VER}.tgz &&\
    rm terraform-provider-vra-linux_amd64-v${VER}.tgz &&\
    mkdir -p ~/.terraform.d/plugins/linux_amd64 &&\
    mv terraform-provider-vra_v${VER} ~/.terraform.d/plugins/ &&\
    # Install CS-CLI
    export VER="0.1.4" &&\
    wget https://download3.vmware.com/software/vmw-tools/vrealize-cs-cli/code-stream-cli_${VER}_Linux_x86_64.tar.gz &&\
    tar xvf code-stream-cli_${VER}_Linux_x86_64.tar.gz &&\
    rm code-stream-cli_${VER}_Linux_x86_64.tar.gz &&\
    rm LICENSE.txt &&\
    rm README.md &&\
    mv cs-cli /usr/local/bin 



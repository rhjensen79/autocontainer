FROM ubuntu:20.04
LABEL maintainer=robert@robert-jensen.dk
RUN apt-get update && apt-get install -y \
    curl \
    wget

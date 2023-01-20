FROM ubuntu

# 避免中文乱码
ENV LANG C.UTF-8

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list &&\
    apt-get update -y && \
    apt-get install build-essential python3 -y

COPY ./Paxos /root/labs/Paxos/
COPY ./WriteThrough /root/labs/WriteThrough/
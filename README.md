# Advanced Distributed System Experiment
HUST, CS, 2022 Advanced Distributed System, Course lab assignments

## 实验环境
课程实训环境为在线答题网站[educoder](https://www.educoder.net/).  

Paxos 实验需运行在 Linux 环境; WriteThrough 实验只需 Python 环境, Windows 或 Linux 均可.  

源码中提供了 `Dockerfile` 文件, 可用于构建实验所需环境的镜像.

## Docker 环境构建
镜像构建
```
docker build -t ads_img --rm .
```

容器构建
```
docker run --name=ads_c --hostname=ads_c -it ads_img
```

实验源码在容器 `/root/labs/` 目录下  
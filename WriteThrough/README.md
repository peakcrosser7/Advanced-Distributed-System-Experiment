# 分布式缓存一致性——写穿算法(Write Through)

## 任务描述
本关任务：补充程序实现写穿算法

## 相关知识
为了完成本关任务，你需要掌握：1.分布式文件系统基础概念，2.写穿算法。

### 分布式文件系统
* 从用户的使用角度来看，分布式文件系统是一个标准的文件系统，提供了一系列 API，由此进行文件或目录的创建、移动、删除，以及对文件的读写等操作
* 从内部实现角度来看，分布式文件系统还要通过网络管理存储在多个节点上的文件和目录。并且，同一文件不只是存储在一个节点上，而是按规则分布存储在一簇节点上，协同提供服务
### 写穿算法
当用户在修改高速缓存项（文件或块）时，新的值保存在高速缓存中，并立即写回到服务器，当用户读取速缓存项（文件或块）时，需要先和服务端进行文件的 version 号比对，如果一致，直接从高速缓存项 cache 中读取文件，如果不一致则从服务器中读取文件并将文件缓存在本地高速 cache 中。

## 编程提示
类与函数解释

```python
sim_file 模拟文件条目类
    sim_file.write(data,verion) 向文件条目写入 data 和 version
    sim_file.get_data() 获取文件条目数据，返回 file_name,data,version
    sim_file.get_version() 获取文件 version
server 模拟服务器类，在cache类初始化时绑定为 self._target_server，请使用该变量调用
    server.write(target_file,data,version) 尝试向服务器写入目标文件，如果目标文件已经存在，则会覆盖写入
    server.read(target_file) 尝试向服务器读取目标文件，如果服务器中存在该文件，则会返回 file_name,data,version
        如果不存在，则会返回 None
    server.get_version(target_file) 尝试向服务器获取目标文件 version
cache 模拟高速缓存类(在实现的函数中时候 self 调用下列函数)
    cache._get_new_version() 返回一个时间戳作为 version
    cache._read_cache(target_file) 尝试从高速缓存中读取目标文件，
        如果高速缓存中存在该文件，则会返回 file_name,data,version
        如果不存在，则会返回 None 
    cache._write_cache(target_file,data,version) 尝试向高速缓存中写入目标文件，如果目标文件已经存在，则会覆盖写入
    cache._search_cache(target_file) 在高速缓存中检索文件是否已经缓存
注意:
    测试数据确保不会出现读取服务器不存在的文件
    测试程序不存在也不要求高速缓存换出的情况
    请勿直接操作 cache 类和 server 类私有变量(除了调用 _target_server 外)
```

## 编程要求
根据提示，在右侧编辑器补充代码，根据 `cache.py` 中的提示完成 `cache` 类的读和写程序
读函数编写
```python
    ####### Begin #######
    
    #检查缓存中是否已缓存文件

    #向server确认version是否一致

    #选择从cache/server中读取文件

    #缓存从server中读取的文件
    
    ######## End ########
```

写函数编写
```python
    ####### Begin #######

    #生成新version

    #向cache中写入数据并更新version

    #向server中写入数据并更新version

    ######## End ########
```

## 测试说明
平台会对你编写的代码进行测试：

测试输入解释：第一行两个数字分别代表读写的操作次数 m 和用户数量 n。接下来的 m 行中每一行分为读和写两种操作类型，当操作类型是 “write” 时，后面三个参数分别是用户编号、文件编号、写入的文件数据（int 类型）；当操作类型是 “read” 时，后面两个参数分别是用户编号、文件编号。

在程序实际运行中，你并不需要对输入进行处理，测试程序会处理输入并按照输入调用 cache 类的 read 和 write 函数

测试输出解释：每一行的数字是每个 “read” 操作后返回的文件数据（int 类型）

## 测试集
### 测试集 1
测试输入
```
5 2
write 0 0 10
read 0 0
read 1 0
write 1 0 5
read 0 0
```
预期输出:
```
10
10
5
```
### 测试集 2
测试输入
```
5 3
write 2 0 63
write 1 1 84
read 1 0 
write 1 0 22
read 0 1
```
预期输出:
```
63
84
```
### 测试集 3
测试输入
```
4 3
write 2 1 42
read 0 1 
write 2 0 80
write 2 1 55
```
预期输出:
```
42
```

## 本地测试
运行 `python3 test_main.py` 开始测试, 在命令行中按行输入测试集, 每行 "read" 输入都会对应 1 个输出.
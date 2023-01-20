## 任务描述
根据 Paxos 算法流程完成相关核心成员函数设计。

## 相关知识
在学习之前，我们可以先了解一下相关概念知识。

### 角色
在 Paxos 算法中有以下几个角色:
* 提议者(proposer): 进行提议的角色；
* 批准者(acceptor): 通过提议的角色；
* 学习者(learner): 感知(learn)被选中的提议。

在具体的实现中，一个进程可能同时充当多种角色。比如一个进程可能既是 Proposer 又是 Acceptor 又是 Learner。

### 提案
还有一个很重要的概念叫提案（ Proposal ）。最终要达成一致的 value 就在提案里。
Proposer 可以提出（ propose ）提案； Acceptor 可以接受（ accept ）提案；如果某个提案被选定（ chosen ），那么该提案里的 value 就被选定了。

### 选定提案
在何种情况下不同的进程认为提案被选中了？

Proposer ：只要 Proposer 发的提案被 Acceptor 接受， Proposer 就认为该提案里的 value 被选定了。

Acceptor ：只要 Acceptor 接受了某个提案，Acceptor 就认为该提案里的value 被选定了。
Learner：Acceptor 告诉 Learner 哪个 value 被选定，Learner 就认为那个 value 被选定。

## 编程要求
根据提示，在右侧编辑器中的 begin-end 间补充代码，根据 Paxos 算法流程完成 Proposer.cpp 和 Acceptor.cpp 中 Proposer 和 Acceptor 类的核心成员函数设计。

## 测试说明
后台会自动检测你的输出结果，当与预期输出一致时，则算通关。

实验正确输出大致如下：
```
2019-11-28 18:36:41 Tid:6061 [Info] Proposer4号的提议被批准,用时3763MS:最终提议 = [编号:5，提议:5]
2019-11-28 18:36:52 Tid:6059 [Info] Proposer2号的提议被批准,用时15085MS:最终提议 = [编号:13，提议:5]
2019-11-28 18:36:58 Tid:6058 [Info] Proposer1号的提议被批准,用时206064S:最终提议 = [编号:17，提议:5]
2019-11-28 18:37:04 Tid:6057 [Info] Proposer0号的提议被批准,用时26425MS:最终提议 = [编号:21，提议:5]
2019-11-28 18:37:09 Tid:6060 [Info] Proposer3号的提议被批准,用时31679MS:最终提议 = [编号:24，提议:5]
2019-11-28 18:37:09 Tid:6060 [Info] Paxos完成，用时31702MS，最终通过提议值为∶5
```

为了便于评测，后台会对结果进行处理，处理后的预期输出如下：
```
最终通过提议值为：5
```
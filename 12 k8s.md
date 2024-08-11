
# k8s概述

架构

# k8s集群搭建
两种方式
- kubeadmin
- 二进制

# YAML文件
资源清单文件

文件书写格式
对象
数组
纯量
布尔 true false
null 用~表示


# 集群命令行工具kubectl
```shell
kubectl [command] [resourceType] [resourceName]  [flags]
```

# Pod
1. 基本概念
2. 存在意义
 - 多进程
 - 应用亲密性
3. 实现机制
**共享网络**
通过pause容器，把其他业务容器加入到pause容器里面，让所有业务容器在同一个名称空间里面，实现共享网络。
**共享存储**
引入数据卷volume概念，使用数据卷进行持久化存储。

4. pod镜像拉取策略

5. pod资源限制策略
```yaml
spec:
  resource：
    requests：
    limits：
```

6. pod重启机制
`restartPolicy`

7. pod 健康检查
```yaml
spec:
  livenessProbe:
    exec:
      command:
      - cat
      - /tmp/healthy
      initialDelaySeconds:5
      periodSeconds:5
```
8. pod的调度
 - 创建pod的流程
 - 影响调用的属性
**pod资源限制**对调用的影响
**节点选择器标签**影响pod调度
nodeSelector  节点选择器
```yaml
spec:
  nodeSelector:
    env_role:dev
```
节点亲和性 影响pod调度
	nodeAffinity
	硬亲和性：
	`requiredDuringschedulingIgnoredDuringExecution:`
	软亲和性：
	`preferredDuringschedulingIgnoredDuringExecution:`

常用操作符
IN NOT IN EXIST GT LT DoesNotExist

反亲和性

污点（针对节点） 和 污点容忍
污点的三个值
`NoSchedule`
`PreferNoSchedule`
`NoExecute`
节点添加污点
`kubectl taint node [nodeName] key=value:污点三个值`
污点容忍  针对pod
```yaml
spec:
  tolerations:
    key:"key"
    operator:"Equal"
    value:"value"
    effect:"NoSchedule"
```


```yaml
apiversion: v1
kind: Pod
metadata:mypod
spec:
	nodeSelector:
	  env_role:dev
    containers:
      image: nginx:1.14
      imagePullPolicy: Always  # 可选 Always Never  IfNotPresent
      args：[]
    resources:
      requests:
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu:"500m"
    restartPolicy: Never    # 可选 Always Never OnFailure
    livenessProbe:
      exec:
        command:
        - cat
        - /tmp/healthy
      initialDelaySeconds: 5
      periodSeconds: 5
    affinity:   # 节点亲和性
      nodeAffinity:
         requireDuringSchedulingIgnoredDuringExecution:
         - matchExpressions:
            - key : env_role
              operator: In
              values:
              - dev
              - test
        preferredDuringschedulingIgnoredDuringExecution:
        - weight:1
          preference:
            matchExpressions:
            - key:group
              operator:In
              values:
              - otherprod
        
```
# label
标签
# controller
Replication Controller
1. 什么是controller
	在集群上管理和运行的容器的对象
2. pod和controller的关系
   - pod通过controller实现应用的运维
   - pod和controller通过label标签建立关系
3. depolyment控制器应用场景
	 - 用于部署**无状态**应用
	 - 管理pod和ReplicaSet
	 - 部署，滚动升级等功能
	 - 应用场景，web服务，微服务
4. depolyment部署应用步骤

5. 部署应用的升级回滚和弹性伸缩
   - 应用升级
   - 应用伸缩

有状态应用

无状态应用

- 部署有状态应用
SatefulSet
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  ports:
  - port: 80
    name: web
  clusterIP: None
  selector:
    app: nginx
---

apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: nginx-statefulset
  namespace: default
spec:
  serviceName: nginx
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```
- 部署守护进程DaemonSet
让所有的node都运行在同一pod中
```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: ds-test
  labels:
    app: filebeat
spec:
  selector:
    matchLabels:
      app: filebeat
  template:
    metadata:
      labels:
        app: filebeat
    spec:
      containers:
      - name: logs
        image: nginx
        ports:
        - containerPort: 80
        volumeMounts:
        - name: varlog
          mountPath: /tmp/log
      volumes:
      - name: varlog
        hostPath:
          path: /var/log
```
- job（一次性任务）
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: pi
spec:
  template:
    spec:
      containers:
      - name: pi
        image: perl
        command: ["perl",  "-Mbignum=bpi", "-wle", "print bpi(2000)"]
      restartPolicy
```
- cronjob（定时任务）
```yaml
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: hello
spec:
  schedule: "*/1 * * * *"  # 时间表达式
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: hello
            image: busybox
            args:
            - /bin/sh
            - -c
            - date; echo Hello from the Kubernetes cluster
          restartPolicy: OnFailure
```
# volume
数据卷
```yaml
apiVersion: v1 
kind: Pod 
metadata:
  name: test-pd 
spec:
  containers:
  - image: docker.io/nazarpc/webserver
  name: test-containervolumeMounts:
  - mountPath: /cache 
  - name: cache-volume
  volumes:
  - name: cache-volume 
  - emptyDir: {}
```
# pvc  vc

# secret

# configMap
存储不加密数据到ETCD，让pod以变量或者volume挂载到容器中 
# NameSpace

# Service
定义一组pod的访问规则
服务发现
1. service存在意义
  - 防止pod失联（服务发现）
  - 定义一组pod访问策略（负载均衡 ）
2. service和pod的关系
  - 根据label和selector标签建立关联
service有独立的ip，叫做vip，或虚拟ip
3. 常用的service类型
  - ClusterIP：集群内部进行使用
  - NodePort：对外访问应用使用
  - LoadBalancer ：公有云

```
kubectl expose depolyment nginx --port=80 --targetPort=80 type=NodePort
```

# 安全机制

对deployment，pod ，service 等资源的 操作权限控制

RBAC（role base access control）

创建一个角色
```
kind: Role

apiVersion: rbac.authorization.k8s.io/v1

metadata:

  namespace: ctnrs

  name: pod-reader

rules:

- apiGroups: [""] # "" indicates the core API group

  resources: ["pods"]

  verbs: ["get", "watch", "list"]
```


# ingress


# helm

helm  一个命令行客户端工具

chart  把yaml打包，是yaml的集合

release

# nfs
持久化存储

服务端（存储数据的节点）

客户端（k8s集群节点）

## PV PVC

# 集群资源监控
监控指标
监控平台

普罗米修斯

# 高可用集群

vip 虚拟ip

keepalived

haproxy


# k8s部署项目


# 探针

# 调度器

[# Centos7 Minimal 版本基本配置记录](https://blog.csdn.net/qq_42183414/article/details/128673002)




# 云计算

[云计算](https://baike.baidu.com/item/%E4%BA%91%E8%AE%A1%E7%AE%97/9969353?fromModule=lemma_inlink)中讨论的服务包括基础设施即服务（[IaaS](https://baike.baidu.com/item/IaaS/5863121?fromModule=lemma_inlink)），**平台即服务**（PaaS）和**软件即服务**（[SaaS](https://baike.baidu.com/item/SaaS/6703273?fromModule=lemma_inlink)）三个层次的服务。

平台即服务（PaaS）是云计算的重要组成部分，提供运算平台与解决方案服务 [1]  。在云计算的典型层级中，PaaS层介于**软件即服务与基础设施即服务之间**。

PaaS提供用户将云端基础设施部署与创建至客户端，或者借此获得使用编程语言、程序库与服务。用户不需要管理与控制云端基础设施（包含[网络](https://baike.baidu.com/item/%E7%BD%91%E7%BB%9C/143243?fromModule=lemma_inlink)、[服务器](https://baike.baidu.com/item/%E6%9C%8D%E5%8A%A1%E5%99%A8/100571?fromModule=lemma_inlink)、操作系统或存储），但需要控制上层的应用程序部署与应用托管的环境。PaaS将软件研发的平台做为一种服务，以软件即服务（SaaS）模式交付给用户。PaaS 提供软件部署平台（runtime），抽象掉了硬件和操作系统细节，可以无缝地扩展（scaling）。开发者只需要关注自己的业务逻辑，不需要关注底层。即PaaS 为生成、测试和部署软件应用程序提供一个环境。

# harbor镜像仓库
# k8s学习笔记

192.168.56.102 master

192.168.56.103 node1

192.168.56.104 node2

wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo  
​  
yum -y install docker-ce-18.06.1.ce-3.el7  
​  
​  
cat > /etc/docker/daemon.json << EOF  
{  
"registry-mirrors": ["https://b9pmyelo.mirror.aliyuncs.com"]  
}  
EOF  
​  
cat > /etc/yum.repos.d/kubernetes.repo << EOF  
[kubernetes]  
name=Kubernetes  
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64  
enabled=1  
gpgcheck=0  
repo_gpgcheck=0  
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg  
https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg  
EOF  
​  
​  
kubeadm init \  
--apiserver-advertise-address=192.168.56.102 \  
--image-repository registry.aliyuncs.com/google_containers \  
--kubernetes-version v1.17.0 \  
--service-cidr=10.96.0.0/12 \  
--pod-network-cidr=10.244.0.0/16  
EOF

k8s **Kubernetes1.24版本及以上移除了对docker的直接集成**，使用containerd实现。

[【Kubernetes1.26.x：container runtime is not running问题详细排查】_mikasa_akm的博客-CSDN博客](https://blog.csdn.net/weixin_52156647/article/details/129758753)
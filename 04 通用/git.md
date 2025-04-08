# git

`git init`  

工作区  暂存区   版本库  
工作区(Working Directory):

- 就是你在电脑里能看到的目录,即当前项目目录
- 是我们直接编辑文件的地方

暂存区(Stage/Index):

- 是一个临时存储区域
- 用于存放已经通过git add命令添加的文件修改内容
- 是准备提交到版本库的文件修改内容

版本库(Repository):

- 工作区有一个隐藏目录.git,这个不算工作区,而是Git的版本库
- 版本库中存储了很多东西,其中最重要的就是stage(暂存区)
- 还有Git为我们自动创建的第一个分支master,以及指向master的一个指针叫HEAD
- 通过git commit命令将暂存区的内容提交到当前分支

`git add`      将文件添加到暂存区
`git ls-files`  查看暂存区中的文件

`git rm  filename`    把文件从工作区和暂存区同时删除
`git rm --cached filename`  把文件从暂存区删除，但保留在当前工作区中
`git rm -r *`  递归删除某个目录下的所有子目录和文件
删除后不要忘记提交

## git commit

`git commit -m "xxx"`  提交说明
`git commit --amend`    修改先前的提交

## git reset

| 选项 | 作用|
|------|------|
|--soft| 保留工作区和暂存区      |
|--hard| 删除工作区和暂存区    |
|--mixed| 保留工作区，删除暂存区 |

## git diff 

一般用图形化工具

[git diff 命令](https://blog.csdn.net/liuxiao723846/article/details/109689069)

## git push

## git pull

## git status

## git log

## git merge

`git merge feature`   将 feature 分支合并到当前分支

## git  rebase

将一个分支的提交历史“重新定位”到另一个分支的最新提交上，从而形成线性的提交历史。

## git checkout

`git checkout -b`

## git switch

## git branch

`git clone -b barnch-name`  克隆指定分支

git remote -v   查看git远程仓库地址
git remote set-url origin 新地址    替换成新地址

## tag 打标签

`git tag v1.0`

- [创建标签](https://liaoxuefeng.com/books/git/tag/create/index.html)
- [操作标签](https://liaoxuefeng.com/books/git/tag/push-delete/index.html)
- https://blog.csdn.net/weixin_39642619/article/details/111223447
- https://blog.csdn.net/lovedingd/article/details/127568704
- https://blog.csdn.net/weixin_43715214/article/details/131059079

``` shell
git push origin --tags #推送标签
```

`git fetch --all --tags` 获取远程仓库所有标签
[how to check out git tags](https://devconnected.com/how-to-checkout-git-tags/)

## config

- 免密拉取 `gitee`   `git config --global credential.helper store`
- 关闭ca认证  `sudo git config --system http.sslverify false`
- `git config --global http.sslverify false`

```shell
git config --local --list
git config --local user.name dukechase
git config --local user.email  hsb2435@163.com
```

## [Git 多用户配置](https://www.cnblogs.com/cangqinglang/p/12462272.html)

### 各部分含义

1. **`Host gitee`**
    - 定义了一个别名 `gitee`，表示你可以通过这个别名来简化对 Gitee 的连接。
    - 当你在命令行中使用 `ssh gitee` 或与 Gitee 相关的 Git 操作时，SSH 客户端会根据这个别名查找对应的配置。
2. **`HostName gitee.com`**
    - 指定了实际的目标主机地址，这里是 `gitee.com`。
    - 当你使用别名 `gitee` 时，SSH 客户端会将它解析为 `gitee.com`。
3. **`Port 22`**
    - 指定了连接到目标主机时使用的端口号，默认情况下，SSH 使用的是 22 端口。
    - 如果 Gitee 使用非标准端口，则可以在这里修改为其他值。
4. **`IdentityFile ~/.ssh/gitee_id_rsa`**
    - 指定了用于身份验证的私钥文件路径。
    - 在这里，`~/.ssh/gitee_id_rsa` 是一个私钥文件，SSH 客户端会用它来验证你的身份，以便成功连接到 Gitee。

```text
Host github
HostName github.com
IdentityFile ~/.ssh/id_rsa_github

Host gitlab
HostName gitlab.mygitlab.com
IdentityFile ~/.ssh/id_rsa_gitlab
```

测试连接

```bash
ssh -T git@github
Hi jitwxs! You've successfully authenticated, but GitHub does not provide shell access.
```

```bash
ssh -T git@gitlab
Welcome to GitLab, @lemon!
```

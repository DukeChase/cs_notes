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

`git push <远程仓库名> <本地分支名>:<远程分支名>` 用于将本地分支的更新推送到远程仓库。
如果本地分支名和远程分支名相同，可以省略 `:<远程分支名>` 部分。例如 `git push origin main`。
`git push -u <远程仓库名> <本地分支名>` 首次推送时使用，`-u` 选项会将本地分支和远程分支关联起来，之后使用 `git push` 就可以直接推送。

## git pull

`git pull <远程仓库名> <远程分支名>` 用于从远程仓库拉取指定分支的更新，并尝试自动合并到当前本地分支。它实际上是 `git fetch` 和 `git merge` 的组合。如果本地分支已经和远程分支关联，可直接使用 `git pull`。

## git status

`git status` 用于查看工作区、暂存区的状态。它会显示哪些文件被修改但未暂存，哪些文件已暂存但未提交等信息。  
`git status -s` 可以以简洁模式显示状态信息。

## git log

`git log` 用于查看提交历史记录。
`git log --oneline` 可以将每条提交记录显示在一行，使输出更简洁。
`git log -n <数量>` 可以只显示最近的 `<数量>` 条提交记录。
`git log --graph` 可以以图形化的方式显示提交历史，便于查看分支合并情况。

## git merge

`git merge <分支名>` 用于将指定分支的修改合并到当前分支。

合并有两种常见情况：快进合并（Fast-forward）和三方合并（Three-way merge）。如果合并过程中出现冲突，需要手动解决冲突后再提交。`git merge --abort` 可以在合并冲突时放弃合并操作，回到合并前的状态。

`git merge feature`   将 feature 分支合并到当前分支

## git  rebase

将一个分支的提交历史“重新定位”到另一个分支的最新提交上，从而形成线性的提交历史。

## git checkout

`git checkout -b <新分支名>` 用于创建并切换到一个新的分支。
例如，`git checkout -b feature` 会创建一个名为 `feature` 的新分支，并立即切换到该分支。

`git checkout <分支名>` 用于切换到已有的分支。例如，`git checkout main` 会切换到 `main` 分支。

`git checkout <提交哈希值>` 用于切换到指定的提交，此时会处于“分离头指针”状态。在这种状态下的修改不会影响任何分支，除非创建新分支来保存这些修改。

## git switch

`git switch -c <新分支名>` 功能与 `git checkout -b` 类似，用于创建并切换到一个新的分支。
例如，`git switch -c bugfix` 会创建一个名为 `bugfix` 的新分支，并切换到该分支。

`git switch <分支名>` 用于切换到已有的分支，与 `git checkout <分支名>` 功能相同。
例如，`git switch develop` 会切换到 `develop` 分支。

`git switch` 是 Git 2.23 版本引入的新命令，旨在提供更清晰的分支切换操作，与 `git checkout` 相比，`git switch` 更专注于分支切换，而 `git checkout` 还可用于恢复文件等操作。

## git branch

`git branch` 用于列出本地所有分支，当前所在分支会用 `*` 标记。

`git branch <新分支名>` 用于创建一个新的分支，但不会切换到该分支。例如，`git branch experimental` 会创建一个名为 `experimental` 的新分支。

`git branch -d <分支名>` 用于删除已经合并到当前分支的指定分支。如果分支还有未合并的更改，使用该命令会失败，可使用 `git branch -D <分支名>` 强制删除。

`git branch -m <旧分支名> <新分支名>` 用于重命名本地分支。例如，`git branch -m old-name new-name` 会将 `old-name` 分支重命名为 `new-name`。

`git clone -b barnch-name`  克隆指定分支

## git remote

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

- 免密拉取   `git config --global credential.helper store`
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

## gitignore

`.gitignore` 文件用于指定 Git 应该忽略的文件和目录，即这些文件不会被纳入版本控制。

以下是 `.gitignore` 文件的常见规则：

### 1. 基本语法

- **忽略文件**：直接写上文件名，每行一个。例如：

```ignore
temp.txt
```

这会忽略项目根目录下的 `temp.txt` 文件。

- **忽略目录**：在目录名后加斜杠 `/`。例如：

```ignore
logs/
```

这会忽略项目根目录下的 `logs` 目录及其所有内容。

### 2. 通配符使用

- `*`：匹配任意数量的任意字符。例如：

```ignore
*.log
```

这会忽略所有扩展名为 `.log` 的文件。

- `?`：匹配单个任意字符。例如：

```ignore
file?.txt
```

这会忽略 `file1.txt`、`fileA.txt` 等文件。

- `[abc]`：匹配方括号内的任意一个字符。例如：

```ignore
file[123].txt
```

这会忽略 `file1.txt`、`file2.txt` 和 `file3.txt`。

### 3. 递归匹配

如果没有指定路径，规则会递归应用到整个项目。例如：

```ignore
*.tmp
```

这会忽略项目中所有扩展名为 `.tmp` 的文件，无论它们在哪个目录下。

### 4. 否定规则

在规则前加 `!` 可以取消之前的忽略规则。例如：

```ignore
*.log
!important.log
```

这会忽略所有 `.log` 文件，但 `important.log` 文件除外。

### 5. 注释

以 `#` 开头的行是注释，会被 Git 忽略。例如：

```ignore
# 忽略临时文件
*.tmp
```

### 6. 路径匹配

可以使用相对路径指定要忽略的文件或目录。例如：

```ignore
src/test/results/
```

这会忽略 `src/test/results` 目录及其所有内容。 


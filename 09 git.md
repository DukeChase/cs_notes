`git init `
工作区  暂存区   版本库
`git add `
`git ls-files`  查看暂存区中的文件


`git rm  filename`    把文件从工作区和暂存区同时删除
`git rm --cached filename`  把文件从暂存区删除，但保留在当前工作区中
`git rm -r *`  递归删除某个目录下的所有子目录和文件
删除后不要忘记提交

`git commit`

`git reset    `

| 选项 | 作用|
|------|------|
|--soft| 保留工作区和暂存区      |
|--hard| 删除工作区和暂存区    |
|--mixed| 保留工作区，删除暂存区 |

git diff  一般用图形化工具

[git diff 命令](https://blog.csdn.net/liuxiao723846/article/details/109689069)

`git push`

`git pull`

`git status`

`git log`

`git  rebase`

## git checkout
git checkout -b 

git switch

git merge

git branch

`git clone -b barnch-name`  克隆指定分支

git remote -v   查看git远程仓库地址
git remote set-url origin 新地址    替换成新地址

## tag 打标签

https://www.liaoxuefeng.com/wiki/896043488029600/902335479936480
https://blog.csdn.net/weixin_39642619/article/details/111223447
https://blog.csdn.net/lovedingd/article/details/127568704
https://blog.csdn.net/weixin_43715214/article/details/131059079

git fetch --all --tags
https://devconnected.com/how-to-checkout-git-tags/
## 配置
免密拉取 gitee   `git config --global credential.helper store `
关闭ca认证  `sudo git config --system http.sslverify false`

`git config --global http.sslverify false  `

git config --local --list

git config --local user.name dukechase
git config --local user.email  hsb2435@163.com


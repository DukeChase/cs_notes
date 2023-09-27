git init 
工作区  暂存区   版本库
git add 
git ls-files  查看暂存区中的文件


git rm  filename    把文件从工作区和暂存区同时删除
git rm --cached filename  把文件从暂存区删除，但保留在当前工作区中
git rm -r *  递归删除某个目录下的所有子目录和文件
删除后不要忘记提交

git commit

git reset    

| 选项 | 作用|
|------|------|
|--soft| 保留工作区和暂存区      |
|--hard| 删除工作区和暂存区    |
|--mixed| 保留工作区，删除暂存区 |

git diff  一般用图形化工具

git push

git pull

git status

git log

git  rebase

git checkout

git switch

git merge

git branch

git clone -b barnch-name  指定分支
## 配置
免密拉取 gitee   `git config --global credential.helper store `
关闭ca认证  `sudo git config --system http.sslverify false`


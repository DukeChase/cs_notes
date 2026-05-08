---
title: "git拉取指定tag的代码_Git应用详解第八讲：Git标签、别名与Git gc-CSDN博客"
source: "https://blog.csdn.net/weixin_39642619/article/details/111223447"
author:
  - "[[成就一亿技术人!]]"
  - "[[hope_wisdom 发出的红包]]"
published:
created: 2026-04-24
description: "文章浏览阅读1w次，点赞5次，收藏13次。本文详细介绍了Git的标签功能，包括轻量级标签和带有附注的标签的创建、查看、查找、推送、删除以及切换。此外，还讲解了如何设置命令别名以简化常用操作，以及Git的垃圾回收机制——Git gc，用于清理和优化本地存储库。"
tags:
  - "clippings"
---
## 第八讲：Git标签、别名与Git gc

### 前言

这一节主要介绍 `Git` 标签、别名与 `Git` 的垃圾回收机制。

### 一、Git标签(tag)

#### 1.标签的实质

标签与分支十分相似，都是指向某一次提交；并且，它们的值都为各自指向提交的 `SHA1` 值；但是，不同于会随着提交的变化而变化的分支，一旦给某次提交添加了标签，该标签就永远不会发生变化。

**「注意」** ：标签标识的是某一次提交，这次提交可以是任何分支上的任何一次提交。

##### 两类标签

`Git` 标签有两种：

- **「轻量级标签」** (`lightweight`)：不可添加注释；
- **「带有附注的标签」** (`annotated`)：可以添加注释；

> ❝
> 
> Annotated tags are meant for release while lightweight tags are meant for private or temporary object labels.
> 
> ❞

以上是 `git` 官方文档对两种标签的说明，大意是：带注释的标签用于发布，而轻量级标签则用于私人或临时对象。

**「什么时候打标签呢？」**

- **「版本发布」** ：一般 `master` 分支都会作为项目的发布分支，当项目开发到了一个成熟的阶段，准备在 `master` 分支进行发布时。一般都会在 `master` 分支的当前提交上打上一个类似" `v1.2` "的标签；
	比如 `Vue` 框架：
	![9844f8b6c2330216fcc307423c1a993e.png](https://i-blog.csdnimg.cn/blog_migrate/4cddcb9d280f63d34e6096e159454db4.png)
	image-20200418125541646
	可以看到有许多标签，并且可以在 `releases` 选项中查看标签和发布版本：
	![c3ac64e86449fd4de362a5c54e323e1b.png](https://i-blog.csdnimg.cn/blog_migrate/ab5cfdfd5f96deb6e3694802ce712638.png)
	image-20200418125721571
- **「版本管理」** ：可以通过标签的形式记录项目某一阶段的状态，方便管理；
	比如管理学习微信小程序时每个知识点的代码：
	![5df75f8ebb950f8468d2cac0b712eedc.png](https://i-blog.csdnimg.cn/blog_migrate/53d65d14a80d18ee34a0b3a3a36201f5.png)
	image-20200418165957032

##### 「查看标签文件」

如下图所示，分别给 `master` 分支的提交 `mas2` 添加一个轻量级标签 `v1.0` 和一个带有附注的标签 `v2.0` ：

![424ced1822af56815209d769c643f4d7.png](https://i-blog.csdnimg.cn/blog_migrate/52426f1d7a831121ca1e2fe19c440b6e.png)

image-20200418122516160

> ❝
> 
> `git dog` 为 `git log --all --decorate --oneline --graph` 的别名，后面会讲解；
> 
> ❞

随后，查看存储标签文件的`.git/refs/tags` 目录：

![8889c747ae2d7ea5e4701b1a18a8d7ae.png](https://i-blog.csdnimg.cn/blog_migrate/1ce525550eb9ca1285437d0af6de52eb.png)

image-20200418123105227

可以看到：

- `tags` 目录下存储着添加的标签文件 `v1.0` 和 `v2.0` ；
- 分别打开标签文件 `v1.0` 和 `v2.0` ，它们的值都是一个 `SHA1` 值，并且与添加标签时所在提交 `mas2` 的 `SHA1` 值 `6920a6e...`相等。
- `emm...`等等！并不相等呀，只有 `v1.0` 的值与提交 `mas2` 的 `SHA1` 值相等，而与 `v2.0` 的值并不相等！
- 为什么给同一次提交 `mas2` 添加的标签，它们的 `SHA1` 值会不相等呢？这是因为 `v1.0` 是轻量级标签，而 `v2.0` 是带有附注的标签。

虽然两个标签标记的都是同一次提交，但是它们的构造不一样：

- 轻量级标签 `v1.0` 直接将这次提交的 `SHA1` 值作为自己的 `SHA1` 值；
- 而带附注的标签 `v2.0` 会创建一个 `tag` 对象，它的 `SHA1` 值是 `tag` 对象的 `SHA1` 值；

这就是轻量级标签与带有附注标签的区别。不过这两个标签仍然会指向同一次提交，如下图所示：

![b544920358aa7ebefe26bb61eeea61dd.png](https://i-blog.csdnimg.cn/blog_migrate/50da035da7f806693a55d173f5897e84.png)

image-20200418124847587

#### 2.创建标签

##### git tag

创建一个轻量级标签：

![3f5bb39c0bf82ab54e2a5c462026175b.png](https://i-blog.csdnimg.cn/blog_migrate/e6fdb3932f23229f996556dd6ea05979.png)

image-20200311143441005

##### git tag -a -m '注释'

创建一个带有附注的标签：

![da23acd00e688501b97c020aff7be7f0.png](https://i-blog.csdnimg.cn/blog_migrate/0d3ba9f16fc642a7695b66cd8013e900.png)

image-20200311143555121

#### 3.查看标签

##### git tag

显示添加的所有标签：

![722d9f56e9d73cb660d8cde87c9e65a2.png](https://i-blog.csdnimg.cn/blog_migrate/df0054b9e1393531d28286ad12cf7ffe.png)

image-20200418140044357

也可以添加 `--list` 参数：

![1aa6e5230669e561ea7224ea80f1a51e.png](https://i-blog.csdnimg.cn/blog_migrate/690699c863a42f415b6e2ca197565795.png)

image-20200418140101235

如下图所示：切换了分支 `tag` 仍然存在，说明 `tag` 与分支并没有关系，它标识的是某次特定的提交：

![0fb0cbe3ef7f2725fa93870389ea2e71.png](https://i-blog.csdnimg.cn/blog_migrate/9ff42f9b47b1ed0598fa631852b87f57.png)

image-20200418140210619

##### git show

如图所示，在 `master` 分支上进行两次提交，每次为文件 `test.txt` 添加一行内容并且打上标签。其中 `v1.0` 为轻量级标签， `v2.0` 为带有附注的标签：

![1fd883d97578655e468964b0b1a1ea28.png](https://i-blog.csdnimg.cn/blog_migrate/bea972fad81eb723b8c88b7c2266c254.png)

image-20200418164206660

随后，使用 `git show` 查看标签的内容：

- **「轻量级标签」** ：
	![02182e044837892d49a348f1f385cb19.png](https://i-blog.csdnimg.cn/blog_migrate/3584ff7432f93f892afa7c24b029dbc8.png)
	image-20200418164502188
	如图所示，该指令会显示标签 `v1.0` 所指向的提交；并且，会输出标签指向提交与上一次提交的比较结果；由于标签 `v1.0` 指向的提交为 `master` 分支的第一次提交，所以上一次提交为 `null` 。因此比较结果显示：相比于上一次提交，标签指向的提交 `1st` 在文件 `test.txt` 中新增了一行 `1st` ；
- **「带注释的标签」** ：
	![c4cd017265c435486acd8a0ac363ba62.png](https://i-blog.csdnimg.cn/blog_migrate/bca21c24a5513fe973d07a8dbb0bbbf2.png)
	image-20200418165301312
	相比于轻量级标签，带附注的标签是一个对象，可以存储附注和打标签的人和时间等信息，所以显示的信息多一些；从图中的比较结果可知，相比于上一次提交 `1st` ，标签 `v2.0` 指向的提交 `2nd` 为文件 `test.txt` 新增了一行 `2nd` ；

#### 4.查找标签

##### git tag -l

该方式支持正则表达式查找；

![683c1d578599b2030460ded365169780.png](https://i-blog.csdnimg.cn/blog_migrate/d558142b028c567fd97afdd722c5fc9b.png)

image-20200418140732354

如上图所示：

- `v*` 表示搜索所有以 `v` 开头的标签；
- `?2*` 表示搜索任意开头，但包含 `2` 的标签；

#### 5.将标签推送到远程

要将标签推送到远程仓库，首先要建立本地仓库与远程仓库的联系，比如可以采用：

```perl
git push -u origin master
```

建立本地 `master` 分支与远程 `master` 分支的联系，并进行一次推送：

![fd8f139cd9f24b19c7fac6708b1bb115.png](https://i-blog.csdnimg.cn/blog_migrate/eb656d3f0f6566a3c269449b26e3794b.png)

image-20200418143423585

##### git push origin

这种方法可以推送指定的本地标签到远程仓库，例如将本地 `master` 分支上的标签 `v1.0` 推送到远程仓库：

![7858cd036c0cfb9e8c21df6970f8af11.png](https://i-blog.csdnimg.cn/blog_migrate/641595b37f0fad913abe5deb7fc96155.png)

image-20200418143541273

执行上述指令后，对应的远程仓库 `gitTest` 中就会出现相应的 `tag` 信息了：

![4914cc6ae45bf62182bdc2c60b0412c2.png](https://i-blog.csdnimg.cn/blog_migrate/af705a64b91f8e1b4baaae168d35094b.png)

image-20200418143927912

也可以在 `releases` 选项中，查看 `tag` 和 `Releases` 信息：

![b88b30e63cd3c8f3bfcbe7b9bd1decd8.png](https://i-blog.csdnimg.cn/blog_migrate/e88e52292901a8e784fdddfba2b2bc88.png)

image-20200418144230515

![ef59fd9017e532309376525176bf83c1.png](https://i-blog.csdnimg.cn/blog_migrate/853aeaa01dddc7aa35a3028d9985c2b2.png)

image-20200418144207107

**「也可以同时推送多个本地标签到远程仓库」** ：

```cobol
git push origin  v2.0 v3.0
```
![3a77e57bcfeee81ae28a15023c1ef3ae.png](https://i-blog.csdnimg.cn/blog_migrate/cea47558034b036340a67a03301c087d.png)

image-20200418144612359

以上的命令都是简写形式， **「完整写法为」** ：

```cobol
git push origin refs/tags/v4.0:refs/tags/v4.0
```
![d4b7d18026ca533620f34d378375ddca.png](https://i-blog.csdnimg.cn/blog_migrate/af6dc8b92228a5df14d298bd7163f332.png)

image-20200418144755135

###### git push origin --tag

该方法可以一次性推送所有的本地标签到远程仓库：

![d29167aceff52286663a97278c9ffd38.png](https://i-blog.csdnimg.cn/blog_migrate/7279ac68f7d373e7768357b2b329acab.png)

image-20200418144952994

也可以采用简写命令：

```cobol
//下面的tag可以写成tags，效果一样git push --tag
```
![caf66275b738c701a5f251465e24fb54.png](https://i-blog.csdnimg.cn/blog_migrate/b69a34a62e435e40752679c09de22e94.png)

image-20200418145049074

#### 6.删除远程标签

当然，我们可以直接在远程仓库上删除远程标签。但是，最好的方式还是采用命令行进行删除。删除远程标签的方法与删除远程分支的方法非常类似，同样有两种方法：

##### git push origin:

这种方法相当于推送一个空的标签到远程仓库，由此达到删除的效果。比如删除远程仓库中的标签 `v3.0` ：

```perl
git push origin :v3.0
```
![e76e5c994cda755b6485006d87cd9149.png](https://i-blog.csdnimg.cn/blog_migrate/ce6f6e7eda76c3ace54099be5f41da41.png)

image-20200418154504982

这样远程仓库中的标签 `V3.0` 就被删除了：

![6cfe222758cfeedd49e1868ab037f06e.png](https://i-blog.csdnimg.cn/blog_migrate/9fa5fb20388aa43ad9c449c49b61df0c.png)

image-20200418154554319

但是本地仓库中对应的标签 `V3.0` 并没有被删除：

![660706cdce8a463b9ed186c76dd04746.png](https://i-blog.csdnimg.cn/blog_migrate/4f4aee3c2ab0d9197bb6245b68d78ee0.png)

image-20200418154631370

上述指令为简写， **「完整写法如下」** ：

```ruby
git push origin :refs/tags/v3.0
```
![cae178395bacc353e7d275f52943f345.png](https://i-blog.csdnimg.cn/blog_migrate/2885b991ad27d6ae267c8859f48f8abb.png)

image-20200418154906969

##### git push origin --delete

该方法采用了更加语义化的参数 `--delete` ，实现远程标签的删除：

```perl
git push origin --delete v2.0
```
![aa573b21f71e3ed08b48f5ecb7aa30d9.png](https://i-blog.csdnimg.cn/blog_migrate/71bbf2333a4b2f8f32a0ac8911384195.png)

image-20200418155134748

同样成功地删除了远程仓库中的标签 `v2.0` ：

![31b904a6726c94cd39a162fb74a364ac.png](https://i-blog.csdnimg.cn/blog_migrate/43ce6a221a2e8809e3590ff573d8b1f8.png)

image-20200418155216230

但是，本地的标签 `v2.0` 也没有被删除：

![c4b84be33a0bf99701be7fa1ffd74b08.png](https://i-blog.csdnimg.cn/blog_migrate/1d69c84f3071ec5f1a8f62c7fc65826b.png)

image-20200418155311429

采用下列的完整写法，效果是一样的：

```perl
git push origin --delete tag v2.0
```
![fe39c890683fd4f6ae347e7e6baf1029.png](https://i-blog.csdnimg.cn/blog_migrate/5dec5c721ad9d8d3043497fad48f4f86.png)

image-20200418155513090

> ❝
> 
> 不难发现，删除 **「远程分支」** 和 **「远程标签」** 的方法是 **「一样」** 的。
> 
> ❞

#### 7.删除本地标签

##### git tag -d

如通过以下命令删除标签 `v3.0` ：

```cobol
git tag -d v3.0
```
![078ed5cd86d0b3f95dc3e1f3223ce131.png](https://i-blog.csdnimg.cn/blog_migrate/fd26372c6109e4544030728b148b4b79.png)

image-20200418155616562

#### 8.切换标签

##### git checkout

如图所示，在 `master` 分支上进行了三次提交，并且添加了相应的标签：

![be3f02422f196b9d315955cc109d6976.png](https://i-blog.csdnimg.cn/blog_migrate/e03e9fbe21b5ed857061d5876c1ece39.png)

image-20200418161353146

当我们通过 `checkout` 命令切换到标签 `v2.0` 时：

![745563d9a67b1e832dd8e8ade6181662.png](https://i-blog.csdnimg.cn/blog_migrate/dec285e011926c3a86eeb7678624d7bc.png)

image-20200418161526176

可见，会出现游离的提交。此时查看各分支状态：

![eaa27c7a2747e5fcea185c12e364c10f.png](https://i-blog.csdnimg.cn/blog_migrate/7dcbaf6f154afe72710158d566c5360a.png)

image-20200418161655468

如上图所示，当前处于标签 `v2.0` 指向的提交，并且切换标签的过程中改变了 `HEAD` 指针的指向。但是，并没有改变分支 `master` 的指向。过程如下图所示：

![bc67c5b21f84ef48f634c7623382e2d8.png](https://i-blog.csdnimg.cn/blog_migrate/5bb904d0e5774bb5a0bbc3d112a795ab.png)

image-20200418162458123

也就是说，切换标签与使用 `reset` 进行版本回退十分相似。只不过切换标签只改变了 `HEAD` 指针的指向，会造成游离的提交。若有需要可以创建一个新分支进行保存。

#### 9.拉取标签

在下图所示的情况中，本地仓库 `mygit` 与远程仓库有公共的提交历史(同源)，并且不发生合并冲突的情况下(具体可参考Git应用详解第六讲：Git协作与Git pull常见问题)：

![4b4c156b4684ab6088e69a4cad99f469.png](https://i-blog.csdnimg.cn/blog_migrate/dea9dbe43d8098856675d501897c9f87.png)

image-20200418160517111

可以直接通过 `git pull` 将远程仓库的标签拉取下来，并创建本地仓库中没有的标签：

![e6480f481a7f3a125a60dfcb484a5ce8.png](https://i-blog.csdnimg.cn/blog_migrate/e7a50ac0091cce1b3f23b96cb51d6dd6.png)

image-20200418160737829

### 二、Git别名

#### 1.设置git命令别名

##### git config alias. ''

别名就是一个替代，使用一个简短的字符串来代替常用的长命令。比如可以通过如下命令，使用别名 `bra` 来替代 `branch` 命令：

```csharp
git config --global alias.bra branch
```
![0d9a92bb2374ba23217366d3988732a2.png](https://i-blog.csdnimg.cn/blog_migrate/3de432df05e2d56a50424cd0acfff8bb.png)

image-20200417184645237

当命令较为简短时，可以省略命令两边的单引号：

![185b9247d91f732a2e2688f9c9a644f3.png](https://i-blog.csdnimg.cn/blog_migrate/e565380c660f230c90a058ea7f2625ca.png)

image-20200417184803691

在上述命令中：

- `--global` 表示设置的别名作用域为系统用户，即该用户对所有的 `git` 仓库都可以使用这个别名；其余还有仓库作用域 `--loacl` ，系统作用域 `--system` ；
- `alias.br` 表示更改别名为 `br` ；
- 再往后的 `branch` 表示需要起别名的命令，可以是带参数的长命令，此时不能省略命令两边的单引号：
	```csharp
	git config --global alias.dog 'log --all --decorate --oneline --graph'
	```
	![3fcd9960745d0c2cafcab5b40e75c144.png](https://i-blog.csdnimg.cn/blog_migrate/583da308b0a11e738ce59ab5e06f67d1.png)
	image-20200413171109680

由于上面配置的别名作用域为系统用户，该配置会写入 `gitconfig` 配置文件。打开该文件可以看到写入的 **「别名配置」** ：

> ❝
> 
> **「补充」** ：使用 `vi ~/.gitconfig` 可以直接打开 `gitconfig` 这个文件(记得加点)，无论当前所处的路径是什么；
> 
> ❞

![0e8df8f6f1ae38a19368643615e7c12c.png](https://i-blog.csdnimg.cn/blog_migrate/0cf91afbb4078664efd230b0390c0bd5.png)

image-20200417185537264

也就是说可以直接通过修改 `gitconfig` 文件的 `alias` 选项来设置别名，但是 **「不建议」** 。

这样，通过别名就可以简化一些常用的命令了，比如 `git status` 、 `git checkout` 等：

![02308a719c77286d040f41114b113619.png](https://i-blog.csdnimg.cn/blog_migrate/06eaeabda851c7647bc91cf0affd9a31.png)

image-20200417185854925

#### 2.设置外部命令别名

像 `gitk` 这样的外部命令，是没有 `git` 前缀的。设置别名的方法与设置 `git` 提供的命令有所不同，要按照如下格式设置：

##### git config alias. ''

- 感叹号表示这是一个外部命令；
- 注意要加上单引号，不用加 `git` 前缀；

比如在系统用户作用域下，将 `git ui` 设置为 `gitk` 的别名：

```csharp
git config --global alias.ui '!gitk'
```

设置完成后，该配置会被写入系统用户的配置文件 `gitconfig` 中：

![6602d1a6682f1b390f69deeccd48ae80.png](https://i-blog.csdnimg.cn/blog_migrate/9b61bbdfb50ea49a6fa67f49c7c5a9a1.png)

image-20200417190632295

随后直接使用 `git ui` 便能打开 `gitk` 界面：

![1eb47a6c964189702dcff091465f4d2c.png](https://i-blog.csdnimg.cn/blog_migrate/22fbf6ae2ce65a61882f551bf6de7a49.png)

image-20200417190558949

**「补充」** ：设置了别名后，原来的命令仍然有效。

### 三、垃圾回收：Git gc

所谓 `gc` 就是垃圾回收机制，实际使用较少；它的作用是 **「清理不必要的文件并优化本地存储库」** 。

为了演示它的作用，设置以下测试环境：

- 首先，在本地仓库 `mygit` 创建 `master` 和 `dev` 两个分支，并将它们推送到远程仓库：
	![3c3cb55f392a39f7004cff22728aee87.png](https://i-blog.csdnimg.cn/blog_migrate/4ee3c6e2c6d1a0ce9c46480df7685a7f.png)
	image-20200418105755292
- 然后，给本地仓库 `mygit` 添加一个轻量级标签 `v1.0` 和一个带有附注的标签 `v2.0` ：
	![aba891787db995aeb0f678dbbf888991.png](https://i-blog.csdnimg.cn/blog_migrate/4fff0d9dfb4c32a65c53b08aafcaaa62.png)
	image-20200418110041381

此时`.git/refs` 目录下的各文件如下所示：

![7805383f2d9ca32735bb5d5dedb2922c.png](https://i-blog.csdnimg.cn/blog_migrate/ad723d44f1228b9e7e01d61e0e9832f9.png)

image-20200418110228125

`heads` 目录存储的是本地分支信息， `remote` 目录存储的是远程分支信息， `tags` 目录存储的是标签信息，符合预期。

随后，执行 `git gc` 命令：

![843db8ea26cc8bac03c644341c7e63c7.png](https://i-blog.csdnimg.cn/blog_migrate/292d37bee540c71fee21dbf267aa9332.png)

image-20200418110332080

再次查看`.git/refs` 目录：

![d8d5917d071b568365907c346f15c0ce.png](https://i-blog.csdnimg.cn/blog_migrate/c6ca6e9a94e545e55c9fd9606965d811.png)

image-20200418110544449

可以看到 `refs` 目录及其子目录下的文件消失了，但是`.git` 目录下多了一个 `packed-refs` 文件。事实上， `refs` 目录下的文件不是消失了，而是被打包到了 `packed-refs` 文件中。打开 `packed-refs` 文件：

![84c2bdd94d65bbdd74089fa58fa67dee.png](https://i-blog.csdnimg.cn/blog_migrate/4ae36f1f4d7ac8a8ab0c05a62da8d2ed.png)

image-20200418111206150

可以看到执行 `git gc` 后 `refs` 目录及其子目录下的文件都被 **「压缩打包」** 到 `packed-refs` 文件中了。从图中可以看到轻量级标签 `v1.0` 只占一行，而带附注的标签 `v2.0` 占两行：

- 其中第 `6` 行和第 `8` 行的 `SHA1` 值是相同的，这是因为两个标签都是给同一次提交上添加的；
- 而带附注的标签 `v2.0` 中的另外一行信息(第 `7` 行)表示的则是 `tag` 对象的 `SHA1` 值；

打包完之后，再次 **「修改文件」** ，或者 **「添加分支」** ，新增的内容还是会在`.git/refs` 目录下显示，而不会被打包到 `packed-refs` 文件中，需要重新执行 `git gc` 才会被打包。
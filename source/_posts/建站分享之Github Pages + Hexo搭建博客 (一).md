---
title: 建站分享之Github Pages + Hexo搭建博客 (一)
date: 2017-04-16 17:12:12
categories: 建站分享
---

### 前言

在经受CSDN辣眼睛的排版后，就一直在想要是能有一个自己的博客就好了。

大多数人会经历以下三个阶段 :

（1）第一阶段，刚接触Blog，觉得很新鲜，试着选择一个免费空间来写。

（2）第二阶段，发现免费的空间太多限制，不能让我们肆意的发挥，于是选择购买域名和空间建站

（3）第三阶段，觉得独立博客管理起来又太麻烦，最好在保留控制权的前提下，让别人管，自己只写。

我最开始也是在CSDN上写自己的文章，现在整体搬迁到Github 上来，中途遇到很多难题，不断Google，不断学习，我想我大概就是这么一个爱折腾的人吧。

<!--more-->

### 正文
首先介绍一下Github Pages ：它提供了300M的免费空间，并且稳定可靠。

在这样一个前提下，我们自然而且就能够放心的将blog搭建在上面。

作为一个程序员，应该学会使用Git来管理项目，同时应当学会在github上寻找我们需要的资源fork -->forking

<font color="red">**Github是趋势，做it的人应今早融入这个大环境**</font>

#### Github注册与配置说明

##### 新建一个仓库
![enter image description here](http://ooes75dyq.bkt.clouddn.com/creatblog/1.jpg)

yourusername.github.io 以后就是你的域名了。

建好后进入你的仓库，点击settings
![enter image description here](http://ooes75dyq.bkt.clouddn.com/creatblog/2.jpg)

找到Github Pages栏目，点击选择一个主题
![enter image description here](http://ooes75dyq.bkt.clouddn.com/creatblog/3.jpg)

选择主题
![enter image description here](http://ooes75dyq.bkt.clouddn.com/creatblog/4.jpg)

主题生效后，我们的github pages也就设置完毕了，然后你现在在地址栏访问yourusername.github.io就可以测试刚才建好的站点。

#### 下载Git 、Nodes.js

##### Git

选择你自己的操作系统版本下载 [Git下载地址](https://git-scm.com/download/win) 

安装并配置环境变量（你的Git安装目录）

可以用下面的命令测试Git是否安装成功：

`git --version` 

添加SSH-key到刚才创建的仓库中，这样才能够提交代码到仓库。

（1）先检查是否安装有SSH KEY

打开git bash，输入cd ~/.ssh 或cd .ssh

如果没有则提示： No such file or directory

如果有则进入~/.ssh路径下（ls查看当前路径文件，rm * 删除所有文件）

（2）配置SSH KEY

```json
$ cd ~  #保证当前路径在”~”下
$ ssh-keygen -t rsa -C "这里填写你的邮箱地址"
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/xxxx_000/.ssh/id_rsa):   #不填直接回车
Enter passphrase (empty for no passphrase):   #输入密码（可以为空）
Enter same passphrase again:   #再次确认密码（可以为空）
Your identification has been saved in /c/Users/xxxx_000/.ssh/id_rsa.   #生成的密钥
Your public key has been saved in /c/Users/xxxx_000/.ssh/id_rsa.pub.  #生成的公钥
The key fingerprint is:
e3:51:33:xx:xx:xx:xx:xxx:61:28:83:e2:81 xxxxxx@yy.com

```
到这里SSH KEY 已经生成完毕，其存放路径为：c:/Users/你电脑的用户名/.ssh/下。

（3）在Github 配置SSH-KEY

登录GitHub系统；点击右上角账号头像的“▼”→Settings→SSH kyes→Add SSH key，Title自定义，复制id_rsa.pub的公钥内容到GitHub中Add an SSH key的key输入框，最后“Add Key”。

（4）配置本地账户
```java
$ git config --global user.name “your_username”  #设置用户名
$ git config --global user.email “your_registered_github_Email” 
#设置邮箱地址(建议用注册giuhub的邮箱)
```

##### Node.js

根据电脑操作系统版本下载： [Node.js下载地址](https://nodejs.org/en/download/)

测试是否安装成功

`node -v` 如果提示没有找到此命令就去配置node.js的环境变量

##### Hexo

hexo是基于node.js的静态博客，官网也是放在Github上面的。ps:不用单独下载hexo

##### 安装hexo
选择一个文件夹，用来存放你的博客所有文件。在此文件夹下右键打开Git Bash输入以下命令进行安装

`$ npm install -g hexo-cli`

初始化hexo

`$ hexo init hexo`

这里会将Github上的hexo项目clone下来，得到hexo文件夹。

初始化成功后会在最后打印一行：INFO Start blogging with Hexo!

##### 配置hexo
（1）进入到hexo文件 （2）安装依赖文件 （3）部署形成文件 
```java
$ cd hexo
$ npm install
$ hexo generate
```
（4）本地测试

`$ hexo server`
在浏览器输入：http://localhost:4000/ 即可访问到我们搭建好的hexo站点。
![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/11/30-7.png)

#### <font color="red">重点</font>
##### 将本地hexo项目托管到Github

修改全局配置文件_config.yml

说明： hexo文件夹下一个_config.yml，我们称之为全局配置文件，在每个主题文件夹内还会有一个_config.yml文件，我们称之为主题配置文件。

用Editplus或者notepad++编辑器打开hexo文件夹下的_config.yml文件。

注意：配置文件中每个字段后面的冒号是英文格式的，且在其后要加一个空格再写值

一定记住这是规范！！！  <font color="red">key:空格value</font>

编辑最后面的deploy属性，加入代码：
```java
deploy:
  type: git   
  repository: https://github.com/你的Github用户名/你的Github用户名.github.io.git
  branch: master
```
<font color="red">注意一定要按照这个格式，deploy下面三个属性前面有2个空格<font>

##### 安装hexo-deployer-git插件

安装这个插件可以快速帮助我们把代码托管到github

` $ npm install hexo-deployer-git --save`

部署到Github上的方法：

```java
$ hexo clean  #清除缓存 网页正常情况下可以忽略此条命令
$ hexo generator  #生成静态页面至public目录
$ hexo deploy  #将.deploy目录部署到GitHub
```
部署成功后会显示
INFO  Deploy done: git

到这里恭喜你，你的hexo项目基本上就搭建成功了。通过yourusername.github.io就可以访问hexo项目了。

下篇文章讲解hexo主题的配置。
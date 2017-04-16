---
title: 建站分享之Github Pages + Hexo搭建博客 (二)
date: 2017-04-16 18:20:12
categories: 建站分享
---

此篇文章主要分享Hexo的全局配置，以及Hexo主题的配置。

Hexo中有两份主要的配置文件，其名称都是_config.yml。其中，一份位于站点根目录下，主要包含Hexo本身的配置,我们称之为全局配置文件；另一份位于主题目录下，这份配置由主题作者提供，主要用于配置主题相关的选项,我们称之为主题配置文件。

hexo的官方网站：https://hexo.io/

<!--more-->

#### hexo的全局配置
编辑hexo目录下的_config.yml文件，具体配置如下：
```java
# Hexo Configuration
## Docs: https://hexo.io/docs/configuration.html
## Source: https://github.com/hexojs/hexo/
# Site 站点信息配置，根据自己的需要进行修改
title: 周建川的随想录    #站点名，会在浏览器页面标签左上角显示
subtitle: 因为懂得，所以慈悲。fe  #副标题
description: Humble to the dust and then out of the flowerse  #对站点的描述，给搜索引擎看的，可以自定义
author: Jant  #网站作者
language: default  #网站语言 default是英文 zh-Hans是中文
timezone: Asia/Shanghai  #时区
avatar: /images/logo.jpg  #网站logo，会在浏览器页面标签左上角显示
# URL 博客地址,与申请的GitHub一致
## If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'
url: https://fzy-line.github.io/
root: /
#博客链接格式
permalink: :year/:month/:day/:title/ 
permalink_defaults:
# Directory  #目录设置，一般不修改
source_dir: source  #资源文件夹，放在里面的文件会上传到github中
public_dir: public  #公共文件夹，存放生成的静态文件
tag_dir: tags  #标签文件夹，默认是tags。实际存放在source/tags中。
archive_dir: archives  #档案文件夹，默认是archives。
category_dir: categories  #分类文件夹，默认是categories。实际存放在source/categories中。
code_dir: downloads/code  #代码文件夹，默认是downloads/code
i18n_dir: :lang  #国际化文件夹，默认跟language相同
skip_render:  #跳过指定文件的渲染，您可使用 glob 来配置路径。
# Writing  这是文章布局、写作格式的定义，一般不修改
new_post_name: :title.md # File name of new posts
default_layout: post
titlecase: false # Transform title into titlecase
external_link: true # Open external links in new tab
filename_case: 0
render_drafts: false
post_asset_folder: false
relative_link: false
future: true
highlight:
  enable: true
  line_number: true
  auto_detect: false
  tab_replace:
# Category & Tag  #分类和标签，一般不修改
default_category: uncategorized
category_map:
tag_map:
# Date / Time format  #日期、时间格式，一般不修改
## Hexo uses Moment.js to parse and display date
## You can customize the date format as defined in
## http://momentjs.com/docs/#/displaying/format/
date_format: YYYY-MM-DD 
time_format: HH:mm:ss
# Pagination  #可根据自己需要修改
## Set per_page to 0 to disable pagination
per_page: 6  #分页，每页文章数量
pagination_dir: page
# Extensions  #扩展
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
theme: next  #博客主题
  
# Deployment 这里配置站点部署到Github，上一节中已经讲过
## Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  repository: git@github.com:你的Github用户名.github.io.git
  branch: master
```
#### 再次声明

<font color="red">所有配置都是字段后面的冒号是英文的，而且要在后面加一个空格再写入值</font>

#### Hexo主题选择

Hexo 安装主题的方式非常简单，只需要将主题文件拷贝至站点目录的 themes 目录下， 然后修改下配置文件即可。

hexo官方主题下载地址：https://hexo.io/themes/，里面有多种多样的主题模板供大家选择。

这里我选择的是Next主题，next主题的官网，有很详细的配置文档：http://theme-next.iissnan.com/

后续的讲解也都以Next主题为准。

next下载地址：https://github.com/iissnan/hexo-theme-next

![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/2-1.png)

到Gtihub下载此主题后解压，打开可以看到里面很多主题相关的文件，我们将此文件夹改名为next，然后将它复制到站点目录的/themes/目录下。

我们的themes文件夹里可以放很多主题的文件夹，但是实际上我们的网站采用哪一个主题，这是需要我们进行配置的，打开编辑全局配置文件，找到下面的内容：

```java
# Extensions  #扩展
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
theme: next  #博客主题，默认是landscape
```
在theme字段这里填上你下载的主题的文件夹的名字，例如我们使用next主题就填上next。这样配置文件就和我们的主题文件关联起来了。

（1）配置基本信息

```java
# 网站图标，将其放在hexo站点/source/目录下
favicon: /logo.jpg
# 关键词，例如下面是我写的
keywords: "Python,Life,Android"
# 网站建立时间，显示在页面底部
since: 2016
# 网站版权声明，显示在页面底部
copyright: true
```

（2）选择外观样式
目前 NexT 支持三种 Scheme，他们是：

Muse - 默认 Scheme，这是 NexT 最初的版本，黑白主调，大量留白

Mist - Muse 的紧凑版本，整洁有序的单栏外观

Pisces - 双栏 Scheme，小家碧玉似的清新

![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/2-2.png)

我是用的Mist

找到主题配置文件的如下三行，其中#号表示注释，要启用哪一种样式就把#号去掉即可。

```java
# Schemes
#scheme: Muse
scheme: Mist
#scheme: Pisces
```
（3）设置菜单
菜单内容的设置格式是：item name: link。其中 item name 是一个名称，这个名称并不直接显示在页面上，它将用于匹配图标以及翻译。
menu:
  home: /
  archives: /archives
  categories: /categories
  tags: /tags
  about: /about
  #sitemap: /sitemap.xml
  #commonweal: /404.html

`直接显示在页面上对应导航栏的是在主题-languages-defalut.yml里面的menu`

```java
menu_icons:
  enable: true
  #KeyMapsToMenuItemKey: NameOfTheIconFromFontAwesome
  home: home
  about: user
  categories: th
  schedule: calendar
  tags: tags
  archives: archive
  sitemap: sitemap
  commonweal: heartbeat
```
menu_icons其中 前面的字段 与上一步所配置的菜单名字对应，后面的值 是 Font Awesome 图标的 名字。而 enable 可用于控制是否显示图标，你可以设置成 false 来去掉图标。

#### 本地测试
```java
$ hexo clean #用于清除缓存
$ hexo generate #生成静态网页
$ hexo server #开启本地预览
```
访问：http://localhost:4000/ 查看效果，如下图：
![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/2-3.png)

##### 这里遇到的几个问题集中一下

到这里会发现点击左侧菜单的分类、标签和关于会提示找不到页面。

这是因为我们只是创建了菜单，还没有创建相应的页面。 

新建页面的hexo命令是：
`$ hexo new page "pageName"`
这里我们给打不开的页面都生成一下
```java
$ hexo new page 'categories'
$ hexo new page 'tags'
$ hexo new page 'about'
```
分别执行完这三条命令后，我们会发现站点目录下的/source/目录下多了三个文件夹：categories，tags，about，每个文件夹里面都会生成一个index.md文件，如下：

默认都只会生成title和date字段，我们要为其添加上type字段，并赋值。

**注意：博客文章的抬头信息中每个字段后面的冒号是英文格式的，而且其后要加一个空格再写值**

categories下的index.md：
```java
---
title: categories
date: 2016-12-02 23:28:27
type: categories
---
```
tags下的index.md：
```java
---
title: tags
date: 2016-12-02 23:31:23
type: tags
---
```
about下的index.md：
```java
---
title: about
date: 2016-12-02 23:31:23
type: about
---
```
这样我们的这几个页面也就没有问题了。至此，基本的配置也就完成了，接下来介绍如何写博客与发布博客。

#### 如何写文章
实例：

新建博客《我的第一篇博客》

`1
$ hexo new "我的第一篇博客"`

到站点目录下的/source/_posts/目录下可以看到生成了名为：我的第一篇博客.md的文件，这是Markdown格式的文件，可以用sublime text3或者notepad++等编辑器打开，也可以下载一个MarkdownPad来编辑Markdown文件。

如果你没有使用过Markdown编辑器，那请你自己去学习一下Markdown语法。

Markdown 语法说明(简体中文版)：http://www.appinn.com/markdown/

Hexo默认新建的文章抬头已有title、date、tags等属性，可能缺乏categories和meta标签，想要指定目录就需要添加categories属性，而meta标签则是为了便于搜索引擎的收录。如下：
```java
---
title: 我的第一篇博客
date: 2017-04-15 00:25:25
tags: [first]
---
```
tags字段是文章的标签，可以指定标签也可以不指定，如果要指定多个标签需要这样做：
`tags: [java,c++]`
我们可以添加上categories字段，对博客进行分类管理，然后点击主页左侧菜单的分类就可看到具体的分类。例如：
`categories: life`

#### 首页文章的阅读全文按钮是怎么实现的

很简单，只需要在文章内容你指定位置插入<!--more-->

那么首页文章只会展示more上面的内容。

#### 有的人很好奇我们本地是.md结尾的文件，发布到github上却不是这个格式

我们博客文章的编写都是Markdown文件，但是发布到github上的其实是html文件，将Markdown转换成html这个工作我们只要输入hexo generate命令即可，hexo会帮我们完成转换。

#### 再讲下每次写完文章的发布流程
```java
$ hexo clean  #清除缓存 网页正常情况下可以忽略此条命令
$ hexo generate  #生成静态页面至public目录
//写好之后可以现在本地预览，确定无误之后再部署到Github上。 localhost:4000
$ hexo server  #开启预览访问端口（默认端口4000，'ctrl + c'关闭server）
$ hexo deploy  #将.deploy目录部署到GitHub
```

hexo generate 可以简写 hexo g
hexo server 可以简写 hexo s

恭喜你到这里,你的个人博客就全部搭建成功了。

如何引入评论功能，域名更换与解析，文章与网站计数功能等等第三方功能。

将在下次分享。

                        Thanks！
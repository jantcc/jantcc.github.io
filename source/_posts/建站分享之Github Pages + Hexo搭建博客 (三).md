---
title: 建站分享之Github Pages + Hexo搭建博客 (三)
date: 2017-04-16 18:55:12
categories: 建站分享
---

这篇文章主要讲一些第三方功能的配置。

主要集中了博客图片的存放，不蒜子统计，站内搜索，打赏功能

<!--more-->

#### 博客图片存放

Markdown编辑器支持插入图片，可以直接给出图片的链接，因此我们可以将图片存放在我们hexo项目的目录下，再填写对应的路径，也可以将其存放在云服务器上，然后给出链接。

在这里，我们介绍使用七牛云来进行图片托管。七牛云是国内领先的企业级云服务商,致力于打造以数据为核心的场景化PaaS服务，图片加载速度还不错，一般也不会出现图片挂掉的情况。

官网地址：http://www.qiniu.com/

存储图片

（1）点击左侧菜单的对象存储
![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/5-1.png)
（2）点击上端的添加来创建存储空间
![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/5-2.png)
（3）填写好基本信息，点击确定创建
![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/5-3.png)
（4）来到新创建的存储空间，点击内容管理
![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/5-4.png)
（5）在内容管理中可以看到文件列表，点击上传文件
![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/5-5.png)
（6）可以设置上传的文件的前缀，以便进行分类管理
![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/5-6.png)
（7）点击关闭，回到内容管理页面查看上传的文件，复制图片链接
![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/5-7.png)
至此，我们就将我们博客需要的图片存储到了七牛云，然后我们只要将复制的图片链接插入到博客人文章中即可显示图片，感觉显示速度还是蛮快的。

#### 不蒜子统计
编辑全局配置文件中的busuanzi_count的配置项。

当enable: true时，代表开启全局开关。若site_uv、site_pv、page_pv的值均为false时，不蒜子仅作记录而不会在页面上显示。

```java
busuanzi_count:
  # count values only if the other configs are false
  enable: true
  # custom uv span for the whole site
  site_uv: true
  site_uv_header: <i class="fa fa-user"></i>    #如果使用默认的，会显示图标
  site_uv_footer:
  # custom pv span for the whole site
  site_pv: true
  site_pv_header: <i class="fa fa-eye"></i>     #如果使用默认的，会显示图标
  site_pv_footer:
  # custom pv span for one page only
  page_pv: true
  page_pv_header: <i class="fa fa-file-o"></i>  #如果使用默认的，会显示图标
  page_pv_footer:
```
![enter image description here](http://ohe7ixo05.bkt.clouddn.com/2016/12/5-11.png)

#### 站内搜索

配置过了几种搜索还是发现Local Search最好用
（1）安装 hexo-generator-searchdb，在站点目录下执行以下命令：
>$ npm install hexo-generator-searchdb --save --

（2）编辑全局配置文件，新增以下内容到任意位置：
>search:
  path: search.xml
  field: post
  format: html
  limit: 10000

（3）主题配置文件中找到下面字段，开启功能
```java
# Local search
local_search:
  enable: true
```
效果如下：
![enter image description here](http://ooes75dyq.bkt.clouddn.com/creatblog/5.jpg)

#### 开启打赏功能

next主题开启打赏功能很简单，我们只需要在全局配置文件中填入微信和支付宝收款二维码图片地址即可开启该功能。先到微信和支付宝将自己收款二维码图片保存，我们同样可以将其存在七牛云上，然后贴到下面的配置文件里。

>reward_comment: 坚持原创技术分享，您的支持将鼓励我继续创作！
wechatpay: 微信当面付图片的url
alipay: 支付宝当面付图片的url
效果如下：
![enter image description here](http://ooes75dyq.bkt.clouddn.com/creatblog/6.jpg)

Github pages + Hexo搭建静态博客站点到这里就结束了，文章中流程部分有借鉴引用网上的资源。

后续将继续编写【[建站分享](http://jantc.cn/categories/建站分享/)】系列。

        Thanks!
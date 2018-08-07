---
title: MyBatis拦截器分页原理及PageHelper分页插件教学
date: 2017-04-15 17:49:03
tags: [mybatis,数据库]
categories: java
---
闲来无事，特地整理了一下MyBatis拦截器实现分页的原理。

地球人应该都知道要利用JDBC对<font color="red">**数据库**</font>进行操作，就需要一个**statement**对象，MyBatis也是如此。MyBatis在执行sql语句前会产生一个包含sql语句的Statement对象，而且对应的sql语句是在Statement之前产生的，所以我们就可以在MyBatis生成Statement之前对这个sql下手，分页本质上是sql limit去获取数据，所以只要我们在此对sql进行改造，就可以达到分页的目的。那么MyBatis拦截器是怎么做到分页的呢？

<!--more-->

在Mybatis中Statement语句是通过**<font color="red">RoutingStatementHandler</font>**对象的prepare方法生成的。所以利用拦截器实现Mybatis分页的一个思路就是拦截StatementHandler接口的prepare方法，然后在拦截器方法中把Sql语句改成对应的分页查询Sql语句，之后再调用StatementHandler对象的prepare方法，即调用**invocation.proceed()**。对于分页而言，在拦截器里面我们还需要做的一个操作就是统计满足当前条件的记录一共有多少，这是通过获取到了原始的Sql语句后，把它改为对应的统计语句再利用Mybatis封装好的参数和设置参数的功能把Sql语句中的参数进行替换，之后再执行查询记录数的Sql语句进行总记录数的统计。

如何在项目中使用呢？


下面安利一个分页插件。 

[**PageHelper**](https://github.com/pagehelper/Mybatis-PageHelper) 已经在github上开源，可以自行学习一下。

引入项目的流程：

1.如果使用了maven，那么只要在pom.xml中引入该插件即可

```java
<dependency>
    <groupId>com.github.pagehelper</groupId>
    <artifactId>pagehelper</artifactId>
    <version>4.1.4</version>
</dependency>
```
2.在mybatis的全局配置文件中配置该插件
```java
configuration>
    <!-- 配置分页插件 -->
    <plugins>
        <plugin interceptor="com.github.pagehelper.PageHelper">
            <!-- 设置数据库类型 Oracle,Mysql,MariaDB,SQLite,Hsqldb,PostgreSQL六种数据库-->        
            <property name="dialect" value="mysql"/>
        </plugin>
    </plugins>
</configuration>
```
3.在执行你的查询之前。添加一行代码PageHelper.startPage(1, 10);第一个参数表示第几页，第二个参数表示每页显示的记录数。然后本次查询的结果就是分页的结果。 
例如：
```java
		  //分页处理，显示第一页的10条数据
        PageHelper.startPage(1, 10);
        List<Student> list = stuService.queryStu();
```

这个东西呢也不是说都好，在大点的项目呢。这个就有点鸡肋了，因为它不支持条件查询的sql。 当然，网上有改造后支持条件查询的PageHelper，这个还是非常强大的。

改造后的[PageHelper-Fix](https://pan.baidu.com/s/1eSxdMlc) 支持条件查询的PageHelper,内含jar包，可以通过maven -install安装到本地仓库使用

在下载的jar包下执行：

```css
<dependency>
  <groupId>com.mybatis.pagehelper</groupId>
  <artifactId>pagehelper</artifactId>
  <version>1.0</version>
</dependency>
```
然后引入依赖:
```java
<dependency>
  <groupId>com.mybatis.pagehelper</groupId>
  <artifactId>pagehelper</artifactId>
  <version>1.0</version>
</dependency>
```


																			Thanks!
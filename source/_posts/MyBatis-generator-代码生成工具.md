---
title: MyBatis-generator 代码生成工具
date: 2017-04-15 18:21:47
tags: [mybatis]
categories: java
---

现在做很多小项目的时候，用到MyBatis，每次都要自己去写每个方法对应的xml把，很多小伙伴对MyBatis的xml书写不是很熟悉的，就会犯很多错误。现在有了这个工具就再也不用担心咯。 
本工具可以帮你自动生成 dao层、entity层、以及dao对应mybatis所需要的xml文件（mapping层）。我们只需要在数据库建一张表然后按照下面稍稍改动一下，就能生成相应的代码。

<!--more-->
剩下的开发重心就只需要放在controller中去实现我们真正的业务逻辑了。如果需要条件查询。那么也可以自己在dao层里面新增方法，然后按照参照xml中的格式直接在对应的xml文件中写个sql语句就好了。

[工具下载链接](https://pan.baidu.com/s/1miqMdde)

```#
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN" "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>
    <!-- 数据库驱动包位置 -->
    <classPathEntry location="D:\generator\mysql-connector-java-5.1.34.jar" /> 
    <context id="DB2Tables" targetRuntime="MyBatis3">
        <commentGenerator>
            <property name="suppressAllComments" value="true" />
        </commentGenerator>
        <!-- 数据库链接URL、用户名、密码 -->
         <jdbcConnection driverClass="com.mysql.jdbc.Driver" connectionURL="jdbc:mysql://localhost:3306/a?characterEncoding=utf8" userId="root" password="root"> 
        </jdbcConnection>
        <javaTypeResolver>
            <property name="forceBigDecimals" value="false" />
        </javaTypeResolver>
        <!-- 生成模型的包名和位置 -->
        <javaModelGenerator targetPackage="zjc.model" targetProject="D:\generator\src">
            <property name="enableSubPackages" value="true" />
            <property name="trimStrings" value="true" />
        </javaModelGenerator>
        <!-- 生成的映射文件包名和位置 -->
        <sqlMapGenerator targetPackage="zjc.mapping" targetProject="D:\generator\src">
            <property name="enableSubPackages" value="true" />
        </sqlMapGenerator>
        <!-- 生成DAO的包名和位置 -->
        <javaClientGenerator type="XMLMAPPER" targetPackage="zjc.dao" targetProject="D:\generator\src">
            <property name="enableSubPackages" value="true" />
        </javaClientGenerator>
        <!-- 要生成那些表(更改tableName和domainObjectName就可以) -->
        <table tableName="stu" domainObjectName="Stu" enableCountByExample="false" enableUpdateByExample="false" enableDeleteByExample="false" enableSelectByExample="false" selectByExampleQueryId="false" />
        <!-- <table tableName="course_info" domainObjectName="CourseInfo" enableCountByExample="false" enableUpdateByExample="false" enableDeleteByExample="false" enableSelectByExample="false" selectByExampleQueryId="false" />
        <table tableName="course_user_info" domainObjectName="CourseUserInfo" enableCountByExample="false" enableUpdateByExample="false" enableDeleteByExample="false" enableSelectByExample="false" selectByExampleQueryId="false" /> -->
    </context>
</generatorConfiguration>
```
这是文件目录
![这是文件目录](http://ooes75dyq.bkt.clouddn.com/20170411100603601.png)

按上述配置编辑好generator.xml 然后在此文件夹下 shift+鼠标右键 
![](http://ooes75dyq.bkt.clouddn.com/20170412150228376.png)

输入Java -jar mybatis-generator-core-1.3.2.jar -configfile generator.xml -overwrite 
![](http://ooes75dyq.bkt.clouddn.com/20170412150300260.png)

看到Success就表示生成成功了，然后去生成的文件夹下查看
![](http://ooes75dyq.bkt.clouddn.com/20170412150350152.png)


                         Thanks！

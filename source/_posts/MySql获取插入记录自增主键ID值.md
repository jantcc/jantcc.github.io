---
title: MySql获取插入记录自增主键ID值
date: 2017-04-15 18:17:03
tags: [mysql]
categories: java
---
现在这种场景偏多，获取的方式也很多。像MyBatis和hibernate都有方式去获取该值。

现在简单讲讲MyBatis是获取插入记录自增主键ID值的。

<!--more-->
```java
public class Stu {
    private int id;
    private String name;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
public interface StuDao {
    public int insertStu(Stu stu);
}

//mybatis dao.xml
<mapper namespace="org.zjc.dao.StuDao">
    <insert id="insertStu" parameterType="org.zjc.entity.Stu" useGeneratedKeys="true" keyProperty="id">
          insert into stu(Name) values (#{name,jdbcType=VARCHAR})
    </insert>
</mapper>

//JUnit4
 public void TestinsertStu() throws Exception {
        Stu stu = new Stu();
        stu.setName("吕布");
        int i = stuDao.insertStu(stu);
        System.out.println(i);
        System.out.println(stu.getId());
    }
```
这里的i代表影响的行数。 
执行完stuDao.insertStu(stu)就会将本次插入的记录的自增主键ID赋值到stu对象的id中。

你可以理解stuDao.insertStu(stu)干了这两件事： 
1.<font color="red">先往表中插入了记录
2.调用了stu.setId方法</font> 

useGeneratedKeys默认为false。该字段代表设置是否使用JDBC的getGenereatedKeys方法获取主键并赋值到keyProperty设置的领域模型属性中。在这里我们设置字段值为true，然后设置keyProperty的值。keyProperty的值注意必须和实体类的主键名一致，（注意不是数据库表的自增主键字段名）。

如果没有用MyBatis。那么直接调用getGeneratedKeys()方法。

```java
Connection conn = ;
        Serializable ret = null;
        PreparedStatement state = .;
        ResultSet rs=null;
        try {
            state.executeUpdate();
            rs = state.getGeneratedKeys();
            if (rs.next()) {
                ret = (Serializable) rs.getObject(1);
            }       
        } catch (SQLException e) {
        } 
        return ret;
```


				Thanks!
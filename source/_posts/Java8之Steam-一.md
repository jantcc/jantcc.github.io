---
title: Java8之Steam(一)
date: 2018-01-26 16:26:37
tags: [Java8]
categories: java
---

流是Java8引入的全新概念，它用来处理集合中的数据，暂且可以把它理解为一种高级集合。

<!--more-->
#### 1.1 获取流
1.集合
>List&lt;Person&gt; list = new ArrayList&lt;Person&gt;(); 
>Stream&lt;Person&gt; stream = list.stream();

2.数组
>String[] names = {"chaimm","peter","john"};
>Stream&lt;String&gt; stream = Arrays.stream(names);

3.值
>Stream&lt;String&gt; stream = Stream.of("chaimm","peter","john");

#### 1.2 筛选filter
>List&lt;Person&gt; result = list.stream()
                    .filter(Person::isStudent)
                    .collect(toList());
                    
#### 1.3 去重distinct
>List&lt;Person&gt; result = list.stream()
                    .distinct()
                    .collect(toList());

#### 1.4 截取
>List&lt;Person&gt; result = list.stream()
                    .limit(3)
                    .collect(toList());
                  
#### 1.5 跳过
>List&lt;Person&gt; result = list.stream()
                    .skip(3)
                    .collect(toList());

#### 1.6 映射
>List&lt;Person&gt; result = list.stream()
                    .map(Person::getName)
                    .collect(toList());

#### 1.7 是否匹配任一元素：anyMatch
>boolean result = list.stream()
            .anyMatch(Person::isStudent);

#### 1.8 是否匹配所有元素：allMatch
>boolean result = list.stream()
            .allMatch(Person::isStudent);

#### 1.9 是否未匹配所有元素：noneMatch
>boolean result = list.stream()
            .noneMatch(Person::isStudent);

#### 1.10 获取任一元素findAny
>Optional&lt;Person&gt; person = list.stream()
                                    .findAny();

#### 1.11 获取第一个元素findFirst
>Optional&lt;Person&gt; person = list.stream()
                                    .findFirst();

#### 1.12 归约
元素求和：自定义Lambda表达式实现求和

例：计算所有人的年龄总和
>int age = list.stream().reduce(0, (person1,person2)->person1.getAge()+person2.getAge());

reduce的第一个参数表示初试值为0； 
reduce的第二个参数为需要进行的归约操作，它接收一个拥有两个参数的Lambda表达式，reduce会把流中的元素两两输给Lambda表达式，最后将计算出累加之和。

元素求和：使用Integer.sum函数求和

上面的方法中我们自己定义了Lambda表达式实现求和运算，如果当前流的元素为数值类型，那么可以使用Integer提供了sum函数代替自定义的Lambda表达式，如：
>int age = list.stream().reduce(0, Integer::sum);

Integer类还提供了min、max等一系列数值操作，当流中元素为数值类型时可以直接使用。

#### 1.13 将普通流转换成数值流
StreamAPI提供了三种数值流：IntStream、DoubleStream、LongStream，也提供了将普通流转换成数值流的三种方法：mapToInt、mapToDouble、mapToLong。 
如，将Person中的age转换成数值流：
>IntStream stream = list.stream()
                            .mapToInt(Person::getAge);

#### 1.14 数值计算
每种数值流都提供了数值计算函数，如max、min、sum等。 
如，找出最大的年龄：
>OptionalInt maxAge = list.stream()
                                .mapToInt(Person::getAge)
                                .max();
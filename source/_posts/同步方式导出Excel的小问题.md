---
title: 同步方式导出Excel的小问题
date: 2017-04-24 12:51:59
tags: ajax
categories: java
---
最近有个需求，需要同步导出Excel，对非异步。

那么ajax是不能使用的，而且要提醒用户现在是正在下载Excel的，需要在导出按钮点击后，弹出一个div，提示用户"数据正在导出中，请稍后"，现在问题来了，我们如何获取数据下载完成的标记位呢。问题也就是变成了：如何在下载结束后关闭这个div

<!--more-->

因为是同步操作，意味着在导出下载Excel这个请求不能断，要一直进行。一直进行页面就会处于一种假死状态（其实一直在导出下载Excel）

目前没有想到好的方法可以直接获取"请求结束,下载完成"这个标记，也不知道是否存在这样的一个标记能够直接定位。

目前采取的方式是：export操作同步进行，当下载完成后再代码块finally{}中，自己创建一个标识，例如downloadtags写入redis。然后页面上单开一个定时器，每个800ms触发ajax去获取标识，如果能够获取到，则提醒用户下载完成，提示下载完成。关闭div...

```javascript
<script type="text/javascript">
    self.setInterval("checktags()",800);
    function checktags() {
                  $.ajax({
               type: 'POST',
               url: url,
               dataType: 'json',
               success: function (data) {
                   if(data){
                       $("#downloading").hide();
                       $(".trade-foot").show();
                   }
               }
           });
    }
    </script>
```
Thanks!

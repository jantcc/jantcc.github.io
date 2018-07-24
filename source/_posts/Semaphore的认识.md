---
title: Semaphore的认识
date: 2018-07-24 14:52:09
tags: [Java8]
categories: java
---

Semaphore 是一种基于技术的信号量。它可以设置一个阈值，然后多个线程竞争获取许可信号，完成后归还，超过阈值后，线程申请许可信号将会被阻塞

<!--more-->

### 常用方法
> 1.  Semaphore(int permits) 参数permits表示许可数目，即同时可以允许多少线程进行访问
2. Semaphore(int permits, boolean fair) 多了一个参数fair表示是否是公平的，即等待时间越久的越先获取许可
3. availablePermits() 返回此信号量中当前可用的许可数
4. acquire() 申请资源
5. release() 释放资源

###用法
``` java
Semaphore semp = new Semaphore(10);  
try {  
    // 1.申请许可  
    semp.acquire();  
    try {  
        // 2.业务逻辑  
    } catch (Exception e) {  

    } finally {  
        // 3.释放许可  
        semp.release();  
    }  
} catch (InterruptedException e) {  

}  
```

###案例
>  * 在测试环境有5台机器可供测试发布，但是有10个需求需要发到测试环境进行验证。
 * 假设10个需求的编号分别为1-10，哪个需求先发布，哪个需求就可以开始测试。测试环境一台机器只能测试一个需求，不能共享
 
``` java
	class MyTestJob implements Runnable {
    private String ip;
    private Semaphore semaphore;

    public MyTestJob(String ip, Semaphore semaphore) {
        this.ip = ip;
        this.semaphore = semaphore;
    }

    @Override
    public void run() {
        // 1.获取可以用的测试环境机器数目，然后申请测试环境一台机器用来测试发布
        int availableIps = semaphore.availablePermits();
        if (availableIps > 0) {
            // 表示还有空闲机器可以用于发布测试
            System.out.println("还有空闲机器可供测试发布");
        } else {
            System.out.println("无空闲机器可供测试发布");
        }
        try {
            semaphore.acquire();
            System.out.println(ip + ":正在发布验证需求...");
            Thread.sleep(1000);
            System.out.println(ip + ": 需求验证完毕！");
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            semaphore.release();
        }
    }
}


public class Job {
    public static void main(String[] args) {
        Semaphore semaphore = new Semaphore(5);
        for (int i = 1; i < 11; i++) {
            new Thread(new MyTestJob("ip"+i,semaphore)).start();
        }
    }
}
```

> Clog:
> 还有空闲机器可供测试发布
还有空闲机器可供测试发布
ip4:正在发布验证需求...
ip1:正在发布验证需求...
还有空闲机器可供测试发布
ip5:正在发布验证需求...
还有空闲机器可供测试发布
ip8:正在发布验证需求...
还有空闲机器可供测试发布
ip3:正在发布验证需求...
无空闲机器可供测试发布
无空闲机器可供测试发布
无空闲机器可供测试发布
无空闲机器可供测试发布
无空闲机器可供测试发布
ip4: 需求验证完毕！
ip6:正在发布验证需求...
ip1: 需求验证完毕！
ip7:正在发布验证需求...
ip5: 需求验证完毕！
ip8: 需求验证完毕！
ip3: 需求验证完毕！
ip2:正在发布验证需求...
ip9:正在发布验证需求...
ip10:正在发布验证需求...
ip6: 需求验证完毕！
ip7: 需求验证完毕！
ip2: 需求验证完毕！
ip9: 需求验证完毕！
ip10: 需求验证完毕！



### 应用场景：分布式锁
 


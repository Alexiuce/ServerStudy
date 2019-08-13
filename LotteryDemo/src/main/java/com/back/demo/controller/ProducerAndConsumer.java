package com.back.demo.controller;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ProducerAndConsumer {

    public static void main(String[] args) {
        Clerk clerk = new Clerk();

        Producer pro = new Producer(clerk);

        Consumer cus = new Consumer(clerk);

        new Thread(pro,"生产者A").start();
        new Thread(pro,"生产者C").start();
        new Thread(cus,"消费者B").start();
        new Thread(cus,"消费者D").start();
    }
}

class Clerk{
    private int product = 0;

    private Lock lock = new ReentrantLock();
    private Condition condition = lock.newCondition();
    //进货
    public  void get(){
        lock.lock();
        try {
            while (product >= 10){
                System.out.println("产品已满");
                try {
                    condition.await();
                }catch (InterruptedException e){
                }
        }
            System.out.println(Thread.currentThread().getName()+":"+ ++product);
            condition.signalAll();
    }finally {
            lock.unlock();
        }

    }


    //卖货
    public  void sale(){
        lock.lock();
        try {
            while (product <= 0){
                System.out.println("缺货");
                try {
                    condition.await();
                }catch (InterruptedException e){}
            }
            System.out.println(Thread.currentThread().getName()+":"+ --product);
            condition.signalAll();
        }finally {
            lock.unlock();
        }


    }
}

//生产者
class Producer implements Runnable{
    private Clerk clerk;
    public Producer(Clerk clerk){
        this.clerk = clerk;
    }

    @Override
    public void run() {
        for (int i = 0; i <20 ; i++) {
            clerk.get();
        }
    }
}

class Consumer implements Runnable{
    private Clerk clerk;

    public Consumer(Clerk clerk){
        this.clerk = clerk;
    }

    @Override
    public void run() {
        for (int i = 0; i <20 ; i++) {
            clerk.sale();
        }
    }
}
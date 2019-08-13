package com.back.demo.controller;

public class TestProducerAndConsumer {

//    public static void main(String[] args) {
//        Clerk clerk = new Clerk();
//
//        Producer pro = new Producer(clerk);
//
//        Consumer cus = new Consumer(clerk);
//
//        new Thread(pro,"生产者A").start();
//        new Thread(cus,"消费者B").start();
//    }
//}
//
//class Clerk{
//    private int product = 0;
//
//    //进货
//    public synchronized void get(){
//        while (product >= 10){
//            System.out.println("产品已满");
//        try {
//            this.wait();
//        }catch (InterruptedException e){
//        }
//    }
//            System.out.println(Thread.currentThread().getName()+":"+ ++product);
//            this.notifyAll();
//    }
//
//
//    //卖货
//    public synchronized void sale(){
//        while (product <= 0){
//            System.out.println("缺货");
//            try {
//                this.wait();
//            }catch (InterruptedException e){}
//        }
//            System.out.println(Thread.currentThread().getName()+":"+ --product);
//            this.notifyAll();
//    }
//}
////生产者
//class Producer implements Runnable{
//    private Clerk clerk;
//    public Producer(Clerk clerk){
//        this.clerk = clerk;
//    }
//
//    @Override
//    public void run() {
//        for (int i = 0; i <20 ; i++) {
//            clerk.get();
//        }
//    }
//}
//
//class Consumer implements Runnable{
//    private Clerk clerk;
//
//    public Consumer(Clerk clerk){
//        this.clerk = clerk;
//    }
//
//    @Override
//    public void run() {
//        for (int i = 0; i <20 ; i++) {
//            clerk.sale();
//        }
//    }
}
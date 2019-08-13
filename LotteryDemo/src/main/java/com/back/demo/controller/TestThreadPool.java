package com.back.demo.controller;

public class TestThreadPool {

}

class ThreadPoolDemo implements Runnable{

    private int i = 0;

    @Override
    public void run() {
        while (i <= 100){
            System.out.println();
        }
    }
}

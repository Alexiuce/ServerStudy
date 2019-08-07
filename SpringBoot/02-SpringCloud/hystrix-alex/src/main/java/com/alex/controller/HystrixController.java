package com.alex.controller;

import com.alex.protocol.HystrixFeignInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hys")
public class HystrixController {

//    @Autowired
//    private HystrixFeignInterface mHystrix;

    @GetMapping("/info")
    public String showInfo(){
//        return mHystrix.hystrixInfo();
        return "hystrix information is good ....";
    }
}

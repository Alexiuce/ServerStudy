package com.alex.application.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/rest")
public class RestTemplateController {

    @Autowired
    private RestTemplate mRest;

    @GetMapping("/say")
    public String sayHello(){
        return mRest.getForObject("http://localhost:9980/hello",String.class);
    }

}

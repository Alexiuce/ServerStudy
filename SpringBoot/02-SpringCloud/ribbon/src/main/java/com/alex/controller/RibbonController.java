package com.alex.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class RibbonController {

    @Autowired
    private RestTemplate rmpt;
    @RequestMapping("/abc")
    public String hello(){
        return rmpt.getForObject("http://provide/index",String.class);
    }
}

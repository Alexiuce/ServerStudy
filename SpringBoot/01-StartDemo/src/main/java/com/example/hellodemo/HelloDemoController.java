package com.example.hellodemo;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloDemoController {
    @RequestMapping("/hello")
    public String index(){

        return "Hello World";
    }
}

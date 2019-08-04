package com.alex.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/feign")
public class FeignController {
    @Autowired
    private FeignProviderClient mClient;

    @GetMapping("/index")
    public String index(){
        return mClient.showInedex();
    }
}

package com.alex.controllers;


import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(value = "provide")
public interface FeignProviderClient {

    @GetMapping("/index")
    public String showInedex();
}

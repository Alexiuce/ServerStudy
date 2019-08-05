package com.alex.controllers;


import com.alex.impl.FeignError;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(value = "provide",fallback = FeignError.class)
public interface FeignProviderClient {

    @GetMapping("/index")
    public String showInedex();
}

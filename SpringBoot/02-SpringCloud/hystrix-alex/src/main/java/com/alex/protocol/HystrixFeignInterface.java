package com.alex.protocol;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(value = "provide")
public interface HystrixFeignInterface {

    @GetMapping("/info")
    public String hystrixInfo();
}

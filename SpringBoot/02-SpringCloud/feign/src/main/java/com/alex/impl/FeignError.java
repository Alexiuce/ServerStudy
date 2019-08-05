package com.alex.impl;

import com.alex.controllers.FeignProviderClient;
import org.springframework.stereotype.Component;

@Component
public class FeignError implements FeignProviderClient {
    @Override
    public String showInedex() {
        return "server is stopping";
    }
}

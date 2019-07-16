package com.alexiuce.springbootthymeleafdemo;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(Map<String,Object>param){

        param.put("name","abc");
        param.put("age","12");
        return "index";
    }
}

package com.alexiuce.github.springclouddemo;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
public class HelloController {

    @RequestMapping(value = "/home",method = RequestMethod.POST)
    @ResponseBody
    public String sayHello(HttpServletRequest req){
       String dic = req.getParameter("dic");
       String name = req.getParameter("name");
        return "Hello Spring Cloud Demo1";
    }

}

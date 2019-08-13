package com.back.demo.controller;

import com.alibaba.fastjson.JSONObject;
import com.back.demo.pojo.Order;
import com.back.demo.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;

@Controller
@RequestMapping(value = "/test", method = RequestMethod.GET)
public class TestController {

    @Autowired
    private IOrderService orderService;

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(){
        JSONObject json = new JSONObject();
        json.put("code",0);
        json.put("msg","");
        json.put("count",1000);
        List<Order> list = orderService.manageList();
        json.put("data",list);
        return json;

    }

}

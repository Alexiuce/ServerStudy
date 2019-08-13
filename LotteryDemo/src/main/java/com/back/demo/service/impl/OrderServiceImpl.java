package com.back.demo.service.impl;


import com.back.demo.dao.OrderMapper;
import com.back.demo.pojo.Order;
import com.back.demo.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

@Service("iOrderService")
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private OrderMapper orderMapper;


    public List<Order> manageList(){
        List<Order> orderList = orderMapper.selectAllOrder();
        return orderList;
    }


}

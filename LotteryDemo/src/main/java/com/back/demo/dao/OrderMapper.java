package com.back.demo.dao;

import com.back.demo.pojo.Order;

import java.util.List;

public interface OrderMapper {

    List<Order> selectAllOrder();
}
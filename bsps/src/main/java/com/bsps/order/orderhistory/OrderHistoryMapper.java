package com.bsps.order.orderhistory;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface OrderHistoryMapper {
    public List<OrderHistory> selectAll(OrderHistory orderHistory) throws Exception;
    public void insert(OrderHistory orderHistory) throws Exception;
    public void update(OrderHistory orderHistory) throws Exception;
    public void delete(OrderHistory orderHistory) throws Exception;
}
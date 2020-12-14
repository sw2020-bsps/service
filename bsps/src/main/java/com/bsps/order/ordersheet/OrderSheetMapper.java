package com.bsps.order.ordersheet;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface OrderSheetMapper {
    public List<OrderSheet> selectAll(OrderSheet orderSheet) throws Exception;
    public OrderSheet select(OrderSheet orderSheet) throws Exception;
    public void insert(OrderSheet orderSheet) throws Exception;
    public void update(OrderSheet orderSheet) throws Exception;
    public void delete(OrderSheet orderSheet) throws Exception;
}
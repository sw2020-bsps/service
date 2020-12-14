package com.bsps.order.orderhistory;

import java.util.List;

import com.bsps.cart.Product;

public interface OrderHistoryService {
	public void registerOrderHistory(int orderSheetNo, Product product);
	public List<OrderHistory> searchOrderHistory(int orderHistoryNo);
	public void deleteOrderHistory(int orderSheetNo);
}

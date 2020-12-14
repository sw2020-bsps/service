package com.bsps.order.ordersheet;

import java.util.List;

import com.bsps.cart.Product;
import com.bsps.payment.Payment;

public interface OrderSheetService {
	public OrderSheet registerOrderSheet(List<Product> products, Payment payment);
	public List<OrderSheet> searchAllOrderSheet();
	public OrderSheet searchOrderSheet(int orderSheetNo);
	public void modifyOrderSheet(OrderSheet orderSheet);
	public void deleteOrderSheet(int orderSheetNo);
}

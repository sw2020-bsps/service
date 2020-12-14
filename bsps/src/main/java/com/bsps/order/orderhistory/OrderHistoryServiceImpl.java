package com.bsps.order.orderhistory;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsps.beans.Beans;
import com.bsps.beans.BeansServiceImpl;
import com.bsps.cart.Product;

@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {
	@Autowired
	private OrderHistoryMapper orderHistoryMapper;
	@Autowired
	private BeansServiceImpl beansService;
	
	@Override
	public void registerOrderHistory(int orderSheetNo, Product product) {
		OrderHistory orderHistory = new OrderHistory();
		orderHistory.setOrderSheetNo(orderSheetNo);
		orderHistory.setBeansNo(product.getBeansNo());
		orderHistory.setWeight(product.getSelectWeight());
		orderHistory.setPrice(product.getPrice());
		
		try {
			orderHistoryMapper.insert(orderHistory);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderHistory> searchOrderHistory(int orderSheetNo) {
		OrderHistory orderHistory = new OrderHistory();
		orderHistory.setOrderSheetNo(orderSheetNo);
		
		List<OrderHistory> orderHistoryList = null;
		try {
			orderHistoryList = orderHistoryMapper.selectAll(orderHistory);
			
			Beans beans = new Beans();
			List<Beans> beansList = new ArrayList<Beans>();
			for (int i = 0; i < orderHistoryList.size(); i++) {
				beans.setBeansNo(orderHistoryList.get(i).getBeansNo());
				orderHistoryList.get(i).setBeansName(beansService.searchBeans(beans).getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderHistoryList;
	}

	@Override
	public void deleteOrderHistory(int orderSheetNo) {
		OrderHistory orderHistory = new OrderHistory();
		orderHistory.setOrderSheetNo(orderSheetNo);
		
		try {
			orderHistoryMapper.delete(orderHistory);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

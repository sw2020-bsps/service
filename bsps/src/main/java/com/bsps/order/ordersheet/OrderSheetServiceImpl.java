package com.bsps.order.ordersheet;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.bsps.beans.Beans;
import com.bsps.beans.BeansServiceImpl;
import com.bsps.cart.Product;
import com.bsps.member.Member;
import com.bsps.order.orderhistory.OrderHistory;
import com.bsps.order.orderhistory.OrderHistoryServiceImpl;
import com.bsps.payment.Payment;

@Service
public class OrderSheetServiceImpl implements OrderSheetService {
	@Autowired
	private BeansServiceImpl beansService;
	@Autowired
	private OrderHistoryServiceImpl orderHistoryService;
	@Autowired
	private OrderSheetMapper orderSheetMapper;
	@Autowired
	private HttpSession session;
	
	@Override
	public OrderSheet registerOrderSheet(List<Product> productList, Payment payment) {
		int orderSheetNo = getOrderSheetNo();
		OrderSheet orderSheet = new OrderSheet();
		
		orderSheet.setOrderSheetNo(orderSheetNo);
		orderSheet.setEmailAddress(payment.getEmailAddress());
		orderSheet.setZipCode(payment.getZipCode());
		orderSheet.setAddress(payment.getAddress());
		orderSheet.setDetailAddress(payment.getDetailAddress());
		orderSheet.setOrderDate(new Date());
		orderSheet.setOrderPrice(payment.getTotalPrice());
		
		try {
			orderSheetMapper.insert(orderSheet);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for (Product product : productList) {
			orderHistoryService.registerOrderHistory(orderSheetNo, product);
		}
		
		return orderSheet;
	}

	@Override
	public List<OrderSheet> searchAllOrderSheet() {
		List<OrderSheet> orderSheetList = null;
		Member member = (Member) session.getAttribute("member");
		
		OrderSheet orderSheet = new OrderSheet();
		orderSheet.setEmailAddress(member.getEmailAddress());
		orderSheet.setDisplayStatus('Y');
		
		try {
			orderSheetList = orderSheetMapper.selectAll(orderSheet);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderSheetList;
	}
	
	@Override
	public OrderSheet searchOrderSheet(int orderSheetNo) {
		OrderSheet orderSheet = new OrderSheet();
		orderSheet.setOrderSheetNo(orderSheetNo);
		
		try {
			orderSheet = orderSheetMapper.select(orderSheet);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderSheet;
	}

	@Override
	public void modifyOrderSheet(OrderSheet orderSheet) {
		try {
			orderSheetMapper.update(orderSheet);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderSheet(int orderSheetNo) {
		OrderSheet orderSheet = new OrderSheet();
		orderSheet.setOrderSheetNo(orderSheetNo);
		
		try {
			orderSheet = orderSheetMapper.select(orderSheet);
			
			if (orderSheet.getPaymentStatus() == 'Y' || orderSheet.getPaymentStatus() == 'R') {
				orderSheet.setDisplayStatus('N');
				modifyOrderSheet(orderSheet);
			} else {				
				orderHistoryService.deleteOrderHistory(orderSheetNo);
				orderSheetMapper.delete(orderSheet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Integer> getPicture(List<OrderHistory> orderHistoryList) {
		List<Integer> pictureList = new ArrayList<Integer>();
		Beans beans = new Beans();
		
		for (OrderHistory orderHistory : orderHistoryList) {
			beans.setBeansNo(orderHistory.getBeansNo());
			pictureList.add(beansService.searchBeans(beans).getPictureNo());
		}
		
		return pictureList;
	}
	
	public List<List<Product>> getPorduct(List<OrderSheet> orderSheetList) {
		List<List<Product>> orderSheetProductList = new ArrayList<List<Product>>();
		
		List<Integer> orderSheetNoList = new ArrayList<Integer>();
		for (OrderSheet orderSheet : orderSheetList) {
			orderSheetNoList.add(orderSheet.getOrderSheetNo());
		}
		
		for (int i = 0; i < orderSheetNoList.size(); i++) {
			List<OrderHistory> orderHistoryList = orderHistoryService.searchOrderHistory(orderSheetNoList.get(i));
			
			List<Product> productList = new ArrayList<Product>();
			Beans beans = new Beans();
			for (int j = 0; j < orderHistoryList.size(); j++) {
				Product product = new Product();
				beans.setBeansNo(orderHistoryList.get(j).getBeansNo());
				
				product.setBeansNo(orderHistoryList.get(j).getBeansNo());
				product.setPictureNo(beansService.searchBeans(beans).getPictureNo());
				product.setOrderSheetNo(orderHistoryList.get(j).getOrderSheetNo());
				product.setName(orderHistoryList.get(j).getBeansName());
				product.setSelectWeight(orderHistoryList.get(j).getWeight());
				product.setPrice((orderHistoryList.get(j).getPrice()));
				product.setBeansPrice(beansService.searchBeans(beans).getPrice());
				
				productList.add(product);
			}
			orderSheetProductList.add(productList);
		}
		
		return orderSheetProductList;
	}
	
	private int getOrderSheetNo() {
		SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
		Date date = new Date();
		int orderSheetNo = Integer.parseInt(format.format(date) + new Random().nextInt(9999));
		
		return orderSheetNo;
	}
}

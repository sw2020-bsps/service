package com.bsps.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsps.cart.Product;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private HttpSession session;
	
	@Override
	public List<Product> cartOrder() {
		List<Product> productList = (List<Product>) session.getAttribute("cart");
		
		return productList;
	}
	
	@Override
	public List<Product> directOrder(Product product) {
		List<Product> productList = new ArrayList<Product>();
		
		product.setPrice(product.getBeansPrice() * (product.getSelectWeight() / 100));
		productList.add(product);
		
		return productList;
	}
	
	@Override
	public String createOrderName(List<Product> productList) {
		StringBuffer orderBeansName = new StringBuffer();
		
		if (productList.size() > 1) {
			orderBeansName
			.append(productList.get(0).getName())
			.append(" 외 ")
			.append(productList.size() - 1)
			.append("개");
		} else {
			orderBeansName
				.append(productList.get(0).getName());
		}
		
		return orderBeansName.toString();
	}
	
	@Override
	public int getTotalPrice(List<Product> productList) {
		int totalMoney = 0;
		
		for (Product product : productList) {
			totalMoney = totalMoney + product.getPrice();
		}
		
		return totalMoney;
	}
}

package com.bsps.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private HttpSession session;
	
	@Override
	public boolean registerCart(Product product) {
		if (session.getAttribute("member") != null) {
			if (session.getAttribute("cart") != null) {
				List<Product> productList = (List<Product>) session.getAttribute("cart");
				
				for (int i = 0; i < productList.size(); i++) {
					if (product.getBeansNo() == productList.get(i).getBeansNo()) {
						int totalWeight = productList.get(i).getSelectWeight() + product.getSelectWeight();
						
						if (1000 >= totalWeight && productList.get(i).getStockWeight() > totalWeight) {
							product.setSelectWeight(totalWeight);
							product.setPrice(((product.getBeansPrice() * (product.getSelectWeight() / 100))));
							productList.set(i, product);
							
							return true;
						}
						return false;
					}
				}
				product.setPrice((product.getBeansPrice() * (product.getSelectWeight() / 100)));
				productList.add(product);
				
				return true;
			} else {
				List<Product> productList = new ArrayList<Product>();
				product.setPrice((product.getBeansPrice() * (product.getSelectWeight() / 100)));
				
				productList.add(product);
				session.setAttribute("cart", productList);
				
				return true;
			}
		}
		return false;
	}
	
	@Override
	public List<Product> searchAllCart() {
		List<Product> productList = (List<Product>) session.getAttribute("cart");
		
		return productList;
	}

	@Override
	public void modifyCart(Product product) {
		List<Product> productList = (List<Product>) session.getAttribute("cart");
		
		for (int i = 0; i < productList.size(); i++) {
			if (product.getBeansNo() == productList.get(i).getBeansNo()) {
				product.setPrice((product.getBeansPrice() * (product.getSelectWeight() / 100)));
				productList.set(i, product);
			}
		}
	}

	@Override
	public void deleteCart(Product product) {
		List<Product> productList = (List<Product>) session.getAttribute("cart");
		
		for (int i = 0; i < productList.size(); i++) {
			if (product.getBeansNo() == productList.get(i).getBeansNo()) {
				productList.remove(i);
			}
		}
	}
	
	public int totalPrice(List<Product> productList) {
		int price = 0;
		
		if (productList != null) {
			for (Product product : productList) {
				price = price + product.getPrice();
			}
		}
		
		return price;
	}
}

package com.bsps.cart;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface CartService {
	public boolean registerCart(Product product);
	public List<Product> searchAllCart();
	public void modifyCart(Product product);
	public void deleteCart(Product product);
}

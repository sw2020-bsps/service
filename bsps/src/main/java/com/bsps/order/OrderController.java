package com.bsps.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bsps.cart.Product;

@RestController
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderServiceImpl orderService;
	
	@PostMapping("/direct")
	public ModelAndView doDirectOrder(@ModelAttribute Product product) {
		List<Product> productList = orderService.directOrder(product);
		String orderName = product.getName();
		int totalPrice = orderService.getTotalPrice(productList);
		
		ModelAndView mav = new ModelAndView("order/checkout");
		mav.addObject("productList", productList);
		mav.addObject("orderName", orderName);
		mav.addObject("totalPrice", totalPrice);
		
		return mav;
	}
	
	@PostMapping("/cart")
	public ModelAndView doCartOrder() {
		List<Product> productList = orderService.cartOrder();
		String orderName = orderService.createOrderName(productList);
		int totalPrice = orderService.getTotalPrice(productList);
		
		ModelAndView mav = new ModelAndView("order/checkout");
		mav.addObject("productList", productList);
		mav.addObject("orderName", orderName);
		mav.addObject("totalPrice", totalPrice);
		
		return mav;
	}
}

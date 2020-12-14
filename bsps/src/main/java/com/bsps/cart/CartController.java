package com.bsps.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CartServiceImpl cartService;

	@PostMapping
	public boolean doRegisterCart(@RequestBody Product product) {
		return cartService.registerCart(product);
	}
	
	@GetMapping
	public ModelAndView doSearchAllCart() {
		List<Product> productList = cartService.searchAllCart();
		int totalPrice = cartService.totalPrice(productList);
		
		
		ModelAndView mav = new ModelAndView("cart/cart");
		mav.addObject("productList", productList);
		mav.addObject("totalPrice", totalPrice);
		
		return mav;
	}
	
	@PutMapping
	public ModelAndView doModifyCart(@ModelAttribute Product product) {
		cartService.modifyCart(product);
		
		return new ModelAndView(new RedirectView("/cart"));
	}
	
	@DeleteMapping
	public ModelAndView doDeleteCart(@ModelAttribute Product product) {
		cartService.deleteCart(product);
		
		return new ModelAndView(new RedirectView("/cart"));
	}
}

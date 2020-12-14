package com.bsps.order.ordersheet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.bsps.cart.Product;
import com.bsps.order.orderhistory.OrderHistory;
import com.bsps.order.orderhistory.OrderHistoryServiceImpl;
import com.bsps.payment.paymenthistory.PaymentHistory;
import com.bsps.payment.paymenthistory.PaymentHistoryServiceImpl;

@RestController
@RequestMapping("/ordersheet")
public class OrderSheetController {
	@Autowired
	private OrderSheetServiceImpl orderSheetService;
	@Autowired
	private OrderHistoryServiceImpl orderHistoryService;
	@Autowired
	private PaymentHistoryServiceImpl paymentHistoryService;
	
	@GetMapping
	public ModelAndView doSearchAllOrderSheet() {
		List<OrderSheet> orderSheetList = orderSheetService.searchAllOrderSheet();
		List<List<Product>> orderSheetProductList = orderSheetService.getPorduct(orderSheetList);
		
		ModelAndView mav = new ModelAndView("ordersheet/list");
		mav.addObject("orderSheetList", orderSheetList);
		mav.addObject("orderSheetProductList", orderSheetProductList);
		
		return mav;
	}
	
	@GetMapping("/{orderSheetNo}")
	public ModelAndView doSearchOrderSheet(@PathVariable int orderSheetNo) {
		OrderSheet orderSheet = orderSheetService.searchOrderSheet(orderSheetNo);
		List<OrderHistory> orderHistoryList = orderHistoryService.searchOrderHistory(orderSheetNo);
		PaymentHistory paymentHistory = paymentHistoryService.searchPaymentHistory(orderSheetNo);
		List<Integer> pictureList = orderSheetService.getPicture(orderHistoryList);
		
		ModelAndView mav = new ModelAndView("ordersheet/view");
		mav.addObject("orderSheet", orderSheet);
		mav.addObject("orderHistoryList", orderHistoryList);
		mav.addObject("pictureList", pictureList);
		mav.addObject("paymentHistory", paymentHistory);
		
		return mav;
	}
	
	@DeleteMapping("/{orderSheetNo}")
	public ModelAndView doDeleteOrderSheet(@PathVariable int orderSheetNo) {
		orderSheetService.deleteOrderSheet(orderSheetNo);
		
		ModelAndView mav = new ModelAndView(new RedirectView("/ordersheet"));
		return mav;
	}
}

package com.bsps.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.bsps.member.Member;
import com.bsps.order.orderhistory.OrderHistory;
import com.bsps.order.orderhistory.OrderHistoryServiceImpl;
import com.bsps.order.ordersheet.OrderSheet;
import com.bsps.order.ordersheet.OrderSheetServiceImpl;
import com.bsps.payment.paymenthistory.PaymentHistory;
import com.bsps.payment.paymenthistory.PaymentHistoryServiceImpl;

@RestController
@RequestMapping("/payment")
public class PaymentController {
	@Autowired
	private OrderSheetServiceImpl orderSheetService;
	@Autowired
	private OrderHistoryServiceImpl orderHistoryService;
	@Autowired
	private PaymentHistoryServiceImpl paymentHistoryService;
	@Autowired
	private PaymentServiceImpl paymentService;
	
	@PostMapping
	public ResponseEntity<OrderSheet> requestPayment(@RequestBody Payment payment) {
		OrderSheet orderSheet = paymentService.payment(payment);
		
		return ResponseEntity.status(HttpStatus.OK).body(orderSheet);
	}
	
	@PostMapping("/{paymentStatus}")
	public ResponseEntity<Boolean> getPaymentResult(@PathVariable boolean paymentStatus, @RequestBody PaymentHistory paymentHistory) {
		boolean result = paymentService.authPayment(paymentStatus, paymentHistory);
		
		return ResponseEntity.status(HttpStatus.OK).body(result);
	}
	
	@GetMapping("/result/{orderSheetNo}")
	public ModelAndView getPaymentSuccess(@PathVariable int orderSheetNo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		boolean status = paymentService.isCheckPayment(orderSheetNo, member);
		List<OrderHistory> orderHistoryList = orderHistoryService.searchOrderHistory(orderSheetNo);
		OrderSheet orderSheet = orderSheetService.searchOrderSheet(orderSheetNo);
		PaymentHistory paymentHistory = paymentHistoryService.searchPaymentHistory(orderSheetNo);
		
		ModelAndView mav = new ModelAndView("payment/result");
		mav.addObject("status", status);
		mav.addObject("orderHistoryList", orderHistoryList);
		mav.addObject("orderSheet", orderSheet);
		mav.addObject("paymentHistory", paymentHistory);
		
		return mav;
	}
	
	@GetMapping("/result")
	public ModelAndView getPaymentFail() {
		ModelAndView mav = new ModelAndView("payment/result");
		mav.addObject("status", false);
		
		return mav;
	}
	
	@DeleteMapping("/{orderSheetNo}")
	public ModelAndView requestRefund(@PathVariable int orderSheetNo) {
		ModelAndView mav = new ModelAndView(new RedirectView("/ordersheet/{orderSheetNo}"));
		mav.addObject("result", paymentService.refund(orderSheetNo));
		
		return mav;
	}
}
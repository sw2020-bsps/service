package com.bsps.payment;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsps.beans.Beans;
import com.bsps.beans.BeansServiceImpl;
import com.bsps.cart.Product;
import com.bsps.member.Member;
import com.bsps.order.orderhistory.OrderHistory;
import com.bsps.order.orderhistory.OrderHistoryServiceImpl;
import com.bsps.order.ordersheet.OrderSheet;
import com.bsps.order.ordersheet.OrderSheetServiceImpl;
import com.bsps.payment.paymenthistory.PaymentHistory;
import com.bsps.payment.paymenthistory.PaymentHistoryServiceImpl;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private BeansServiceImpl beansService;
	@Autowired
	private OrderHistoryServiceImpl orderHistoryService;
	@Autowired
	private OrderSheetServiceImpl orderSheetService;
	@Autowired
	private PaymentHistoryServiceImpl payementHistoryService;
	@Autowired
	private HttpSession session;
	
	@Override
	public OrderSheet payment(Payment payment) {
		List<Product> productList = payment.getProductList();
		OrderSheet orderSheet = orderSheetService.registerOrderSheet(productList, payment);
		
		if(productList.get(0).getOrderType().equals("cart")) {
			session.removeAttribute("cart");
		}
		
		return orderSheet;
	}
	
	@Override
	public boolean refund(int orderSheetNo) {
		if (requestRefund(orderSheetNo)) {
			OrderSheet orderSheet = new OrderSheet();
			orderSheet.setOrderSheetNo((orderSheetNo));
			orderSheet.setCancleDate(new Date());
			orderSheet.setPaymentStatus('R');
			
			try {
				orderSheetService.modifyOrderSheet(orderSheet);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return true;
		}
		
		return false;
	}
	
	@Override
	public int requestPaymentInfo(String impUid) {
		String paymentURL = "https://api.iamport.kr/payments/" + impUid;
		String token = requestToken();
		
		BufferedReader bufferedReader = null;
		HttpURLConnection connection = null;
		int price = 0;
		
		try {
			String requestString = "";
			URL url = new URL(paymentURL);
			connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true); 				
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Authorization", token);
			connection.connect();
			
			StringBuilder stringBuilder = new StringBuilder(); 

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = null;  
				while ((line = bufferedReader.readLine()) != null) {  
					stringBuilder.append(line + "\n");  
				}
				requestString = stringBuilder.toString();
			}
			
			JsonParser jsonParser = new JsonParser();
			JsonElement jsonElement = jsonParser.parse(requestString);
			
			if(jsonElement.getAsJsonObject().get("code").getAsLong() == 0){
				JsonObject getToken = (JsonObject) jsonElement.getAsJsonObject().get("response");
				price = getToken.get("amount").getAsInt();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (bufferedReader != null) {
					bufferedReader.close();
				}
				
				if (connection != null) {
					connection.disconnect();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return price;
	}

	@Override
	public boolean requestRefund(int orderSheetNo) {
		String cancelPaymentURL = "https://api.iamport.kr/payments/cancel";
		String token = requestToken();
		
		JsonObject object = new JsonObject();
		object.addProperty("merchant_uid", orderSheetNo);
		 
		HttpURLConnection connection = null;
		BufferedReader br = null;
		
		try {
			URL url = new URL(cancelPaymentURL);
			connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setInstanceFollowRedirects(false);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Authorization", token);
			
			OutputStream out = connection.getOutputStream();
			out.write(object.toString().getBytes());
			connection.connect();
			
			StringBuilder sb = new StringBuilder(); 
			
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = null;  
				while ((line = br.readLine()) != null) {  
					sb.append(line + "\n");  
				}
			}
			out.flush();
			
			JsonParser jsonParser = new JsonParser();
			JsonElement jsonElement = jsonParser.parse(sb.toString());
			
			if(jsonElement.getAsJsonObject().get("code").getAsLong() == 0){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
					br.close();
				}
				
				if (connection != null) {
					connection.disconnect();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}
	
	@Override
	public String requestToken() {
		String tokenURL = "https://api.iamport.kr/users/getToken";
		
		JsonObject object = new JsonObject();
		object.addProperty("imp_key", "5715801001550969");
		object.addProperty("imp_secret", "z4RE8TzGGJeyKpELwaiy7WuF76uMvdM5iDKrxj8d2mMNLqziBRQJNkoVqSHW6t2p7MQE5YS8kEV65uoG");
		
		String token = null;
		BufferedReader bufferedReader = null;
		HttpURLConnection connection = null;
		
		try{
			String requestString = "";
			URL url = new URL(tokenURL);
			connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setInstanceFollowRedirects(false);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");
			
			OutputStream out = connection.getOutputStream();
			out.write(object.toString().getBytes());
			connection.connect();
			
			StringBuilder stringBuilder = new StringBuilder(); 
			
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = null;  
				while ((line = bufferedReader.readLine()) != null) {  
					stringBuilder.append(line + "\n");  
				}
				bufferedReader.close();
				requestString = stringBuilder.toString();
			}
			out.flush();
			
			JsonParser jsonParser = new JsonParser();
			JsonElement jsonElement = jsonParser.parse(requestString);
			
			if(jsonElement.getAsJsonObject().get("code").getAsLong() == 0){
				JsonObject getToken = (JsonObject) jsonElement.getAsJsonObject().get("response");
				token = getToken.get("access_token").getAsString();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				if (bufferedReader != null) {
					bufferedReader.close();
				}
				
				if (connection != null) {
					connection.disconnect();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return token;
	}
	
	@Override
	public boolean authPayment(boolean result, PaymentHistory paymentHistory) {
		if (result) {
			try {
				int paidAmount = requestPaymentInfo(paymentHistory.getImpUid());
				
				OrderSheet orderSheet = orderSheetService.searchOrderSheet(paymentHistory.getOrderSheetNo());   
				
				if (paidAmount == orderSheet.getOrderPrice()) {
					paymentHistory.setPaymentDate(new Date());
					payementHistoryService.registerPaymentHistory(paymentHistory);
					
					orderSheet.setPaymentStatus('Y');
					orderSheetService.modifyOrderSheet(orderSheet);
					
					decreaseStockWeight(orderSheet);
					
					return true;
				} else {
					orderHistoryService.deleteOrderHistory(paymentHistory.getOrderSheetNo());
					orderSheetService.deleteOrderSheet(paymentHistory.getOrderSheetNo());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return false;
		} else {
			orderHistoryService.deleteOrderHistory(paymentHistory.getOrderSheetNo());
			orderSheetService.deleteOrderSheet(paymentHistory.getOrderSheetNo());
			
			return false;
		}
	}
	
	private void decreaseStockWeight(OrderSheet orderSheet) {
		int orderSheetNo = orderSheet.getOrderSheetNo();
		
		try {
			List<OrderHistory> orderHistoryList = orderHistoryService.searchOrderHistory(orderSheetNo);
			List<Beans> beansList = new ArrayList<Beans>();
			
			Beans beans = new Beans();
			for (OrderHistory order : orderHistoryList) {
				beans.setBeansNo(order.getBeansNo());
				beansList.add(beansService.searchBeans(beans));
			}
			
			for (int i = 0; i < orderHistoryList.size(); i++) {
				beansList.get(i).setStockWeight(beansList.get(i).getStockWeight() - orderHistoryList.get(i).getWeight());
			}
			
			for (Beans bean : beansList) {
				beansService.modifyBeans(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean isCheckPayment(int orderSheetNo, Member member) {
		OrderSheet orderSheet = orderSheetService.searchOrderSheet(orderSheetNo);
		
		if (member.getEmailAddress().equals(orderSheet.getEmailAddress())) {
			return true;
		}
		
		return false;
	}
}

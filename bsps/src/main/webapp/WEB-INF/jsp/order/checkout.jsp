<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>
	<%@ include file="/WEB-INF/jsp/system/head.jsp" %>
    <body>
        <!-- lodaer  -->
        <%@ include file="/WEB-INF/jsp/layout/loader.jsp" %>
        <!-- loader end  -->
        <!-- main start  -->
        <div id="main">
            <!-- header  -->
            <%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
            <!--header end -->	
            <!-- wrapper  -->	
            <div id="wrapper">
                <!-- content  -->	
                <div class="content">
                    <!--  section  -->  
                    <section class="parallax-section hero-section hidden-section" data-scrollax-parent="true">
                        <div class="bg par-elem "  data-bg="${pageContext.request.contextPath}/images/bg/keyboard.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title">
                                <mbody>Bieup Cafe에서 즐거운 시간 되시길 바랍니다.</mbody>
                                <h2><hun>주문 및 결제</hun></h2>
                                <div class="dots-separator fl-wrap"><span></span></div>
                            </div>
                        </div>
                        <div class="hero-section-scroll">
                            <div class="mousey">
                                <div class="scroller"></div>
                            </div>
                        </div>
                        <div class="brush-dec"></div>
                    </section>
                    <!--  section  end--> 
                    <!--  section  -->   
                    <section class="hidden-section">
                        <div class="container">
                            <!-- CHECKOUT TABLE -->
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="check-out_wrap fl-wrap">
                                        <h4 class="cart-title"><hun>구매자 정보</hun></h4>
                                         <fieldset>
                                           	<table class="table table-border checkout-table">
                                           		<tbody>
                                           			<tr>
                                           				<td><han>이름</han></td>
                                           				<td><han>${sessionScope.member.name}</han></td>
                                           			</tr>
                                           			<tr>
                                           				<td><han>이메일</han></td>
                                           				<td><han>${sessionScope.member.emailAddress}</han></td>
                                           			</tr>
                                           			<tr>
                                           				<td><han>휴대폰 번호</han></td>
                                           				<td><han>${sessionScope.member.phoneNo}</han></td>
                                           			</tr>
                                           		</tbody>
                                           	</table>
                                           	<div class="clearfix"></div><br><br>
                                         </fieldset>
                                    </div>
                                    <div class="row">
                                    	<div class="custom-form">
                                    		<div class="check-out_wrap fl-wrap" style="width:300px; margin:10px;">
	                                    		<h4 class="cart-title" style="float:left; margin-left:10px;"><hun>배송지 주소</hun></h4>
		                                        <div style="float: right; float:top;">
		                                       		<button class="btn color-bg" style="margin:0px; padding:8px 10px 8px 25px" 
		                                       			type="button" onclick="searchZipcode()">
		                                               	<hun>주소 검색</hun><i class="fal fa-long-arrow-right"></i>
		                                           	</button>
		                                      	</div>
	                                    	</div>
	                                    	<div class="check-out_wrap fl-wrap">
												<div class="col-sm-6" style="width:150px;">
													<input type="text" id="zipCode" name="zipCode" value="${sessionScope.member.zipCode}"
													 	readonly onblur="this.placeholder='우편번호'" minlength="5" maxlength="5">
												</div>
												<div class="col-sm-6" style="width:500px;">
													<input type="text" id="address" name="address" value="${sessionScope.member.address}"
													 	maxlength="300" readonly onblur="this.placeholder='주소'">
												</div>
												<div class="col-sm-6" style="width:650px;">
													<input type="text" id="detailAddress" name="detailAddress" value="${sessionScope.member.detailAddress}"
														placeholder="상세주소를 입력하세요." maxlength="250" 
														onfocus="this.placeholder=''" onblur="this.placeholder='상세주소를 입력하세요.'">
												</div>
												<div class="col-sm-6">
													<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1; -webkit-overflow-scrolling:touch;">
														<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer"
															 style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1"
															 onclick="closeDaumPostcode()" alt="닫기 버튼">
													</div>
												</div>
	                                       		<div class="clearfix"></div><br><br>
	                                    	</div>
                                    	</div>
                                    </div>
                                    <div class="check-out_wrap fl-wrap">
                                        <h4 class="cart-title"><hun>주문 원두</hun></h4>
                                        <fieldset>
                                          	<table class="table table-border checkout-table">
                                          		<tbody>
                                  					<c:if test="${productList ne null}">
                                  						<tr>
                                      						<th>원두 이름</th>
                                      						<th>무게</th>
                                      						<th>가격</th>
                                      					</tr>
                                      					<c:forEach items="${productList}" var="product">
	                                          				<tr>
	                                          					<td>${product.name}</td>
	                                          					<c:choose>
	                                          						<c:when test="${product.selectWeight eq 1000}">
			                                          					<td>1kg</td>
	                                          						</c:when>
	                                          						<c:otherwise>
	                                          							<td>${product.selectWeight}g</td>
	                                          						</c:otherwise>
	                                          					</c:choose>
	                                          					<td><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</td>
	                                          					
	                                          				</tr>
	                                          			</c:forEach>
                                      				</c:if>
                                          		</tbody>
                                          	</table>
                                            <div class="clearfix"></div>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <!-- CART TOTALS  -->
                                    <div class="cart-totals dark-bg fl-wrap">
                                        <h3><hun>결제 금액</hun></h3>
                                        <table class="total-table">
                                            <tbody>
                                                <tr>
                                                    <th><hun style="font-size:15px;">결제 금액 :</hun></th>
                                                    <td><hun style="font-size:20px; color:white;"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</hun></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <button class="btn color-bg" onclick="payment()"><han>결제하기</han><i class="fal fa-long-arrow-right"></i></button>
                                    </div>
                                    <!-- /CART TOTALS  -->                              
                                </div>
                            </div>
                            <!-- /CHECKOUT TABLE -->
                        </div>
                        <div class="section-bg">
                            <div class="bg"  data-bg="images/bg/dec/section-bg.png"></div>
                        </div>
                    </section>
                    <!--  section end  -->  
                    <div class="brush-dec2 brush-dec_bottom"></div>
                </div>
                <!-- content end  -->
                <%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>                                
            </div>
            <!-- wrapper end -->
            <%@ include file="/WEB-INF/jsp/common/login.jsp" %>
        	<%@ include file="/WEB-INF/jsp/system/cursor.jsp" %>                                                     
        </div>
        <!-- Main end -->
        <%@ include file="/WEB-INF/jsp/system/script.jsp" %>
        <!-- iamport.payment.js -->
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<script>
			//결제 서비스 (서버 DB에 결제정보 저장)
			function payment() {
				var ojectArray = new Array();
				
				<c:forEach items="${productList}" var="product">
					var object = {
							beansNo : ${product.beansNo},
							categoryNo : ${product.categoryNo},
							pictureNo : ${product.pictureNo},
							name : "${product.name}",
							stockWeight : ${product.stockWeight},
							selectWeight : ${product.selectWeight},
							beansPrice : ${product.beansPrice},
							price : ${product.price},
							orderType : "${product.orderType}"
					}
					ojectArray.push(object);
				</c:forEach>
				
				var dataMap = {
						name : "${sessionScope.member.name}",
						emailAddress : "${sessionScope.member.emailAddress}",
						phoneNo : "${sessionScope.member.phoneNo}",
						zipCode : document.getElementById('zipCode').value,
						address : document.getElementById('address').value,
						detailAddress : document.getElementById('detailAddress').value,
						totalPrice : ${totalPrice},
						productList : ojectArray
					}
				
				var jsonString = JSON.stringify(dataMap);
				
				var xhr = new XMLHttpRequest();
				
				xhr.onreadystatechange = function() {
					if (xhr.readyState === xhr.DONE) {
						if (xhr.status === 200 || xhr.status === 201) {
							var orderSheet = JSON.parse(xhr.responseText);
							
							importPayment(orderSheet);
						} else {
							
						}
					}
				};
				xhr.open("POST", "/payment", true);
				xhr.setRequestHeader("Content-type", "application/json");
				xhr.send(jsonString);
			}
			
			//아임포트 결제 서비스
			function importPayment(orderSheet) {
				var IMP = window.IMP;
				IMP.init('imp51686470');
				IMP.request_pay({
					pg: 'inicis',
					pay_method: 'card',
					merchant_uid: orderSheet.orderSheetNo,
					name: '${orderName}',
					amount: orderSheet.orderPrice,
					buyer_email: orderSheet.emailAddress,
					buyer_name: '${sessionScope.member.name}',
					buyer_tel: '${sessionScope.member.phoneNo}',
					buyer_addr: orderSheet.address,
					buyer_postcode: orderSheet.zipCode
				}, function(rsp) {
					if (rsp.success) {
						var xhr = new XMLHttpRequest();
						
						var data = {
							orderSheetNo: orderSheet.orderSheetNo,
							impUid: rsp.imp_uid,
							paymentPrice: rsp.paid_amount	
						};
						
						xhr.onreadystatechange = function () {
							if (xhr.readyState === XMLHttpRequest.DONE) {
								if (xhr.status === 200 || xhr.status === 201) {
										if (xhr.responseText == 'true') {
											location.href='/payment/result/' + orderSheet.orderSheetNo;
										} else {
											location.href='/payment/result';
										}
									} else {
											location.href='/payment/result';
									}
								}
							}
						xhr.open('POST', 'http://localhost/payment/true', true);
						xhr.setRequestHeader("Content-type", "application/json");
						xhr.send(JSON.stringify(data));
					} else {
						var xhr = new XMLHttpRequest();
						
						var data = {
							orderSheetNo: orderSheet.orderSheetNo
						}
						
						xhr.onreadystatechange = function () {
							if (xhr.readyState === XMLHttpRequest.DONE) {
								if (xhr.status === 200 || xhr.status === 201) {
									location.href='/payment/result';
								}
							}
						}
						xhr.open('POST', 'http://localhost/payment/false', true);
						xhr.setRequestHeader("Content-type", "application/json");
						xhr.send(JSON.stringify(data));
					}
				});
			}
			
			//주소 찾기 서비스
			var element_layer = document.getElementById('layer');
			
		    function closeDaumPostcode() {
		        element_layer.style.display = 'none';
		    }
		
		    function searchZipcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var address = '';
		                var extraAddress = '';
		
		                if ('R' === data.userSelectedType) {
		                	address = data.roadAddress;
		                } else {
		                	address = data.jibunAddress;
		                }
		
		                if('R' === data.userSelectedType){
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    	extraAddress += data.bname;
		                    }
		                    if('' !== data.buildingName && 'Y' === data.apartment){
		                    	extraAddress += (extraAddress !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    if('' !== extraAddress){
		                    	extraAddress = ' (' + extraAddress + ')';
		                    }
		                    document.getElementById("address").value = address + "" + extraAddress;
		                } else {
		                    document.getElementById("address").value = address;
		                }
		                document.getElementById('zipCode').value = data.zonecode;
		                document.getElementById("detailAddress").focus();
		                element_layer.style.display = 'none';
		            },
		            width : '100%',
		            height : '100%',
		            maxSuggestItems : 5
		        }).embed(element_layer);
		        element_layer.style.display = 'block';
		        initLayerPosition();
		    }
	
		    function initLayerPosition(){
		        var width = 300;
		        var height = 400;
		        var borderWidth = 5;
		
		        element_layer.style.width = width + 'px';
		        element_layer.style.height = height + 'px';
		        element_layer.style.border = borderWidth + 'px solid';
		        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
		        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		    }
		</script>
    </body>
</html>
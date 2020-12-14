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
                        <div class="bg par-elem "  data-bg="${pageContext.request.contextPath}/images/bg/coffee2.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title">
                                <mbody>Bieup Cafe에서 즐거운 시간 되시길 바랍니다.</mbody>
                                <h2><hun>주문 상세</hun></h2>
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
                            	<c:choose>
                            		<c:when test="${sessionScope.member.emailAddress eq orderSheet.emailAddress}">
                            			<div class="col-md-12">
		                                    <div class="check-out_wrap fl-wrap" style="margin-bottom:50px;">
		                                    	<div class="row">
			                                    	<h4 class="cart-title" style="float: left; margin-left:10px;"><hun>주문일 : <fmt:formatDate value="${orderSheet.orderDate}" pattern="yyyy년 MM월 dd일"/> | 주문번호 : ${orderSheet.orderSheetNo}</hun></h4>
			                                    	<div class="qty_btn" style="float: right; margin-bottom:20px;">
														<c:if test="${orderSheet.paymentStatus == 'Y'}">
															<form action="/payment/${orderSheet.orderSheetNo}" method="post" id="canclePayment">
																<input type="hidden" name="_method" value="delete"/>
															</form>
															<button class="btn" style="width:130px; height:40px; padding:0px;" onclick="canclePayment()"><han>환불</han><i class="fal fa-long-arrow-right"></i></button>
														</c:if>
			                                    	</div>
			                                    	<div class="qty_btn" style="float: right;margin-bottom:20px;">
			                                   			<form action="/ordersheet/${orderSheet.orderSheetNo}" method="post" id="deleteOrderSheet">
															<input type="hidden" name="_method" value="delete"/>
															<button class="btn" style="width:200px; height:40px; padding:0px;" onclick="deletOrderSheet()"><han>주문내역 삭제</han><i class="fal fa-long-arrow-right"></i></button>
														</form>
			                                    	</div>
		                                    	</div>
	                                    		<table class="table table-border checkout-table">
	                                    			<tbody>
	                                    				<tr style="height:35px; vertical-align: middle;">
	                                    					<th style="padding:0px; vertical-align: middle; background:#363636;"></th>
	                                    					<th style="padding:0px; vertical-align: middle; background:#363636;">원두 이름</th>
	                                    					<th style="padding:0px; vertical-align: middle; background:#363636;">구매 무게</th>
	                                    					<th style="padding:0px; vertical-align: middle; background:#363636;">결제 가격</th>
	                                    					<th style="padding:0px; vertical-align: middle; background:#363636;">결제 상태</th>
	                                    				</tr>
                                    					<c:forEach var="i" begin="0" end="${orderHistoryList.size() - 1}" varStatus="status">
		                                    				<tr>
		                                    					<td style="width:200px;"><a href="/beans/${orderHistoryList.get(i).beansNo}"><img src="${pageContext.request.contextPath}/beans/picture/${pictureList.get(i)}" class="respimg" style="width:170px; hieght:170px;"></a></td>
		                                    					<td style="width:500px;">${orderHistoryList.get(i).beansName}</td>
		                                    					<c:choose>
		                                    						<c:when test="${orderHistoryList.get(i).weight eq 1000}">
		                                    							<td style="width:200px;">1kg</td>
		                                    						</c:when>
		                                    						<c:otherwise>
				                                    					<td style="width:200px;">${orderHistoryList.get(i).weight}g</td>
		                                    						</c:otherwise>
		                                    					</c:choose>
		                                    					<td style="width:200px;"><fmt:formatNumber value="${orderHistoryList.get(i).price}" pattern="#,###"/>원</td>
		                                    					<c:if test="${status.first}">
		                            								<c:choose>
		                            									<c:when test="${orderSheet.paymentStatus eq 'Y'}">
		                            										<td rowspan="${orderHistoryList.size()}" style="width: 10%; vertical-align: middle;"><h6 style="font-size:15px;"><hun>결제 완료</hun></h6></td>
		                            									</c:when>
		                            									<c:when test="${orderSheet.paymentStatus eq 'R'}">
		                            										<td rowspan="${orderHistoryList.size()}" style="width: 10%; vertical-align: middle;"><h6 style="font-size:15px;"><hun>환불 완료</hun></h6></td>
		                            									</c:when>
		                            								</c:choose>
	                            								</c:if>
		                                    				</tr>
				                                    	</c:forEach>
	                                    			</tbody>
	                                    		</table>
		                                    </div>
		                                    <div class="check-out_wrap fl-wrap" style="margin-bottom:50px;">
		                                    	<h4 class="cart-title" style="margin-bottom:5px;"><hun>주문자 정보</hun></h4>
		                                   		<table class="table table-border checkout-table">
		                                   			<tbody>
		                                   				<tr>
		                                   					<td style="width:300px;"><han>이름</han></td>
		                                   					<td><han>${sessionScope.member.name}</han></td>
		                                   				</tr>
		                                   				<tr>
		                                   					<td style="width:300px;"><han>연락처</han></td>
		                                   					<td><han>${sessionScope.member.phoneNo}</han></td>
		                                   				</tr>
		                                   				<tr>
		                                   					<td style="width:300px;"><han>배송지</han></td>
		                                   					<td><han>${orderSheet.address} ${orderSheet.detailAddress}</han></td>
		                                   				</tr>
		                                   			</tbody>
		                                   		</table>
		                                    </div>
		                                    <div class="check-out_wrap fl-wrap" style="margin-bottom:50px;">
		                                    	<h4 class="cart-title" style="margin-bottom:5px;"><hun>결제 정보</hun></h4>
		                                   		<table class="table table-border checkout-table">
		                                   			<tbody>
		                                   				<tr>
		                                   					<td style="width:300px;"><han>결제 날짜</han></td>
		                                   					<td><han><fmt:formatDate value="${paymentHistory.paymentDate}" pattern="yyyy년 MM월 dd일"/></han></td>
		                                   				</tr>
		                                   				<tr>
		                                   					<td style="width:300px;"><han>결제 금액</han></td>
		                                   					<td><han><fmt:formatNumber value="${paymentHistory.paymentPrice}" pattern="#,###"/>원</han></td>
		                                   				</tr>
		                                   			</tbody>
		                                   		</table>
		                                    </div>
		                                    <c:if test="${orderSheet.paymentStatus eq 'R'}">
		                                    	<div class="check-out_wrap fl-wrap" style="margin-bottom:50px;">
			                                    	<h4 class="cart-title" style="margin-bottom:5px;"><hun>환불 정보</hun></h4>
			                                   		<table class="table table-border checkout-table">
			                                   			<tbody>
			                                   				<tr>
			                                   					<td style="width:300px;"><han>환불 날짜</han></td>
			                                   					<td><han><fmt:formatDate value="${orderSheet.orderDate}" pattern="yyyy년 MM월 dd일"/></han></td>
			                                   				</tr>
			                                   				<tr>
			                                   					<td style="width:300px;"><han>환불 금액</han></td>
			                                   					<td><han><fmt:formatNumber value="${paymentHistory.paymentPrice}" pattern="#,###"/>원</han></td>
			                                   				</tr>
			                                   			</tbody>
			                                   		</table>
			                                    </div>
		                                    </c:if>
		                                    <div class="shop-item-footer fl-wrap">
		                                    	<div class="qty_btn" style="float: right;">
		                                    		<button class="btn" onclick="location.href='/ordersheet';"><han>주문목록</han><i class="fal fa-long-arrow-right"></i></button>
		                                    	</div>
		                                    </div>
		                                </div>
                            		</c:when>
                            		<c:otherwise>
                            			<div class="container">
				                            <div class="section-title"><br><br>
				                            	<hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-bottom: 27px; margin-left: auto; margin-right: auto;">
												<han style="font-size:18px; color: white;">주문서 정보가 존재하지 않습니다.</han>
				                                <hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-top: 27px; margin-left: auto; margin-right: auto;">
				                                <button type="button" class="btn color-bg" style="margin-top: 29px;" onclick="location.href='/main';"><hun>돌아가기</hun><i class="fal fa-long-arrow-right"></i></button>
				                            </div>
				                        </div>
                            		</c:otherwise>
                            	</c:choose>
                                <div class="col-md-4"></div>
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
        
        <script>
        	function canclePayment() {
        		document.getElementById("canclePayment").submit();
        	}
        </script>
        <script>
        	function deletOrderSheet() {
        		document.getElementById("deletOrderSheet").submit();
        	}
        </script>
    </body>
</html>
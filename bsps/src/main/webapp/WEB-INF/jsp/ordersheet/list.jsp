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
                        <div class="bg par-elem "  data-bg="${pageContext.request.contextPath}/images/bg/snap.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title">
                                <mbody>Bieup Cafe에서 즐거운 시간 되시길 바랍니다.</mbody>
                                <h2><hun>주문 목록</hun></h2>
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
                        <div class="container" style="text-align:center;">
                            <!-- ORDERSHEET TABLE -->
                            <div class="row" style="text-align:center;">
                            	<div class="col-md-12">
                            	<c:choose>
                            		<c:when test="${orderSheetList.size() ne 0}">
                            			<c:forEach items="${orderSheetList}" var="orderSheet">
			                            	<c:if test="${(sessionScope.member.emailAddress == orderSheet.emailAddress) && (orderSheet.paymentStatus == 'Y' || orderSheet.paymentStatus =='R') && orderSheet.displayStatus eq 'Y'}">
			                            		<div class="check-out_wrap fl-wrap">
			                            			<div class="shop-item-footer fl-wrap" style="margin-bottom:0px; padding-bottom: 0em;">
			                            				<div class="qty_btn" style="float: left; margin-bottom:0px;">
					                            			<h2><han><fmt:formatDate value="${orderSheet.orderDate}" pattern="yyyy-MM-dd"/></han></h2>
			                            				</div>
			                            				<div class="qty_btn" style="float: right;">
			                            					<a href="/ordersheet/${orderSheet.orderSheetNo}"><han>상세보기 > </han></a>
			                            				</div>
			                            			</div>
			                            			<table class="table table-border checkout-table" style="border:1px solid rgba(255,255,255,0.08);">
			                            				<tbody>
			                            					<tr style="height:35px; vertical-align: middle;">
			                            						<th style="padding:0px; vertical-align: middle; background:#363636;"></th>
			                            						<th style="padding:0px; vertical-align: middle; background:#363636;">원두 이름</th>
			                            						<th style="padding:0px; vertical-align: middle; background:#363636;">구매 무게</th>
			                            						<th style="padding:0px; vertical-align: middle; background:#363636;">결제 가격</th>
			                            						<th style="padding:0px; vertical-align: middle; background:#363636;">결제 상태</th>
			                            					</tr>
			                            					<c:forEach items="${orderSheetProductList}" var="productList">
			                            						<c:forEach items="${productList}" var="product" varStatus="status">
			                            							<c:if test="${orderSheet.orderSheetNo eq product.orderSheetNo}">
					                            						<tr>
				                            								<td style="width :15%;">
				                            									<div style="width: 100%; text-align: center">
				                            										<a href="/beans/${product.beansNo}"><img src="${pageContext.request.contextPath}/beans/picture/${product.pictureNo}" class="respimg"></a>
				                            									</div>
				                            								</td>
				                            								<td style="width: 40%;"><h6 style="font-size:15px;">${product.name}</h6></td>
				                            								<c:choose>
				                            									<c:when test="${product.selectWeight eq 1000}">
						                            								<td style="width: 10%;"><h6 style="font-size:15px;">1kg</h6></td>
				                            									</c:when>
				                            									<c:otherwise>
				                            										<td style="width: 10%;"><h6 style="font-size:15px;">${product.selectWeight}g</h6></td>
				                            									</c:otherwise>
				                            								</c:choose>
				                            								<td style="width: 10%; background:#212121;"><h6 style="font-size:15px;"><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</h6></td>
				                            								<c:if test="${status.first}">
					                            								<c:choose>
					                            									<c:when test="${orderSheet.paymentStatus eq 'Y'}">
					                            										<td rowspan="${productList.size()}" style="width: 10%; vertical-align: middle;"><h6 style="font-size:15px;"><hun>결제 완료</hun></h6></td>
					                            									</c:when>
					                            									<c:when test="${orderSheet.paymentStatus eq 'R'}">
					                            										<td rowspan="${productList.size()}" style="width: 10%; vertical-align: middle;"><h6 style="font-size:15px;"><hun>환불 완료</hun></h6></td>
					                            									</c:when>
					                            								</c:choose>
				                            								</c:if>
			                            								</tr>
			                            							</c:if>
			                            						</c:forEach>
			                            					</c:forEach>
			                            				</tbody>
			                            			</table>
			                            		</div>
			                            	</c:if>
		                            	</c:forEach>
                            		</c:when>
                            		<c:otherwise>
                  						<div class="container">
				                            <div class="section-title"><br><br>
				                            	<hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-bottom: 27px; margin-left: auto; margin-right: auto;">
												<han style="font-size:18px; color: white;">주문 목록이 존재하지 않습니다.</han>
				                                <hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-top: 27px; margin-left: auto; margin-right: auto;">
				                                <button type="button" class="btn color-bg" style="margin-top: 29px;" onclick="location.href='/member/${sessionScope.member.emailAddress}';"><hun>돌아가기</hun><i class="fal fa-long-arrow-right"></i></button>
				                            </div>
				                        </div>
                            		</c:otherwise>
                            	</c:choose>
                            	</div>
                            </div>
                            <!-- /ORDERSHEET TABLE -->
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
    </body>
</html>
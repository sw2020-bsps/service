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
                        <div class="bg par-elem "  data-bg="${pageContext.request.contextPath}/images/bg/plate.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title">
                                <mbody>Bieup Cafe에서 즐거운 시간 되시길 바랍니다.</mbody>
                                <h2><hun>결제 정보</hun></h2>
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
                            <c:choose>
                            	<c:when test="${status}">
                            		<div class="row">
		                                <div class="col-md-12">
		                                    <div class="check-out_wrap fl-wrap">
		                                        <h4 class="cart-title"><hun>주문완료</hun></h4>
		                                        <table class="table table-border checkout-table">
			                                  		<tbody>
			                                  			<tr>
			                                  				<th><han>원두명</han></th>
			                                  				<th><han>수량</han></th>
			                                  				<th><han>가격</han></th>
			                                  			</tr>
			                                  			<c:forEach items="${orderHistoryList}" var="product">
	                                          				<tr>
	                                          					<td>${product.beansName}</td>
	                                          					<c:choose>
	                                          						<c:when test="${product.weight eq 1000}">
	                                          							<td>1kg</td>
	                                          						</c:when>
	                                          						<c:otherwise>
	                                          							<td>${product.weight}g</td>
	                                          						</c:otherwise>
	                                          					</c:choose>
	                                          					<td><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</td>
	                                          				</tr>
	                                          			</c:forEach>
			                                  		</tbody>
			                                  	</table>
			                                  	<div class="clearfix"></div><br><br>
		                                    </div>
		                                    <div class="check-out_wrap fl-wrap">
		                                        <h4 class="cart-title"><hun>결제 정보</hun></h4>
		                                        <table class="table table-border checkout-table">
			                                  		<tbody>
		                                   				<tr>
		                                   					<td><han>결제날짜</han></td>
		                                   					<td><fmt:formatDate value="${paymentHistory.paymentDate}" pattern="yyyy년 MM월 dd일"/></td>
		                                   				</tr>
		                                   				<tr>
		                                   					<td><han>결제금액</han></td>
		                                   					<td><fmt:formatNumber value="${paymentHistory.paymentPrice}" pattern="#,###"/>원</td>
		                                   				</tr>
			                                  		</tbody>
			                                  	</table>
		                                    </div>
		                                </div>
		                            </div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="container">
				                            <div class="section-title"><br><br>
				                            	<hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-bottom: 27px; margin-left: auto; margin-right: auto;">
												<han style="font-size:18px; color: white;">주문에 실패하였습니다.</han>
				                                <hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-top: 27px; margin-left: auto; margin-right: auto;">
				                                <button type="button" class="btn color-bg" style="margin-top: 29px;" onclick="location.href='/main';"><hun>돌아가기</hun><i class="fal fa-long-arrow-right"></i></button>
				                            </div>
				                        </div>
                            	</c:otherwise>
                            </c:choose>
                            <!-- /CHECKOUT TABLE -->
                            <div class="shop-item-footer fl-wrap">
		                       	<div class="qty_btn" style="float: right;">
		                   			<button class="btn" onclick="location.href='/ordersheet';"><han>주문목록</han><i class="fal fa-long-arrow-right"></i></button>
		                       	</div>
		                       	<div class="qty_btn" style="float: right;">
		                   			<button class="btn" onclick="location.href='/beans';"><han>원두목록</han><i class="fal fa-long-arrow-right"></i></button>
		                       	</div>
                       		</div>
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
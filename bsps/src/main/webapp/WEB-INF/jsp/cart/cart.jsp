<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>
    <%@ include file="/WEB-INF/jsp/system/head.jsp" %>
    <body>
    	<!-- lodaer -->
    	<%@ include file="/WEB-INF/jsp/layout/loader.jsp" %>
    	<!-- loader end -->
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
                        <div class="bg par-elem "  data-bg="${pageContext.request.contextPath}/images/bg/basket1.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title">
                                <mbody>Bieup Beans Shop에서 즐거운 시간 되시길 바랍니다.</mbody>
                                <h2><hun>장바구니</hun></h2>
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
                                    <h4 class="cart-title"><hun>내 장바구니</hun>
                                    	<c:if test="${not empty sessionScope.cart.size()}">
                                    		<span><hun>${sessionScope.cart.size()}개</hun></span>
                                    	</c:if>
                                    </h4>
                                    <c:choose>
                                    	<c:when test="${not empty productList && not empty productList.size()}">
	                                    	<table class="table table-border checkout-table">
		                                        <tbody>
		                                        	<tr>
		                                        		<th></th>
		                                        		<th>원두 이름</th>
		                                        		<th>원두 가격</th>
		                                        		<th>구매 무게</th>
		                                        		<th>구매 가격</th>
		                                        		<th></th>
		                                        	</tr>
		                                            <c:forEach items="${productList}" var="product">
		                                            	<tr>
			                                                <td class="hidden-xs">
			                                                	<!-- 원두 사진 추가 -->
			                                                    <a href="/beans/${product.beansNo}"><img src="${pageContext.request.contextPath}/beans/picture/${product.pictureNo}" class="respimg"></a>
			                                                </td>
			                                                <td>
			                                                    <h5 class="product-name">${product.name}</h5>
			                                                </td>
			                                                <td class="hidden-xs">
			                                                    <h3><hun><fmt:formatNumber value="${product.beansPrice}" pattern="#,###"/>원</hun></h3>
			                                                </td>
			                                                <td>
				                                                <form action="/cart" method="post" id="${product.beansNo}">
																	<input type="hidden" name="_method" value="put"/>
																	<input type="hidden" name="beansNo" value="${product.beansNo}"/>
																	<input type="hidden" name="pictureNo" value="${product.pictureNo}"/>
																	<input type="hidden" name="name" value="${product.name}"/>
																	<input type="hidden" name="beansPrice" value="${product.beansPrice}"/>
																	<input type="hidden" name="stockWeight" value="${product.stockWeight}"/>
																	
																	<select class="beans-price" name="selectWeight" id="${product.beansNo}${product.categoryNo}" onchange="checkStock(${product.stockWeight}, ${product.beansNo}, ${product.beansNo}${product.categoryNo})">
																		<c:forEach var="i" begin="100" end="1000" step="100">
																			<c:choose>
																				<c:when test="${product.selectWeight eq i}">
																					<c:choose>
																						<c:when test="${product.selectWeight eq 1000}">
																							<option value="${i}" selected><c:out value="1"/>kg</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${i}" selected><c:out value="${i}"/>g</option>
																						</c:otherwise>
																					</c:choose>
																				</c:when>
																				<c:otherwise>
																					<c:choose>
																						<c:when test="${i eq 1000}">
																							<option value="${i}"><c:out value="1"/>kg</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${i}"><c:out value="${i}"/>g</option>
																						</c:otherwise>
																					</c:choose>
																					
																				</c:otherwise>
																			</c:choose>
																		</c:forEach>
																	</select>
																</form>
			                                                </td>
			                                                <td>
			                                                    <h3><hun><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</hun></h3>
			                                                </td>
			                                                <td class="pr-remove">
			                                                	<form action="/cart" method="post" name="rm${product.beansNo}">
			                                                		<input type="hidden" name="_method" value="delete"/>
																	<input type="hidden" name="beansNo" value="${product.beansNo}"/>
				                                                    <a href="javascript:rm${product.beansNo}.submit();" title="Remove"><i class="fal fa-times"></i></a>
			                                                	</form>
			                                                </td>
			                                            </tr>
		                                            </c:forEach>
		                                        </tbody>
		                                    </table>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<div class="container">
					                            <div class="section-title"><br><br>
					                            	<hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-bottom: 27px; margin-left: auto; margin-right: auto;">
													<han style="font-size:18px; color: white;">장바구니가 비어있습니다.</han>
					                                <hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-top: 27px; margin-left: auto; margin-right: auto;">
					                                <button type="button" class="btn color-bg" style="margin-top: 29px;" onclick="location.href='/main';"><hun>돌아가기</hun><i class="fal fa-long-arrow-right"></i></button>
					                            </div>
					                        </div>
	                                    </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-md-4">
                                    <!-- CART TOTALS  -->
                                    <div class="cart-totals dark-bg fl-wrap">
                                        <h3><hun>장바구니 총 가격</hun></h3>
                                        <table class="total-table">
                                            <tbody>
                                                <tr>
                                                    <th><hun style="font-size:15px;">총 주문 가격 :</hun></th>
                                                    <td><hun style="font-size:20px; color:white;"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</hun></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <c:if test="${not empty productList && not empty productList.size()}">
                                        	<form action="/order/cart" method="post">
		                                        <button type="submit" class="cart-totals_btn color-bg"><hun>구매하기</hun></button>
	                                        </form>
                                        </c:if>
                                    </div>
                                    <!-- /CART TOTALS  -->
                                </div>
                            </div>
                            <!-- /CHECKOUT TABLE -->
                        </div>
                        <div class="section-bg">
                            <div class="bg"  data-bg="${pageContext.request.contextPath}/images/bg/dec/section-bg.png"></div>
                        </div>
                    </section>
                    <!--  section end  -->
                    <div class="brush-dec2 brush-dec_bottom"></div>
                </div>
                <!-- content end  -->
                <%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>
            </div>
            <!-- wrapper end -->
        	<%@ include file="/WEB-INF/jsp/system/cursor.jsp" %>
        </div>
        <!-- Main end -->
        <%@ include file="/WEB-INF/jsp/system/script.jsp" %>
        <script>
			function checkStock(stockWeight, beansNo, beansNoCategoryNo) {
				var select = '#' + beansNoCategoryNo + ' option:selected';
				
				if (stockWeight >= Number($(select).val())) {
					document.getElementById(beansNo).submit();
				} else {
					alert("재고량이 부족합니다.");
				}
			}
		</script>
    </body>
</html>
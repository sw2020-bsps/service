<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
    <%@ include file="/WEB-INF/jsp/system/head.jsp" %>
    <body>
        <%@ include file="/WEB-INF/jsp/layout/loader.jsp" %>
        <!-- main start  -->
        <div id="main">
            <%@ include file="/WEB-INF/jsp/layout/header.jsp" %>	
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
                                <h2><hun>원두 상세 조회</hun></h2>
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
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="fl-wrap post-container">
                                        <!-- post -->
                                        <div class="post fl-wrap fw-post">
                                            <div class="shop-header-title fl-wrap">
                                                <h2 style="font-family:'Malgun Gothic', cursive;">${beans.name}</h2>
                                                <div class="pr-tags fl-wrap" style="margin-top:10px;">
                                                    <span style="font-family:'Malgun Gothic', cursive;">카테고리 : </span>
                                                    <ul>
                                                        <li><a href="#"><hun>${category.categoryName}</hun></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- blog media -->
                                            <div class="blog-media fl-wrap">
                                                <div class="single-slider-wrap">
                                                    <div class="product-slider fl-wrap">
	                                                    <div class="swiper-wrapper lightgallery">
	                                                        <div class="swiper-slide hov_zoom"><img src="${pageContext.request.contextPath}/beans/picture/${beans.pictureNo}">
	                                                        	<a href="${pageContext.request.contextPath}/beans/picture/${beans.pictureNo}" class="box-media-zoom   popup-image"><i class="fal fa-search"></i></a>
	                                                        </div>
	                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- blog media end -->
                                            <div class="blog-text fl-wrap">
	                                            <div class="shop-header-title_opt">
                                                    <ul>
                                                        <li>
	                                                        <span class="menu-single-preice" style="font-family:'Malgun Gothic', cursive; font-size:25px;">가격 : 
		                                                        <strong style="font-family:'Malgun Gothic', cursive;font-size: 25px;">${beans.price} 원</strong>
	                                                        </span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="shop-header-title_opt">
                                            	<p style="text-align:left;">${beans.description}</p>
                                            </div>
                                            <div class="shop-item-footer fl-wrap">
                                                <div class="qty_btn">
                                                    <form action="${pageContext.request.contextPath}/order/direct" method="post" id="direct">
														<input type="hidden" name="beansNo" value="${beans.beansNo}" />
														<input type="hidden" name="categoryNo" value="${beans.categoryNo}" />
														<input type="hidden" name="name" value="${beans.name}" />
														<input type="hidden" name="beansPrice" value="${beans.price}" />
														<input type="hidden" name="pictureNo" value="${beans.pictureNo}" />
														<input type="hidden" name="stockWeight" value="${beans.stockWeight}" />
														<input type="hidden" name="orderType" value="direct" />
														<select name="selectWeight" id="selectWeight" class="beans-select">
															<option value="100">100g</option>
															<option value="200">200g</option>
															<option value="300">300g</option>
															<option value="400">400g</option>
															<option value="500">500g</option>
															<option value="600">600g</option>
															<option value="700">700g</option>
															<option value="800">800g</option>
															<option value="900">900g</option>
															<option value="1000">1kg</option>
														</select>
													</form>
                                                </div>
                                                <div class="qty_btn">
                                                	<button class="btn" style="margin-top:0px; margin-right:5px;" onclick="checkStock()"><han>주문하기</han><i class="fal fa-long-arrow-right"></i></button>
                                                </div>
                                                <div class="qty_btn">
	                                                    <button class="btn" onclick="addToCart()"><han>장바구니 담기</han><i class="fal fa-long-arrow-right"></i></button>
                                                    <c:if test="${sessionScope.member ne null && sessionScope.member.type eq 'A'}">
	                                                	<button class="btn" onclick="location.href='/beans/${beans.beansNo}/form';"><han>원두 정보 수정</han><i class="fal fa-long-arrow-right"></i></button>
                                                    </c:if>
                                                </div>
                                                <c:if test="${sessionScope.member.type eq 'A'}">
	                                                <div class="qty_btn">
	                                                	<form class="custom-form" action="/beans" method="POST" autocomplete="off">
	                                                    	
	                                                    	<!-- <button class="btn" type="submit"><han>원두 판매 중지</han><i class="fal fa-long-arrow-right"></i></button> -->
	                                                		<input type="hidden" name="_method" value="DELETE">
															<input type="hidden" name="beansNo" value="${beans.beansNo}">
	                                                	</form>
	                                                </div>
							                	</c:if>
                                            </div>
                                        </div>
                                        <!-- post end-->                                                              
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="bold-separator bold-separator_dark"><span></span></div>
                                    <div class="clearfix"></div>
                                    <div><a href="${pageContext.request.contextPath}/beans" class="btn  shop-btn"><han>계속 쇼핑하기 </han><i class="fal fa-long-arrow-right"></i></a></div>  																		
                                </div> 
                            </div>
                            <div class="fl-wrap limit-box"></div>
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
			function checkStock() {
				if (${beans.stockWeight} >= Number($('#selectWeight option:selected').val())) {
					document.getElementById('direct').submit();
				} else {
					alert("재고량이 부족합니다.");
				}
			}
		</script>
		<script>
		    function addToCart() {
		    	if (${sessionScope.member != null}) {
		    		if (${beans.stockWeight} >= Number($('#selectWeight option:selected').val())) {
			    		$.ajax({
				    		method : 'post',
				    		url : 'http://localhost/cart',
				    		data : JSON.stringify({
				    			beansNo : '${beans.beansNo}',
				    			categoryNo : '${beans.categoryNo}',
				    			name : '${beans.name}',
				    			pictureNo : '${beans.pictureNo}',
				    			stockWeight : '${beans.stockWeight}',
				    			selectWeight : Number($('#selectWeight option:selected').val()),
				    			beansPrice : '${beans.price}',
				    			orderType : 'cart'
				    		}),
				    		contentType: 'application/json'
				    	}).done(function (data){
				    		if (data) {
				    			changeCartCount();
				    			alert("장바구니에 등록되었습니다.");
				    		} else {
				    			alert("장바구니 등록에 실패했습니다.");
				    		}
				    	})
			    	} else {
			    		alert("재고량이 부족합니다.");
			    	}
		    	} else {
		    		alert("로그인이 필요합니다.");
		    		location.href='/login/form';
		    	}
		    }
		</script>
		<script>
			function changeCartCount() {
				var isCheckProduct = true;
				
				<c:forEach items="${sessionScope.cart}" var="product">
					<c:if test="${product.beansNo eq beans.beansNo}">
						isCheckProduct = false;
					</c:if>
				</c:forEach>
				
				if(isCheckProduct) {
					document.getElementById("cartCount").innerHTML = ${sessionScope.cart.size() + 1};
				}
			}
		</script>
    </body>
</html>
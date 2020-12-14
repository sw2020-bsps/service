<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header  -->
<header class="main-header">
    <!-- header-top  -->
    <div class="header-top">
        <div class="container">
        	<c:if test="${sessionScope.member.emailAddress ne null}">
            	<div class="header-top_contacts"><a href="#"><span>Call now:</span>${sessionScope.member.phoneNo }</a><a href="#"><span>Email :</span> ${sessionScope.member.emailAddress}</a></div>
        	</c:if>
        </div>
    </div>
    <!--header-top end -->
    <!-- header-inner -->
    <div class="header-inner  fl-wrap">
        <div class="container">
            <div class="header-container fl-wrap">
            	<!-- 로고 수정 부분 -->
                <a href="/main" class="logo-holder ajax"><img src="${pageContext.request.contextPath}/images/bieuplogo4.png" alt=""></a>
                <c:choose>
                	<c:when test="${sessionScope.member.emailAddress ne null}">
                		<form action="${pageContext.request.contextPath}/logout" method="post">
							<input type="hidden" name="_method" value="delete"/>
							<div class="show-reserv_button">
				                <span>
				                	<button class="btn ghost" style="margin: 0px 5px 0px 5px; padding: 25px 0px 0px;">
				                		<han style="font-size: 13px;">로그아웃</han>
				                	</button>
								</span>
				                <i class="fal fa-bookmark"></i>
			                </div>
						</form>
                	</c:when>
                	<c:otherwise>
		                <div class="show-reserv_button">
							<span>
			                	<a href="${pageContext.request.contextPath}/member/form"><hun style="color:white; font-size: 13px;">회원가입</hun></a>
							</span>
		                </div>
		                <div class="show-reserv_button">
			                <span>
			                	<a href="${pageContext.request.contextPath}/login/form"><hun style="color:white; font-size: 13px;">로그인</hun></a>
			                </span>
			                <i class="fal fa-bookmark"></i>
		                </div>
                	</c:otherwise>
                </c:choose>
                <!-- 쇼핑카트에 몇개있는지 나타내는 효과 -->
	                <div class="show-cart" onclick="location.href='${pageContext.request.contextPath}/cart';">
	                	<i class="fal fa-shopping-bag"></i>
	                	<c:choose>
	                		<c:when test="${not empty sessionScope.cart}">
	                			<span class="show-cart_count"><label id="cartCount">${sessionScope.cart.size()}</label></span>
	                		</c:when>
	                		<c:otherwise>
	                			<span class="show-cart_count"><label id="cartCount">0</label></span>
	                		</c:otherwise>
	                	</c:choose>
	                </div>
                <!--  navigation -->
                <div class="nav-holder main-menu">
                    <nav>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/main" class="act-link">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/beans">Beans</a></li>
                            <c:if test="${sessionScope.member.emailAddress ne null}">
                            	<c:if test="${sessionScope.member.type ne 'A'}">
                            		<li><a href="${pageContext.request.contextPath}/member/${sessionScope.member.emailAddress}">My Info</a></li>
                            	</c:if>
                            </c:if>
                            <c:if test="${sessionScope.member.type eq 'A'}">
                            	<li><a href="${pageContext.request.contextPath}/beans/form">Register Beans</a></li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
                <!-- navigation  end -->                        
            </div>
        </div>
    </div>
    <!-- header-inner end  -->
</header>
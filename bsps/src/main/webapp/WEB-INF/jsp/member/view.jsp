<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="kr">
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
                        <div class="bg par-elem "  data-bg="${pageContext.request.contextPath}/images/bg/bread.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title">
                                <mbody>Bieup 회원 정보 조회 서비스입니다.</mbody>
                                <h2><hun>내 정보 조회</hun></h2>
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
	                        <div class="member-table" style="text-align: center;">
		                        <!-- 회원 조회 테이블 -->
		                        <h4 class="cart-title"><hun style="font-size:26px;">내 정보 조회</hun></h4>
		                        <c:choose>
			                        <c:when test="${targetMember ne null}">
			                        	<table class="table table-border checkout-table">
		                                <tbody>
		                                	<tr>
		                                        <th style="width:200px;">이름</th>
		                                        <td><han><c:out value="${targetMember.emailAddress}" /></han></td>
		                                    </tr>
		                                    <tr>
		                                    	<th>이메일</th>
		                                    	<td style="width:200px;"><han><c:out value="${targetMember.name}" /></han></td>
		                                    </tr>
		                                   	<tr>
		                                    	<th>전화번호</th>
		                                    	<td><han><c:out value="${targetMember.phoneNo}" /></han></td>
		                                    </tr>
		                                    <tr>
		                                    	<th>우편번호</th>
		                                    	<td><han><c:out value="${targetMember.zipCode}" /></han></td>
		                                    </tr>
		                                    <tr>
		                                    	<th>주소</th>
		                                    	<td><han><c:out value="${targetMember.address}" /></han></td>
		                                    </tr>
		                                    <tr>
		                                    	<th>상세 주소</th>
		                                    	<td><han><c:out value="${targetMember.detailAddress}" /></han></td>
		                                    </tr>     
		                                </tbody>
			                            </table><br>
			                            <div class="custom_btn" style="float: right;">
				                            <button type="button" class="btn color-bg" onclick="location.href='/ordersheet';"><hun>주문목록 조회</hun><i class="fal fa-long-arrow-right"></i></button>
							                <button type="button" class="btn color-bg" onclick="location.href='/member/${targetMember.emailAddress}/form';"><hun>회원 수정</hun><i class="fal fa-long-arrow-right"></i></button>   
			                        	</div>
			                        </c:when>
			                        <c:otherwise>
			                        	<div class="container">
				                            <div class="section-title"><br><br>
				                            	<hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-bottom: 27px; margin-left: auto; margin-right: auto;">
												<han style="font-size:18px; color: white;">회원 정보가 존재하지 않습니다.</han>
				                                <hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-top: 27px; margin-left: auto; margin-right: auto;">
				                                <button type="button" class="btn color-bg" style="margin-top: 29px;" onclick="location.href='/main';"><hun>돌아가기</hun><i class="fal fa-long-arrow-right"></i></button>
				                            </div>
				                        </div>
			                        </c:otherwise>
		                        </c:choose>
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
    </body>
</html>
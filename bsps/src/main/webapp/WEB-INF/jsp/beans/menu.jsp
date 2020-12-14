<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                        <div class="bg par-elem "  data-bg="${pageContext.request.contextPath}/images/bg/keyboard.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title">
                                <mbody>Bieup Cafe에서 즐거운 시간 되시길 바랍니다.</mbody>
                                <h2><hun>원두 목록</hun></h2>
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
                    <section class="hidden-section" data-scrollax-parent="true" id="sec2">
                        <div class="container">
                            <div class="gallery_filter-button btn">Show Filters <i class="fal fa-long-arrow-down"></i></div>
                            <!-- gallery-filters -->
                            <div class="gallery-filters gth">
                                <a href="#" class="gallery-filter gallery-filter-active"  data-filter="*"><span><hun>01.</hun></span><hun>전체 조회</hun></a>
                                <c:forEach items="${categoryList}" var="category">
									<a href="#" class="gallery-filter " data-filter=".${category.categoryNo}"><span><hun>0${category.categoryNo + 1}.</hun></span><hun>${category.categoryName}</hun></a>
								</c:forEach>
                            </div>
                            <!-- gallery-filters end-->
                            <c:choose>
                           		<c:when test="${beansList.size() ne 0}">
                           			<div class="searchbox">
								      	<div class="header">
								        	<input onkeyup="filter()" type="text" id="value" placeholder="Type to Search">
								      	</div>
								    </div>
                           			<!-- gallery start -->
                           			<div class="gallery-items grid-big-pad  lightgallery three-column fl-wrap">
	                                <!-- gallery-item-->
                                	<c:forEach items="${beansList}" var="beans">
                                		<div class="item">
											<div class="gallery-item ${beans.categoryNo}">
											    <div class="grid-item-holder hov_zoom">
											    	<c:choose>
														<c:when test="${beans.pictureNo ne 1}">
															<a href="${pageContext.request.contextPath}/beans/picture/${beans.pictureNo}" class="box-media-zoom   popup-image"><i class="fal fa-search"></i></a>
															<img src="${pageContext.request.contextPath}/beans/picture/${beans.pictureNo}" alt="">
														</c:when>
														<c:otherwise>
															<a href="${pageContext.request.contextPath}/beans/picture/1" class="box-media-zoom   popup-image"><i class="fal fa-search"></i></a>
															<img src="${pageContext.request.contextPath}/beans/picture/1" alt="">
														</c:otherwise>
													</c:choose>
											    </div>
											    <div class="grid-item-details">
											        <h3 class="name">${beans.name}</h3>
											        <%-- <p>${beans.description} </p> --%>
											        <div class="grid-item_price">
											            <span><han style="font-size:16px;font-family:'Malgun Gothic', cursiv;color:#fff;position:relative;color:#C19D60;">${beans.price} 원</han></span>
											        	<div class="add_cart"><a href="/beans/${beans.beansNo}"><han style="font-size:14px;">더 알아보기</han></a></div>
											        </div>
											    </div>
											</div>
										</div>
                                	</c:forEach>
	                                <!-- gallery-item end-->
		                            </div><br>
		                            <!-- gallery end -->
                            	</c:when>
                            	<c:otherwise>
                            		<div class="container">
			                            <div class="section-title"><br><br>
			                            	<hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-bottom: 27px; margin-left: auto; margin-right: auto;">
											<han style="font-size:18px; color: white;">원두 정보가 존재하지 않습니다.</han>
			                                <hr style="border: 0px; height: 2px; background-color: gray; width: 100%; margin-top: 27px; margin-left: auto; margin-right: auto;">
			                                <button type="button" class="btn color-bg" style="margin-top: 29px;" onclick="location.href='/member/${sessionScope.member.emailAddress}';"><hun>돌아가기</hun><i class="fal fa-long-arrow-right"></i></button>
			                            </div>
			                        </div>
                            	</c:otherwise>
                            </c:choose>                               
                            <div class="clearfix"></div>
                            <div class="bold-separator bold-separator_dark"><span></span></div>
                            <div class="clearfix"></div>                                     
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
        <!--=============== scripts  ===============-->
        <script src="js/jquery.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/scripts.js"></script>
        <script type="text/javascript">
	        function filter(){
	        	var value, name, item, i;
	
	        	value = document.getElementById("value").value.toUpperCase();
	        	item = document.getElementsByClassName("item");
	
	        	for (i = 0; i < item.length; i++) {
	          		name = item[i].getElementsByClassName("name");
	          		if (name[0].innerHTML.toUpperCase().indexOf(value) > -1) {
	            		item[i].style.display = "flex";
	          		} else {
	            		item[i].style.display = "none";
	          		}
	        	}
	    	}
        </script>
    </body>
</html>
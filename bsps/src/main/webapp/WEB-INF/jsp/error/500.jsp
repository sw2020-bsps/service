<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="content full-height">
                    <div class="body-bg">
                        <div class="bg"  data-bg="${pageContext.request.contextPath}/images/bg/error/500.jpg"></div>
                        <div class="overlay"></div>
                    </div>
                    <!--error-wrap-->
                    <div class="error-wrap fl-wrap">
                        <div class="container">
                            <h2>500</h2>
                            <han style="font-size:20px;">죄송합니다. 서버에 문제가 발생했습니다.</han>
                            <div class="clearfix"></div>
                            <div class="dots-separator fl-wrap"><span></span></div>
                            <a href="${pageContext.request.contextPath}/main" class="btn"><han style="font-size:15px;">메인 화면으로 돌아가기 </han><i class="fal fa-long-arrow-right"></i></a>
                            <div class="section-dec sec-dec_top"></div>
                            <div class="section-dec sec-dec_bottom"></div>
                        </div>
                    </div>
                    <!--error-wrap end-->                                    
                </div>
                <!-- content end  -->
            </div>
            <!-- wrapper end -->  
        <%@ include file="/WEB-INF/jsp/system/cursor.jsp" %>                                                
        </div>
        <!-- Main end -->
        <%@ include file="/WEB-INF/jsp/system/script.jsp" %>
    </body>
</html>
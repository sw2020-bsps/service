<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <!--header end -->	
            <!-- wrapper  -->	
            <div id="wrapper">
                <!-- content  -->	
                <div class="content">
                    <!--  section  -->
                    <section class="hidden-section">
                    	<div class="container">
                            <div class="section-title">
                                <mbody>Bieup Beans Shop에서 즐거운 시간 되시길 바랍니다.</mbody>
                                <h2><hun>로그인</hun></h2>
                                <div class="dots-separator fl-wrap"><span></span></div>
                            </div>
                        </div>
                   		<div class="container" style="text-align: center; margin: 0auto;">
                            <div class="row" style="display:inline-block;">
								<form class="custom-form" action="/login" method="post" onsubmit="return login(this);" name="loginform" id="loginform">
									<div class="col-sm-8" style="width:100%;">
										<div>
											<input type="email" style="margin-bottom:10px;" name="emailAddress" id="emailAddress" placeholder="이메일을 입력하세요 *" value="" />
										</div>
										<div>
											<hun id="emailAddressError" style="color:white; float:left;"></hun>
										</div>
									</div>
									<div class="col-sm-8" style="width:100%;">
										<div>
											<input type="password" style="margin-top:10px; margin-bottom:10px;" name="password" id="password" placeholder="비밀번호를 입력하세요 *" value="" />
										</div>
										<div>
											<hun id="passwordError" style="color:white; float:left;"></hun>
										</div>
									</div>
									<div style="padding-left:15px; padding-right:15px;">
										<div style="width:100%;">
											<hun id="error" style="color:white;"></hun>
										</div>
										<button type="submit" class="btn color-bg" style="width:100%; padding:8px; margin-top:10px; margin-left:0px;">
											<han>로그인</han>
										</button>
										<hr style="background-color: black;">
									</div>
								</form>
								<button onclick="location.href = '/member/form'" class="btn" style="width:95%; padding:8px;">
									<han>회원가입</han>
								</button>
                       		</div>
                   		</div>
                        <div class="section-bg">
                            <div class="bg"  data-bg="${pageContext.request.contextPath}/images/bg/dec/section-bg.png"></div>
                        </div>
                    </section>
                    <!--  section end  -->
                    <div class="brush-dec2 brush-dec_bottom"></div>
                </div>
                <!-- content end  -->
            </div>
            <!-- wrapper end -->
        	<%@ include file="/WEB-INF/jsp/system/cursor.jsp" %>
        </div>
        <!-- Main end -->
        <%@ include file="/WEB-INF/jsp/system/script.jsp" %>
        <script>
        	function login(form) {
        		if (document.getElementById('emailAddress').value === '') {
        			document.getElementById('emailAddressError').innerHTML = '<p>이메일을 입력하지 않았습니다.</p>';
        			document.getElementById('passwordError').innerHTML = '';
        			document.getElementById('error').innerHTML = '';
        			
        			return false;
        		} else if(document.getElementById('password').value === '') {
        			document.getElementById('passwordError').innerHTML = '<p>비밀번호를 입력하지 않았습니다.</p>';
        			document.getElementById('emailAddressError').innerHTML = '';
        			document.getElementById('error').innerHTML = '';
        			
        			return false;
        		} else {
        			var xhr = new XMLHttpRequest();
    				xhr.onreadystatechange = function() {
    		
    					if (xhr.readyState === xhr.DONE) {
    						if (xhr.status === 200 || xhr.status === 201) {
    							if (xhr.responseText == 'true') {
    								form.submit();
    							} else {
    								document.getElementById("error").innerHTML = "<p>가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</p>";
    								document.getElementById('emailAddressError').innerHTML = '';
    								document.getElementById('passwordError').innerHTML = '';
    							}
    						} else {
    							console.error(xhr.responseText);
    						}
    					}
    				};
    				
    				var json = {
    						emailAddress: document.getElementById("emailAddress").value.toString(),
    						password: document.getElementById("password").value.toString()
    				}
    				
    				xhr.open("POST", "http://localhost/login/check", true);
    				xhr.setRequestHeader("Content-type", "application/json");
    				xhr.send(JSON.stringify(json));
    				
    				return false;
        		}
        	}
        </script>
    </body>
</html>
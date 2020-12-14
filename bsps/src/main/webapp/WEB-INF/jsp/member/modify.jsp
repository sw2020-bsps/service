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
                                <mbody>Bieup 회원 정보 수정 서비스입니다.</mbody>
                                <h2><hun>내 정보 수정</hun></h2>
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
	                        <div class="container" style="text-align: center;">
	                            <!-- 회원가입 테이블 -->
	                            <div class="row">
	                                <div class="col-md-8" style="text-align: center;">
	                                    <div class="check-out_wrap fl-wrap">
	                                        <h4 class="cart-title" style="font-size:40px;color:#C19D60;">BIEUP CAFE <br><hun>회원정보 수정</hun></h4>
	                                        <form class="custom-form" name="signupForm" id="signupForm" action="/member" method="POST" autocomplete="off">
	                                            <fieldset>
	                                                <div class="row">
	                                                	<!-- 이름 설정 -->
	                                                	<div id="default_memberinfo">
		                                                    <div class="col-sm-12">
		                                                        <br><br><h4 class="cart-title"><hun>이름</hun></h4>
		                                                    </div>
		                                                    <div>
		                                                    	<div class="col-sm-6" style="width:200px;">
			                                                        <input type="text" name="name" value="${member.name}" placeholder="이름을 입력하세요." required="required"
																		onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력하세요.'" maxlength="20">
			                                                    </div>
		                                                    </div>
	                                                    </div>
	                                                    <!-- 이름 설정 끝 -->
	                                                    <!-- 이메일 설정 구간 -->
	                                                    <div class="col-sm-6" style="visibility:hidden">
                                                        	<input type="text" name="empty" id="empty" placeholder="empty"
																onfocus="this.placeholder=''" onblur="this.placeholder='empty'" maxlength="200">
                                                    	</div>
                                                    	<div class="col-sm-12">
		                                                	<br><h4 class="cart-title"><hun>이메일</hun></h4>
		                                                </div>
			                                            <div class="col-sm-8">
				                                            <div style="width:250px;">
		                                                       	<input type="text" name="emailAddress" value="${member.emailAddress}" id="emailAddress" placeholder="이메일을 입력하세요."
																	onfocus="this.placeholder=''" onblur="this.placeholder='이메일을 입력하세요.'" maxlength="200" readonly>
		                                                   	</div>
		                                                   	<div id="emailchangeblock">
		                                                   		<button type="button" class="btn color-bg" style="margin-top:2px;" id="emailChange_button"
		                                                   			onclick="emailChange()"><hun>이메일 변경</hun><i class="fal fa-long-arrow-right"></i></button>
		                                                   	</div>
		                                                   	<div style="margin-left:10px;display:none;" id="dupliblock">
		                                                   		<button type="button" class="btn color-bg" style="margin-top:2px;" id="emailDupli_button"
		                                                   			onclick="emailDupliCheck()"><hun>중복 체크</hun><i class="fal fa-long-arrow-right"></i></button>
		                                                        <input type="hidden" id="isDupli" value="false">
		                                                   	</div>
		                                                   	<div style="margin-left:10px;display:none;" id="sendblock">
		                                                   		<button type="button" class="btn color-bg" style="margin-top:2px;" id="send"
		                                                   			onclick="emailSend()"><hun>인증코드 발송</hun><i class="fal fa-long-arrow-right"></i></button>
		                                                   	</div>
		                                                   	<div style="width:200px;display:none;" id="authblock">
		                                                       	<input type="text" name="authCode" id="authCode" placeholder="인증코드를 입력하세요."
																	onfocus="this.placeholder=''" onblur="this.placeholder='인증코드를 입력하세요.'" maxlength="200">
		                                                   	</div>
		                                                   	<div style="display:none;" id="authbutton">
		                                                   		<button type="button" class="btn color-bg" style="margin-top:7px;width:190px;" id="emailAuth_button"
		                                                   			onclick="emailAuthCheck()"><hun id="authresult">이메일 인증</hun><i class="fal fa-long-arrow-right"></i></button>
		                                                   		<input type="hidden" id="isAuth" value="true">
		                                                   	</div>
		                                                </div>
		                                                <!-- 이메일 설정구간 끝 -->
		                                                <!-- 비밀번호 설정 구간 -->
	                                                   	<div class="col-sm-12">
	                                                        <br><h4 class="cart-title"><hun>비밀번호</hun></h4>
	                                                    </div>
														<div class="col-sm-8">
															<div id="pwdchangeblock">
		                                                   		<button type="button" class="btn color-bg" style="margin:0px 0px 0px 0px; float:left; 
		                                                   			padding:8px 10px 8px 25px" id="pwdChange_button" onclick="pwdChange()">
		                                                   		<hun>비밀번호 변경</hun><i class="fal fa-long-arrow-right"></i></button>
		                                                	</div>
		                                                   	<div style="width:200px; display:none;" id="passwordBlock"></div>
		                                                   	<div style="width:200px; display:none;" id="confirmPasswordblock"></div>
		                                                   	<span><han id="checkPassword"></han></span>
	                                                   	</div>
	                                                   	<!-- 비밀번호 설정 끝 --> 
	                                                   	<!-- 전화번호 설정 구간 -->
	                                                    <div id="phone_service" class="phone_service">
		                                                    <div class="col-sm-12">
		                                                        <br><h4 class="cart-title"><hun>전화번호</hun></h4>
		                                                    </div>
		                                                    <div class="col-sm-6">
		                                                        <input type="text" id="phoneNo" value="${member.phoneNo}" name="phoneNo" placeholder="전화번호를 입력하세요."
		                                                         	minlength="13" maxlength="13" required="required" onfocus="this.placeholder=''" onblur="this.placeholder='전화번호를 입력하세요.'"/>                                                  
		                                                    </div>
	                                                    </div>
	                                                    <!-- 전화번호 설정 끝 -->
	                                                    <!-- 주소 설정 구간 -->
	                                                    <div id="address_service">
	                                                    	<div class="col-sm-12">
	                                                        	<br><h4 class="cart-title"><hun>주소 설정</hun>
	                                                        	<button class="btn color-bg" type="button" style="margin:0px 0px 0px 55px;
	                                                        	 	padding:8px 10px 8px 25px" onclick="searchZipcode()">
	                                                        	<hun>주소 검색</hun><i class="fal fa-long-arrow-right"></i></button></h4>
	                                                    	</div>
															<div>
																<div>
																	<div class="col-sm-6" style="width:150px;">
																		<input type="text" id="zipCode" name="zipCode" value="${member.zipCode}" placeholder="우편번호"
																			required="required" readonly onblur="this.placeholder='우편번호'" minlength="5" maxlength="5">
																	</div>
																	<div class="col-sm-6" style="width:500px;">
																		<input type="text" id="address" name="address" value="${member.address}" placeholder="주소" 
																			required="required"	maxlength="300" readonly onblur="this.placeholder='주소'">
																	</div>
																	<div class="col-sm-6" style="width:650px;">
																		<input type="text" id="detailAddress" name="detailAddress" value="${member.detailAddress}" 
																			placeholder="상세주소를 입력하세요." required="required" maxlength="250" onfocus="this.placeholder=''"
																			onblur="this.placeholder='상세주소를 입력하세요.'">
																	 	<div class="col-sm-6">
																			<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;
																			-webkit-overflow-scrolling:touch;">
																				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer"
																				 style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1"
																				  onclick="closeDaumPostcode()" alt="닫기 버튼">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<!-- 주소 설정 끝 -->
													</div>
	                                                <div class="clearfix"></div>
	                                                <input type="hidden" name="_method" value="PUT">
	                                                <input type="hidden" id="originalpwd" name="password" value="${member.password}">
	                                                <button type="submit" class="btn color-bg"><hun>회원정보 수정</hun><i class="fal fa-long-arrow-right"></i></button>
	                                                <iframe name="disableframe" style="display:none"></iframe>
	                                            </fieldset>
	                                        </form>
	                                    </div>
	                                </div>
	                            </div>
	                            <!-- 회원가입 테이블 -->
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
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
			// 이메일 서비스 시작 --------------------------
			function emailChange() {
				document.getElementById('emailchangeblock').style.display = "none";
				document.getElementById('dupliblock').style.display = "block";
				document.getElementById('emailAddress').value = "";
				$("#emailAddress").attr('readonly', false);
				document.getElementById('isDupli').value = "true";
				document.getElementById('isAuth').value = "false";
			}
			
			function emailSend() {
				var email = document.getElementById('emailAddress').value;
				var isEmail = isEmailCheck(email);
			
				if (isEmail == true) {
					$.ajax({
						type: "POST",
						url: "/email",
						data: { email },
						success: function(data) {
							alert('이메일로 인증코드가 발송되었습니다.');
							document.getElementById('authblock').style.display = "block";
							document.getElementById('authbutton').style.display = "block";
						}, error: function(e) {
							alert('인증 오류. 다시 시도하시기 바랍니다.');
						}
					});
				} else {
					alert('정확한 이메일 형식으로 입력하세요. (ex. bieupcafe@gmail.com)');
				}
			}
			
			function emailDupliCheck() {
				var email = document.getElementById('emailAddress').value;
				var isEmail = isEmailCheck(email);
			
				if (isEmail == true) {
					$.ajax({
						type: "POST",
						url: "/email/dupli",
						data: { email },
						success: function(result) {
							if (result == false) {
								alert('사용 가능한 이메일입니다!');
								document.getElementById('dupliblock').style.display = "none";
								document.getElementById('sendblock').style.display = "block";
								document.getElementById('isDupli').value = "false";
								emailAddress.onchange = function() {
									document.getElementById('isDupli').value = "true";
								}
							} else {
								alert('이미 가입되어있는 이메일입니다.\n'
										+ '다른 이메일을 입력하세요.');
								document.getElementById('isDupli').value = "true";
							}
						}
					});
				} else {
					alert('정확한 이메일 형식으로 입력하세요. (ex. bieupcafe@gmail.com)');
				}
			}
			
			function isEmailCheck(asValue) {
				var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				return regExp.test(asValue);
			}
			
			function emailAuthCheck() {
				var authCode = document.getElementById('authCode').value;
				var isDupli = document.getElementById('isDupli').value;
				
				if (isDupli === "false"){
					$.ajax({
						type: "POST",
						url: "/email/authcode",
						data: { authCode },
						success: function(result) {
							if (true == result) {
								alert('인증 완료');
								document.getElementById('sendblock').style.display = "none";
								document.getElementById('authblock').style.display = "none";
								document.getElementById('isAuth').value = "true";
								$("#emailAddress").attr('readonly', true);
								document.getElementById('authresult').innerHTML = '인증 완료';
								document.getElementById('emailAuth_button').disabled = 'disabled';
								emailAddress.onchange = function() {
									document.getElementById('isAuth').value = "false";
								}
							} else {
								alert('인증에 실패하였습니다.\n'
										+ '다시 입력하시기 바랍니다.');
								document.getElementById('authCode').value = '';
							}
						}
					});
				} else {
					alert('인증에 실패하였습니다.\n'
							+ '먼저 이메일 인증을 하세요.');
				}
			}
			// 이메일 서비스 종료 --------------------------
			
			// 비밀번호 서비스 시작 --------------------------
			function pwdChange() {
				const pwdString = '<input type="password" class="password_input"'
								+ 'id="password" name="password" placeholder="비밀번호를 입력하세요."'
								+ 'minlength="8" maxlength="30" oninput="confirm()"'
								+ 'onchange="passwordCheck()" required="required"'
								+ 'onfocus="this.placeholder="""'
								+ 'onblur="this.placeholder="비밀번호를 입력하세요."">';
								
				const conPwdString = '<input type="password" class="password_input"'
								   + 'id="confirmPassword" placeholder="비밀번호를 재입력하세요."'
								   + 'minlength="8" maxlength="30" onchange="passwordCheck()"'
								   + 'required="required" onfocus="this.placeholder="""'
								   + 'onblur="this.placeholder="비밀번호를 재입력하세요.""">';
				
				document.getElementById('pwdchangeblock').style.display = "none";
				document.getElementById('passwordBlock').style.display = "block";
				document.getElementById('originalpwd').remove();
				document.getElementById('passwordBlock').innerHTML = pwdString;
				document.getElementById('confirmPasswordblock').innerHTML = conPwdString;
			}
			
			function confirm() {
				document.getElementById('confirmPasswordblock').style.display = "block";
			}
			
			function passwordCheck() {
				var password = document.getElementById('password').value;
				var specialCharacters = ["!", "@", "#", "$", "%", "&"];
				var isSC = false;
			
				if (password.length < 8 || password.length > 30) {
					window.alert('8 ~ 30글자 사이의 비밀번호를 입력하세요.');
					document.getElementById('password').value = '';
				}
				for (var i = 0; i < specialCharacters.length; i++) {
					if (password.indexOf(specialCharacters[i]) != -1) {
						isSC = true;
					}
				}
				if (false == isSC) {
					window.alert('비밀번호는 특수문자(!, @, #, $, %, &)를 포함해야 합니다!')
					document.getElementById('password').value = '';
				}
				if (document.getElementById('password').value != '' && document.getElementById('confirmPassword').value != '') {
					if (document.getElementById('password').value == document.getElementById('confirmPassword').value) {
						document.getElementById('checkPassword').innerHTML = '<hun style="margin: -55px 0px 0px 40px; float:left;">비밀번호가 일치합니다.</hun>';
						document.getElementById('checkPassword').style.color = 'white';
					}
					else {
						document.getElementById('checkPassword').innerHTML = '<hun style="margin: -55px 0px 0px 40px; float:left;">비밀번호가 맞지않습니다.</hun>';
						document.getElementById('checkPassword').style.color = 'red';
					}
				}
			}
			// 비밀번호 서비스 종료 --------------------------
			
			// 전화번호 서비스 시작 --------------------------
			var phoneNo = document.getElementById('phoneNo');
			
			phoneNo.onkeyup = function() {
			  this.value = autoHypen(this.value);  
			}
			
			var autoHypen = function(str) {
				str = str.replace(/[^0-9]/g, '');
				var tmp = '';
				if ( str.length < 4) {
				    return str;
				} else if (str.length < 7) {
				    tmp += str.substr(0, 3);
				    tmp += '-';
				    tmp += str.substr(3);
				    return tmp;
				} else if (str.length < 11) {
				    tmp += str.substr(0, 3);
				    tmp += '-';
				    tmp += str.substr(3, 3);
				    tmp += '-';
				    tmp += str.substr(6);
				    return tmp;
				} else {              
				    tmp += str.substr(0, 3);
				    tmp += '-';
				    tmp += str.substr(3, 4);
				    tmp += '-';
				    tmp += str.substr(7);
				    return tmp;
				}
			    return str;
			}
			// 전화번호 서비스 종료 --------------------------
			
			// 주소찾기 서비스 시작 --------------------------
		    var element_layer = document.getElementById('layer');
		
		    function closeDaumPostcode() {
		        element_layer.style.display = 'none';
		    }
		
		    function searchZipcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var address = '';
		                var extraAddress = '';
		
		                if ('R' === data.userSelectedType) {
		                	address = data.roadAddress;
		                } else {
		                	address = data.jibunAddress;
		                }
		
		                if('R' === data.userSelectedType){
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    	extraAddress += data.bname;
		                    }
		                    if('' !== data.buildingName && 'Y' === data.apartment){
		                    	extraAddress += (extraAddress !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    if('' !== extraAddress){
		                    	extraAddress = ' (' + extraAddress + ')';
		                    }
		                    document.getElementById("address").value = address + "" + extraAddress;
		                } else {
		                    document.getElementById("address").value = address;
		                }
		                document.getElementById('zipCode').value = data.zonecode;
		                document.getElementById("detailAddress").focus();
		                element_layer.style.display = 'none';
		            },
		            width : '100%',
		            height : '100%',
		            maxSuggestItems : 5
		        }).embed(element_layer);
		        element_layer.style.display = 'block';
		        initLayerPosition();
		    }

		    function initLayerPosition(){
		        var width = 300;
		        var height = 400;
		        var borderWidth = 5;
		
		        element_layer.style.width = width + 'px';
		        element_layer.style.height = height + 'px';
		        element_layer.style.border = borderWidth + 'px solid';
		        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
		        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		    }
		 	// 주소찾기 서비스 종료 --------------------------
		 
		 	// 폼 submit 서비스 구간 -----------------------
		 	var signupForm = document.forms['signupForm'];
		 
		 	signupForm.addEventListener('submit', function(event) {
		 		console.log();
		 		if (document.getElementById('isDupli').value === "true") {
		 			alert('수정에 실패하였습니다.\n'
							+ '먼저 이메일 중복체크를 하세요.');
		 			signupForm.target = "disableframe";
		 			return false;
		 		} else if (document.getElementById('isAuth').value === "false") {
		 			alert('수정에 실패하였습니다.\n'
							+ '먼저 이메일 인증을 하세요.');
		 			signupForm.target = "disableframe";
		 			return false;
		 		} else if (document.getElementById('password').value != document.getElementById('confirmPassword').value) {
		 			alert('비밀번호가 일치하지 않습니다.');
		 			signupForm.target = "disableframe";
		 			return false;
		 		}
		 		else {
		 			return true;
		 		}
		  	});
		 	// 폼 submit 서비스 종료 -----------------------
		</script>
    </body>
</html>
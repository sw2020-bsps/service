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
                        <div class="bg par-elem "  data-bg="${pageContext.request.contextPath}/images/bg/beans2.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title">
                                <mbody>Bieup 원두 등록 서비스입니다.</mbody>
                                <h2><hun>원두 정보 등록</hun></h2>
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
                            <!-- BEANS MODIFY FORM -->
                            <div class="row">
                            	<form class="custom-form" action="/beans" method="POST" enctype="multipart/form-data" autocomplete="off">
	                                <div class="col-md-4">
	                                    <!-- PICTURE  -->
	                                   <div class="filebox dark-bg fl-wrap">
											<label for="beans-picture" >사진 업로드</label><br>
											<input type="file" id="beans-picture" name="attach"  accept="image/*" onchange="setPreview(this,$('#previewPicture'))" />
											<div class="picture_container">
												<div id="temporaryPicture"><img src="/beans/picture/1" style="width:100%;max-width:100%;border:1px solid #000;display:;"></div>
												 <div id="previewPicture" style="width:100%;max-width:100%;height:100%;border:1px solid #000;display:none;"></div>
											</div>
	                                   </div>
	                                    <!-- /PICTURE  -->                              
	                                </div>
	                                <div class="col-md-8">
                                    	<fieldset>
	                                        <div class="row">
	                                        	<div class="col-sm-4">
	                                        		<div class="clearfix"></div>
	                                                <h4 class="cart-title" style="font-family:'Malgun Gothic', cursiv;font-size:28px;">원두 정보 등록</h4>
	                                                <h4 class="cart-title" style="font-family:'Malgun Gothic', cursiv;font-size:20px;">이름</h4>
	                                                <input type="text" name="name" placeholder="원두 이름을 입력하세요." required="required"
	                                                 onfocus="this.placeholder=''" onblur="this.placeholder='원두 이름을 입력하세요.'">
	                                            </div>
	                                            <div class="col-sm-7">
	                                            	<div class="clearfix"></div><br>
	                                            	<table class="table table-border beansmodify-table">
	                                             	<tbody>
	                                         			<tr>
				                                        	<th>재고</th>
				                                            <th>가격</th>
				                                            <th>카테고리</th>
				                                        </tr>
	                                         			<tr>
														    <td>
														    	<input type="number" name="stockWeight" value="1000" min="1000" class="beans-weight" required="required"> g
														    </td>
														    <td>
														        <input type="number" name="price" value="100" min="100" class="beans-price" required="required"> 원
														    </td>
															<td>
														    	<select name="categoryNo" class="beans-category">
														    	<c:forEach items="${categoryList}" var="category">
																	<option value="${category.categoryNo}">${category.categoryName}</option>
																</c:forEach>
																</select>
	                                             			</td>
	                                         			</tr>
	                                     			</tbody>
												</table>
	                                            </div>
	                                            <div class="col-sm-11">
	                                            	<div class="clearfix"></div>
	                                          		<h4 class="beans-description" style="font-family:'Malgun Gothic', cursiv;font-size:20px;">설명</h4>
	                                          		<textarea name="description"  id="description" cols="30" rows="3" placeholder="원두 설명을 입력하세요."
	                                          		 required="required" onfocus="this.placeholder=''" onblur="this.placeholder='원두 설명을 입력하세요.'"></textarea>
	                                            </div>
	                                            <div class="col-sm-7">
	                                            	<div class="clearfix"></div>
	                                            	<button type="submit" class="btn color-bg" style="float:left; margin:20px 15px 5px 1px;">
	                                            	<han>등록하기</han><i class="fal fa-long-arrow-right"></i></button>
		                                            <button type="reset" class="btn color-bg" style="float:left; margin:20px 5px 5px 1px;">
		                                            <han>초기화</han><i class="fal fa-long-arrow-right"></i></button>
		                                            <button type="button" class="btn color-bg" onclick="location.href='/main';" style="float:left; margin:45px 5px 5px 1px;">
		                                            <han>돌아가기</han><i class="fal fa-long-arrow-right"></i></button>
	                                            </div>
	                                        </div>
                                    	</fieldset>
	                                </div>
	                            </form>
                            </div>
                            <!-- /BEANS MODIFY FORM -->
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
			function setPreview(html, $target) {
			    if (html.files && html.files[0]) {
			        var reader = new FileReader();
			        reader.onload = function (e) {
			        	$('#temporaryPicture').css('display', 'none');
			            $target.css('display', '');
			            $target.html('<img src="' + e.target.result + '" style="width:100%;max-width:100%;height:100%;border="0"; alt="" />');
			        }
			        reader.readAsDataURL(html.files[0]);
			    }
			}
		</script>
    </body>
</html>
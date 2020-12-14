<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
    <%@ include file="/WEB-INF/jsp/system/head.jsp" %>
	<body>
		<%@ include file="/WEB-INF/jsp/layout/loader.jsp" %>
		<!-- main start  -->
		<div id="main">
			<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
			<!-- wrapper  -->	
            <div id="wrapper">
                <!-- hero-wrap-->	
                <div class="hero-wrap fl-wrap full-height">
                    <!--fs-slider-wrap -->						
                    <div class="fs-slider-wrap fs-slider-det full-height fl-wrap hero_fsw dark-bg">
                        <div class="fs-slider full-height fl-wrap">
                            <div class="swiper-container">
                                <div class="swiper-wrapper" >
                                    <!-- swiper-slide-->
                                    <div class="swiper-slide">
                                        <div class="fs-slider-item fl-wrap">
                                            <div class="bg"  data-bg="${pageContext.request.contextPath}/images/bg/bieup2.jpg" data-swiper-parallax="40%"></div>
                                            <div class="overlay"></div>
                                            <div class="grid-carousel-title">
                                                <mtitle><span style="font-size:80px; top:10px; margin-right:-15px; position:relative;">ㅂ</span> 카페</mtitle>
                                                <div class="clearfix"></div>
                                                <h4 style="font-size:20px;"><hun>핸드드립으로 추출한 원두만을 취급하는 신선한 카페 </hun></h4>
                                                <div class="bold-separator"><span></span></div>
                                                <a href="#sec2" class="hero_btn custom-scroll-link"><han>더 알아보기</han><i class="fal fa-long-arrow-down"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- swiper-slide-->
                                    <!-- swiper-slide-->
                                    <div class="swiper-slide"  >
                                        <div class="fs-slider-item fl-wrap">
                                            <div class="bg"  data-bg="${pageContext.request.contextPath}/images/bg/beans.jpg" data-swiper-parallax="40%"></div>
                                            <div class="overlay"></div>
                                            <div class="grid-carousel-title">
                                                <mtitle><span style="font-size:80px; top:10px; margin-right:-15px; position:relative;">ㅂ</span> 원두</mtitle>
                                                <div class="clearfix"></div>
                                                <h4 style="font-size:20px;"><hun>갓 로스팅되었으며, 핸드드립으로 추출한 원두 </hun></h4>
                                                <div class="bold-separator"><span></span></div>
                                                <a href="/menu" class="hero_btn"><han>더 알아보기</han><i class="fal fa-long-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- swiper-slide-->
                                    <!-- swiper-slide-->
                                    <div class="swiper-slide"  >
                                        <div class="fs-slider-item fl-wrap">
                                            <div class="bg"  data-bg="${pageContext.request.contextPath}/images/bg/coffee.jpg" data-swiper-parallax="40%"></div>
                                            <div class="overlay"></div>
                                            <div class="grid-carousel-title">
                                                <mtitle><span style="font-size:80px; top:10px; margin-right:-15px; position:relative;">ㅂ</span> 커피</mtitle>
                                                <div class="clearfix"></div>
                                                <h4 style="font-size:20px;"><hun>각양각색 비읍 카페만의 이색적인 커피 </hun></h4>
                                                <div class="bold-separator"><span></span></div>
                                                <a href="about.html" class="hero_btn"><han>더 알아보기</han><i class="fal fa-long-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- swiper-slide-->
                                </div>
                            </div>
                        </div>
                        <div class="hero-slider_btn hero-slider_btn_next fs-slider-button-next"><i class="fas fa-caret-right"></i></div>
                        <div class="hero-slider_btn hero-slider_btn_prev fs-slider-button-prev"><i class="fas fa-caret-left"></i></div>
                        <div class="hero-slider-wrap_pagination"></div>
                    </div>
                    <!--fs-slider-wrap end -->	 
                    <div class="hero-dec_top"></div>
                    <div class="hero-dec_bottom"></div>
                    <div class="hero-dec_top_right"></div>
                    <div class="hero-dec_bottom_right"></div>
                    <div class="brush-dec"></div>
                </div>
                <!-- hero-wrap  end -->	
                <!-- content  -->	
                <div class="content">
                	<!-- section   -->
                    <section class="hidden-section big-padding" data-scrollax-parent="true" id="sec2">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="section-title text-align_left">
                                        <h4>Bieup Story</h4>
                                        <h2>About Bieup Cafe</h2>
                                        <div class="dots-separator fl-wrap"><span></span></div>
                                    </div>
                                    <div class="text-block ">
                                        <p>최고급 원두를 선별하여 갓볶아 신선한 커피 향이 가득한 비읍 카페입니다.</p>
                                        <p>조용한 분위기, 평일내내 받은 스트레스를 풀기에 좋은 장소.</p>
                                        <p>날이 좋아서 밖에 있고 싶은데, 사람 많은 곳은 피하고 싶은 당신!</p>
                                        <p>바로 당신을 위한 공간입니다.</p>
                                        <p>봄에 보았을 때 이렇게 예쁜데, 사계절을 내내보면 빠져버리는 카페.</p>
                                        <a href="/menu" class="btn fl-btn"><han>원두 보러가기</han><i class="fal fa-long-arrow-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="image-collge-wrap fl-wrap">
                                        <div class="main-iamge">
                                            <img src="${pageContext.request.contextPath}/images/bieup/night_side_l.jpg"   alt="">
                                        </div>
                                        <div class="images-collage-item" style="width:55%" data-position-left="68" data-position-top="-15" data-zindex="2" data-opacity="1.0"><img src="${pageContext.request.contextPath}/images/bieup/nightsnap.jpg" alt=""></div>
                                        <div class="images-collage-item col_par" style="width:120px" data-position-left="-23" data-position-top="-17" data-zindex="9" data-scrollax="properties: { translateY: '150px' }"><img src="${pageContext.request.contextPath}/images/cube.png" alt=""></div>
                                    </div>
                                </div>
                            </div>
                            <div class="section-dec sec-dec_top"></div>
							<div class="wave-bg" data-scrollax="properties: { translateY: '-150px' }"></div>							
                        </div>
                    </section>
                    <!--  section end  -->
                    <!-- section   -->
                    <section class="column-section no-padding hidden-section" data-scrollax-parent="true" id="sec4">
                        <div class="column-wrap-bg left-wrap">
                            <div class="bg par-elem "  data-bg="images/bieup/inside.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                            <div class="overlay"></div>
                            <div class="quote-box">
                                <i class="fal fa-quote-right"></i>
                                <p><hun>"최고급 원두를 선별하여 갓볶아 신선한 커피의 향이 가득한 비읍커피입니다."</hun></p>
                                <h4>Bieup Cafe</h4>
                            </div>
                        </div>
                        <div class="column-section-wrap dark-bg" >
                            <div class="container">
                                <div class="column-text">
                                    <div class="section-title">
                                        <h4>Bieup Cafe</h4>
                                        <h2><hun>영업 시간</hun></h2>
                                        <div class="dots-separator fl-wrap"><span></span></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h3 style="color: #C19D60;">Every Day</h3>
                                            <div class="hours">
                                                10:00<br>
                                                22:00
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="bold-separator"><span></span></div>
                                    <div class="big-number"><a href="#"><hun>010-3850-6527</hun></a></div>
                                </div>
                            </div>
                            <div class="illustration_bg">
                                <div class="bg"  data-bg="images/bg/dec/7.png"></div>
                            </div>
                        </div>
                    </section>
                    <!-- section end -->
                    <!--  section    -->   
                    <section data-scrollax-parent="true">
                        <div class="container">
                            <div class="section-title">
                                <h4 style="font-size:40px;">Bieup Event</h4>
                                <div class="dots-separator fl-wrap"><span></span></div>
                            </div>
                            <div class="cards-wrap fl-wrap">
                                <div class="row">
                                    <!--card item --> 
                                    <div class="col-md-4">
                                        <div class="content-inner fl-wrap">
                                            <div class="content-front">
                                                <div class="cf-inner">
                                                    <div class="bg "  data-bg="images/event/hello.png"></div>
                                                </div>
                                            </div>
                                            <div class="content-back">
                                                <div class="cf-inner">
                                                    <div class="inner">
                                                        <div class="dec-icon">
                                                            <i class="fal fa-fish"></i>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--card item end -->
                                    <!--card item --> 
                                    <div class="col-md-4">
                                        <div class="content-inner fl-wrap">
                                            <div class="content-front">
                                                <div class="cf-inner">
                                                    <div class="bg "  data-bg="images/event/coffee.png"></div>
                                                </div>
                                            </div>
                                            <div class="content-back">
                                                <div class="cf-inner">
                                                    <div class="inner">
                                                        <div class="dec-icon">
                                                            <i class="fal fa-carrot"></i>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--card item end -->
                                    <!--card item --> 
                                    <div class="col-md-4">
                                        <div class="content-inner fl-wrap">
                                            <div class="content-front">
                                                <div class="cf-inner">
                                                    <div class="bg "  data-bg="images/event/cookie.png"></div>
                                                </div>
                                            </div>
                                            <div class="content-back">
                                                <div class="cf-inner">
                                                    <div class="inner">
                                                        <div class="dec-icon">
                                                            <i class="fal fa-utensils-alt"></i>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--card item end -->                                                 
                                </div>
                                <div class="section-dec sec-dec_top"></div>
                                <div class="section-dec sec-dec_bottom"></div>
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
			<%@ include file="/WEB-INF/jsp/system/cursor.jsp" %>
        </div>                                                  
        <!-- Main end -->
        <%@ include file="/WEB-INF/jsp/system/script.jsp" %>
	</body>
</html>
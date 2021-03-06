<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%-- <%@ page import="java.util.*"%> --%>
<%-- <%@ page import="com.commodity.model.*"%> --%>
<%-- <%@ page import="com.commodity_category.model.*"%> --%>
<%-- <%@ page import="com.member.model.*"%>        --%>
	
<%-- <%MemVO memVO = (MemVO) session.getAttribute("memVO"); %> --%>
<!doctype html>

<html lang="UTF-8">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
  <title>EATIN Shop &#8211; Home Main | EATIN HTML Template</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/font-awesome.min.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/ionicons.min.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/owl.carousel.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/owl.theme.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/settings.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style2.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/custom.css" type="text/css" media="all" />
  <link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
            <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
  <style type="text/css" media="screen">
    body {

      overflow-y: scroll;
      overflow-x: hidden;

    }
    .itempic {
      display: table-cell;
      border: solid 1.5px #fff;
      box-sizing: border-box;
    }
    .star {
      width: 250px;
      height: 280px;
    }
    .header.scrolling-menu:hover {
      background: #fff;

      -moz-box-shadow: 0 10px 20px rgba(0, 0, 0, .15);
      -webkit-box-shadow: 0 10px 20px rgba(0, 0, 0, .15);
      box-shadow: 0 10px 20px rgba(0, 0, 0, .15);
      z-index: 999;
    }

    #oneline {
      width: 0%;
    }
    #gymbtn {
      background-color: black;
      border-color: black;
    }
    .containerbg {
      padding-right: 47px;
      padding-left: 47px;
      margin-top: 30px;
    }
    .cool {
      margin-left: 80px;
      margin-bottom: -50px;
    }
      .contact-icon>a>img{
    	max-width:50%;
    }
    
    * {
	list-style: none;
}


.dialogue {
	position:fixed;
	top:38%;
	right:2%;
  	width: 400px;
  	display:flex;
  	flex-direction:column;
  	justify-content: flex-end;
  	height:350px;
  	padding: 5px 20px;
  	box-shadow: 0 0 10px #000;
  	background-color: #f4f5f7;
  	border-radius: 20px;
}
.messagesArea{
	overflow:auto;
}

#productArea img{
    height:100px;
}
#productArea {
    position:sticky;
    top:0px;
    left:0px;
    width:100%;
    z-index:800;
    background-color: #f4f5f7;
}

.user {
  display: flex;
  align-items: flex-start;
  margin-bottom: 20px;
}
.user .avatar {
  width: 60px;
  text-align: center;
  flex-shrink: 0;
}
.user .pic {
  border-radius: 50%;
  overflow: hidden;
}
.user .pic img {
  width: 100%;
  vertical-align: middle;
}
.user .name {
  color: #333;
}
.user .text {
  background-color: #aaa;
  padding: 16px;
  border-radius: 10px;
  position: relative;
}

.remote .text {
  margin-left: 20px;
  margin-right: 80px;
  color: #eee;
  background-color: #4179f1;
}
.remote .text::before {
  border-right: 10px solid #4179f1;
  left: -10px;
}

.local {
  justify-content: flex-end;
}
.local .text {
  margin-right: 10px;
  margin-left: 80px;
  order: -1;
  background-color: #fff;
  color: #333;
}
.local .text::before {
  border-left: 10px solid #fff;
  right: -10px;
}

.remote .text::before,.local .text::before {
  content: "";
  position: absolute;
  top: 20px;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
}
.remote .text,.local .text {
  font-weight: 300;
  box-shadow: 0 0 10px #888;
}

.contactMsgs {
	position:relative;
}
.contactMsgs::after {
  content: attr(data-count);
  position: absolute;
  font-size: 14px;
  text-align: center;
  line-height: 16px;
  height: 16px;
  width: 16px;
  border-radius: 16px;
  color: #fff;
  top: 36%;
  right: 30%;
  background-color: #02F78E;
}

    .header-right{
    margin-right:-40px;
    }
     #wishlist123{ 
     top:65px !important; 
     left:-150px; 
     width:300px; 
    
     }
     #khealthy{
     margin-top:-130px;
     }
     #fdelicious{
     margin-top:60px;
     } 
	.header{
	position:absolute;
	background-color:rgba(255, 255, 255, 0);
	}
	.header.scrolling-menu{
	background:rgba(255, 255, 255, 0.8);
	}
	.coursetbody{
	padding:10px;
	background-color:#33333373;
	color:white;
	}
	#coursetable{
	width:400px;
	margin-left:45%;
	margin-bottom:30px;
	}
	.coursetbody:hover{
	text-shadow:2px 2px 2px #777;
	 -o-transition: color .3s linear;
    -webkit-transition: color .3s linear;
    -moz-transition: color .3s linear;
    transition:  color .3s linear;
	}
	#coursetable:hover{
	 box-shadow:3px 3px 9px white;
	 -o-transition: color .10s linear;
    -webkit-transition: color .10s linear;
    -moz-transition: color .10s linear;
    transition:  color .10s linear;
	}
	#changepic_text{
	margin-bottom:20px;
	}
	
  </style>
</head>

<body>

<script>
	var memID = -1;
	var lesID = "-1";
	var comID = "-1";
</script>

	<c:set var="home" value="${pageContext.request.contextPath}/front_end/front_end_index.jsp" />
    <c:set var="les" value="${pageContext.request.contextPath}/front_end/lesson/listQueryLesson.jsp" />
    <c:set var="com" value="${pageContext.request.contextPath}/front_end/commodity/comindex.jsp" />
    <c:set var="mem" value="${pageContext.request.contextPath}/front_end/member/frontMemSelect.jsp" />
	<c:set var="rec" value="${pageContext.request.contextPath}/front_end/recipe/recIndex.jsp" />
	
			<!-- ???????????? -->
					<div id="menu-slideout" class="slideout-menu hidden-md-up">
						<div class="mobile-menu">
								<ul id="mobile-menu" class="menu">
									<li>
                                        <a href="${home}">Home</a>
                                    </li>
                                    
                                     <li>
                                        <a href="${rec}">Recipe</a>
                                    </li>
                                    
                                     <li>
                                        <a href="${com}">Shop</a>
                                    </li>
                                    
                                     <li>
                                        <a href="${les}">Course</a>
                                    </li>
                                    <li>
                                        <a href="${mem}">Member</a>
                                    </li>
								</ul>
						</div>
					</div>
<div class="site">
<!-- ????????? -->
  <header id="header" class="header header-desktop header-2">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <a href="${home}" id="logo">
            <img class="logo-image" src="<%=request.getContextPath()%>/resource/images/logo1.png" alt="EATIN Logo" />
          </a>
        </div>
        <div class="col-md-9">
          <div class="header-right">
            <nav class="menu">
              <ul class="main-menu">
                <li class="mega-menu active">
                  <a href="${home}">Home</a>
                </li>
                <li>
                   <a href="${rec}">Recipe</a>
                </li>
                <li>
                   <a href="${com}">Shop</a>
                </li>
                <li>
                   <a href="${les}">Course</a>
                </li>

                  <c:if test="${!empty memVO}">
					<li class="contact-icon">
						<a href="#" style="margin-right:-30px;"><img src="<%=request.getContextPath()%>/resource/images/contact3.png" width=50px></a>
					</li>
				</c:if>
					<li>
						<div class="btn-wrap">
                     	<jsp:useBean id="comSvc" class="com.commodity.model.ComService"></jsp:useBean>
                     	<c:if test="${!empty sessionScope.memVO}">
                     	<jsp:useBean id="cartSvc" class="com.cart.model.CartService"></jsp:useBean>
                     	<c:set var="cartTotalPrice" value="0" />
                                <div class="mini-cart-wrap">
                                    <div class="mini-cart">
<!--                                     ??????????????? -->
                                        <div class="mini-cart-icon" data-count="${fn:length(cartSvc.getAllByMemID(memVO.memID))}">
                                            <i class="ion-bag"></i>
                                        </div>
                                    </div>
                                    <div class="widget-shopping-cart-content" id="wishlist123">
                                        <ul class="cart-list">
                                        <c:forEach var="cartVO" items="${cartSvc.getAllByMemID(memVO.memID)}">
                                        <li>
<!--                                             ???????????? -->
                                                <a href="#" id=delete class="remove" data-price="${cartVO.cardCount*comSvc.getOneCom(cartVO.comID).comPrice}" data-comID="${cartVO.comID}" data-memID="${memVO.memID}">??</a>
                                                <a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${cartVO.comID}">
<!--                                                 ?????? -->
                                                    <img src = "<%=request.getContextPath()%>/ComPicReader${comSvc.getOneCom(cartVO.comID).comPicSrc}&pic=1"/>
<!--                                                     ???????????? -->
                                                    ${comSvc.getOneCom(cartVO.comID).comName}&nbsp;
                                                </a>
<!--                                                 ?????? ?????? -->
                                                <span class="quantity">${cartVO.cardCount} ?? $${comSvc.getOneCom(cartVO.comID).comPrice}</span>
                                                <c:set var="comCount" value="${cartVO.cardCount}"/>
                                                <c:set var="comPrice" value="${comSvc.getOneCom(cartVO.comID).comPrice}"/>
                                                <c:set var="cartTotalPrice" value="${cartTotalPrice+comCount*comPrice}" />
                                            </li>        
                                        </c:forEach>
                                        </ul>
                                        <p class="total">
                                            <strong>Subtotal:</strong>
<!--                                             ??????????????? -->
                                            <span class="amount">$<span>${cartTotalPrice}</span></span>
                                        </p>
                                        <p class="buttons">
<!--                                         ??????????????? -->
                                            <a href="<%=request.getContextPath()%>/front_end/commodity/listAllCart2.jsp" class="view-cart">View cart</a>
<!--                                             ???????????? -->
                                        </p>
                                    </div>
                                </div>
                      	</c:if>
                            </div>
								   </li>
							<c:if test="${empty sessionScope.memVO}">
                                <li>
                                <a href="<%=request.getContextPath()%>/front_end/member/login.jsp">Login</a>
                                </li>
                            </c:if>
                            
                            <c:if test="${!empty sessionScope.memVO}">
                            <li class="dropdown">
                            	<a href=${mem}>${memVO.memName}</a>
                            	 <ul class="sub-menu">
                    			  <li>
                    			  	<a href="<%=request.getContextPath() %>/front_end/member/mem.do?action=logout&location=<%=request.getRequestURI()%>">??????</a>
                    			  </li>
                  				</ul>
                            </li>
                            </c:if> 
                                </ul>
                            </nav>
                     
                        </div>
                    </div>
                </div>
            </div>
  </header>
<!--   header -->
  <header class="header header-mobile" id="nav123">
    <div class="container">
      <div class="row">
        <div class="col-xs-2">
          <div class="header-left">
            <div id="open-left"><i class="ion-navicon"></i></div>
          </div>
        </div>
        <div class="col-xs-8">
          <div class="header-center">
            <a href="${home}" id="logo-2">
              <img class="logo-image" src="<%=request.getContextPath()%>/resource/images/logo1.png" alt="EATIN Logo" />
            </a>
          </div>
        </div>
        <div class="col-xs-2">
          <div class="header-right">
            <div class="mini-cart-wrap">
            <c:if test="${!empty memVO}">
              <a href="#">
                <div class="mini-cart" style='display:inline-block'>
                	<div class="mini-cart-icon" data-count="${fn:length(cartSvc.getAllByMemID(memVO.memID))}">
                    	<i class="ion-bag"></i>
                    </div>
                </div>
             </a>
          </c:if>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
  <div id="main">
<!--   ????????? -->
    <div class="section">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-12 p-0">
            <div id="rev_slider" class="rev_slider fullscreenbanner">
              <ul>
                <li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-delay="6000" data-rotate="0" data-saveperformance="off" data-title="Slide">
                  <div>
                    <video autoplay muted loop id="myVideo">
                      <source src="<%=request.getContextPath()%>/resource/vedio/strawberry2-2.mp4" type="video/mp4" style="width:100%"> 
                    </video>
                  </div>
                </li>
                <li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="3000"  data-delay="5000" data-rotate="0" data-saveperformance="off" data-title="Slide">
                  <img src="<%=request.getContextPath()%>/resource/images/slider/slide_bg_4.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off" class="rev-slidebg" />
                  <div class="tp-caption rs-parallaxlevel-2" data-x="center" data-hoffset="" data-y="center" data-voffset="-80" data-width="['none','none','none','none']" data-height="['none','none','none','none']" data-type="image" data-responsive_offset="on" data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]' data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
                    <img src="<%=request.getContextPath()%>/resource/images/slider/slide_6.png" alt="" style="margin-top: 100px;" />
                  </div>
                  <div class="tp-caption rs-parallaxlevel-1" data-x="center" data-hoffset="" data-y="center" data-voffset="-120" data-width="['none','none','none','none']" data-height="['none','none','none','none']" data-type="image" data-responsive_offset="on" data-frames='[{"delay":0,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]' data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
                    <img src="<%=request.getContextPath()%>/resource/images/slider/slide_logo2.png" style="margin-top: 100px;" />
                  </div>
                  <a class="tp-caption btn-2 hidden-xs" href="${com}" data-x="['center','center','center','center']" data-y="['center','center','center','center']" data-voffset="['260','260','260','260']" data-width="['auto']" data-height="['auto']" data-type="button" data-responsive_offset="on" data-responsive="off" data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power0.easeIn","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(95,189,116);bg:rgba(51, 51, 51, 0);"}]' data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[16,16,16,16]" data-paddingright="[30,30,30,30]" data-paddingbottom="[16,16,16,16]" data-paddingleft="[30,30,30,30]">Shop Now
                  </a>
                </li>
                <li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="2000" data-delay="6000" data-rotate="0" data-saveperformance="off" data-title="Slide">
                  <img src="<%=request.getContextPath()%>/resource/images/gym/gym21.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off" class="rev-slidebg" />
                  <div class="tp-caption rs-parallaxlevel-1" data-x="right" data-hoffset="" data-y="right" data-voffset="-120" data-width="['none','none','none','none']" data-height="['none','none','none','none']" data-type="image" data-responsive_offset="on" data-frames='[{"delay":0,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]' data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
                    <img src="<%=request.getContextPath()%>/resource/images/gym/gymp2.png" style=" margin-right:-50px;margin-top:-30px" alt="" />
                  </div>
                  <a class="tp-caption btn-2 hidden-xs" id="gymbtn" href="${les}" data-x="['center','center','center','center']" data-y="['center','center','center','center']" data-voffset="['260','260','260','260']" data-width="['auto']" data-height="['auto']" data-type="button" data-responsive_offset="on" data-responsive="off" data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power0.easeIn","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:black;bg:rgba(51, 51, 51, 0);"}]' data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[16,16,16,16]" data-paddingright="[30,30,30,30]" data-paddingbottom="[16,16,16,16]" data-paddingleft="[30,30,30,30]">Join Now
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
<!--  ????????????    -->
    <div class="section section-bg-1 section-cover pt-17 pb-3">
      <div class="container">
        <div class="row">
          <div data-aos="zoom-in-up">
            <div class="col-sm-6">
              <div class="mt-3 mb-3">
                <img id="move" src="<%=request.getContextPath()%>/resource/images/oranges.png" alt="" />
              </div>
            </div>
          </div>
          <div data-aos="fade-up" data-aos-anchor-placement="center-center">
            <div class="col-sm-6">
              <div class="mb-1 section-pretitle default-left">Welcome to</div>
              <h2 class="section-title mtn-2 mb-3">EATIN Store</h2>
              <p class="mb-4">
                EATIN store opened its doors in 1990, it was David's dream to offer the best and widest range of organic foods available, and his mission to promote health in the community and to bring a sense of discovery and adventure into food shopping.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
<!--  ??????????????? -->
    <div class="changepic">
      <div data-aos="zoom-out">
        <div class="text-center mb-1 section-pretitle">Tasty & Function</div>
        <h2 id="changepic_text" class="text-center section-title mtn-2">Health is Wealth</h2>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-6">
            <div class="itempic" data-aos="fade-down"><img class='star' id='star1' src="<%=request.getContextPath()%>/resource/images/change/a_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-up"><img class='star' id='star2' src="<%=request.getContextPath()%>/resource/images/change/b_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-down"><img class='star' id='star3' src="<%=request.getContextPath()%>/resource/images/change/g_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-up"><img class='star' id='star4' src="<%=request.getContextPath()%>/resource/images/change/d_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-down"><img class='star' id='star5' src="<%=request.getContextPath()%>/resource/images/change/e_01.jpg" alt=""></div>
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="itempic" data-aos="fade-up"><img class='star' id='star6' src="<%=request.getContextPath()%>/resource/images/change/z_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-down"><img class='star' id='star7' src="<%=request.getContextPath()%>/resource/images/change/x_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-up"><img class='star' id='star8' src="<%=request.getContextPath()%>/resource/images/change/y_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-down"><img class='star' id='star9' src="<%=request.getContextPath()%>/resource/images/change/r_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-up"><img class='star' id='star10' src="<%=request.getContextPath()%>/resource/images/change/q_01.jpg" alt=""></div>
          </div>
        </div>
      </div>
    </div>
<!--   ??????   -->
    <div class="containerbg">
      <div class="section section-bg-2 section-cover pt-17 pb-3">
        <div class="row">
          <div class="col-sm-12">
            <div data-aos="zoom-out">
              <div class="text-center mb-1 section-pretitle" id="khealthy">Keep Healthy</div>
              <h2 class="text-center section-title mtn-2" style="color: white">New Course</h2>
            </div>
            <div class="EATIN-seperator center mb-6">
              <span class="sep-holder"><span class="sep-line"></span></span>
              <div class="sep-icon"><i class="EATIN-flower"></i></div>
              <span class="sep-holder"><span class="sep-line"></span></span>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="accordion icon-left" id="accordion1">
    <jsp:useBean id="lesSvc" class="com.lesson.model.LesService"/> 
	<c:forEach var="lesVO" items="${lesSvc.allTrueToFront}" begin="0" end="2">
              <div class="gymtext">
                
			<div data-aos="fade-right">
				<a href="<%=request.getContextPath()%>/front_end/lesson/les.do?action=searchOneLesson&lesID=${lesVO.lesID}">
					<table class="table" id="coursetable">
						<tbody class="coursetbody">
						<tr><th> ${lesVO.lesName}</th><td>$ ${lesVO.lesPrice}</td></tr>
						<tr><th>????????????</th><td>${lesVO.lesDate} ${lesVO.lesTime}</td></tr>
						<tr><th>????????????</th><td>${lesVO.lesBegin}~${lesVO.lesEnd}</td></tr>
						<tr><th>????????????</th><td> ${(lesVO.lesAvailable-lesVO.lesAlready)}</td></tr>
						</tbody>
					</table>
				</a>
			</div>

              </div>
              </c:forEach>
            </div>
          </div>
          
          <div class="col-sm-6">
            <div data-aos="zoom-in-up">
              <div class="text-center app-desc floating">
                <img src="<%=request.getContextPath()%>/resource/images/gym/gymp4_2.png" alt="" class="cool" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<!-- ??????     -->   
    <div data-aos="zoom-out">
      <div class="related-title">
        <div class="text-center mb-1 section-pretitle" id="fdelicious">Best Sales</div>
        <h2 class="text-center section-title mtn-2">HOT Products</h2>
      </div>
    </div>

    <div data-aos="fade-right">
      <div class="product-carousel p-0" data-auto-play="true" data-desktop="4" data-laptop="2" data-tablet="2" data-mobile="1" id="product-grid">

<jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService"></jsp:useBean>   
<c:forEach var="comVO" items="${comSvc.allForComindex}" end="4" >
        	<div class="product-item text-center">
              <div class="product-thumb">
                                    <a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${comVO.comID}">
                                        <img src="<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" alt="" style="height:200px" />
                                    </a>
                                    <div class="product-action">
                                        <span class="add-to-cart">
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
                                        </span>
                                        <input type="hidden" id="memID" value="${sessionScope.memVO.memID}">
                                        <input type="hidden" id="comID" value="${comVO.comID}">
                                        <input type='hidden' id='location' value='<%=request.getServletPath()%>'>
                                        <span class="wishlist" style="cursor:pointer;">

                                        </span>
                                        <span class="compare">
                                            Sales:${comVO.comSales}
                                        </span>
                                    </div>
                                </div>
                 				<div class="product-info">
                                    <a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${comVO.comID}">
                                        <h2 class="title">${comVO.comName}</h2>
                                        <span class="price">
                                            <ins>$${comVO.comPrice}</ins>
                                        </span>
                                    </a>
                                </div>
         	</div>	
        </c:forEach>
        
      </div>
    </div>
<!--  ??????    -->
    <div class="section pt-12">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div data-aos="zoom-out">
              <div class="text-center mb-1 section-pretitle">Select Wealthy</div>
              <h2 class="text-center section-title mtn-2">Latest Recipe</h2>
            </div>
            <div class="EATIN-seperator center mb-6">
              <span class="sep-holder"><span class="sep-line"></span></span>
              <div class="sep-icon"><i class="EATIN-flower"></i></div>
              <span class="sep-holder"><span class="sep-line"></span></span>
            </div>
          </div>
        </div>
        <div class="row">
        <jsp:useBean id="jedis" scope='page' class="jedis.util.favorite.JedisHandleFavorite"/>
        <jsp:useBean id="recSvc" scope='page' class="com.recipe.model.RecService"/>
        <c:forEach var="recVO" items="${recSvc.getRecByStatus(2)}" begin="0" end="2">
          <div class="col-md-4">
           <div data-aos="flip-down">
              <div class="blog-grid-item">
                <div class="post-thumbnail">
                  <a href="<%=request.getContextPath()%>/front_end/recipe/rec.do?action=GetRecDetail_ByrecID&recID=${recVO.recID}">
                    <div id="hoverimg">
                      <img src = "<%=request.getContextPath()%>/ComPicReader${recVO.recPicSrc}&pic=1" style="width:400px;height:250px">
                    </div>
                  </a>
                </div>
                <div class="post-content">
                  <div class="entry-meta">
                    <span class="posted-on">
                      <i class="ion-calendar"></i>
                      <span >${recVO.recTime}</span>
                    </span>
                    <span class="comment">
                      <i class="ion-chatbubble-working"></i> ${jedis.getHowManyFav(recVO.recID)}
                    </span>
                  </div>
                  <a href="<%=request.getContextPath()%>/front_end/recipe/rec.do?action=GetRecDetail_ByrecID&recID=${recVO.recID}">
                    <h1 class="entry-title">${recVO.recName}</h1>
                 
                  <div class="entry-content">
                    ${recVO.recContent}
                  </div>
                   </a>
                  <div class="entry-more">
                    <a href="<%=request.getContextPath()%>/front_end/recipe/rec.do?action=GetRecDetail_ByrecID&recID=${recVO.recID}">Read more</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
          
        </div>
<!-- ??????????????? -->
        <div class="row">
          <div class="col-sm-12" id="oneline">
            <hr class="mt-7 mb-3" />
          </div>
        </div>
    </div>
 </div>
<!--  ???????????? -->
 	<div class="section pt-7 pb-7">
       <div class="container" style="position:relative;">
            <sitemesh:write property='body' />
			<div class="dialogue">
				<div id=productArea class=productArea></div>
            	<div id=messagesArea class=messagesArea></div>
 				<div class=inputarea>
 					<input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" /> 
 				</div>
			</div>
        </div>
     </div>
     
     
</div>
<!-- footer -->
    <div class="copyright">
      <div class="container">
        <div class="row">
          <div class="col-md-8">
            Welcome to <a href="#">EATIN Store</a> - All you need is health.
          </div>
          <div class="col-md-4">
            <img src="<%=request.getContextPath()%>/resource/images/footer_payment.png" alt="" />
          </div>
        </div>
      </div>
      <div class="backtotop" id="backtotop"></div>
    </div>
  
  </div>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-migrate.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/modernizr-2.7.1.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/owl.carousel.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.countdown.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/imagesloaded.pkgd.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/isotope.pkgd.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.isotope.init.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.themepunch.tools.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.themepunch.revolution.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.video.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.slideanims.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.actions.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.layeranimation.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.kenburn.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.navigation.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.migration.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.parallax.min.js"></script>
  <script type="text/javascript">
    $("#star1").hover(function() {
      $("#star1").fadeOut(100, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(200, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(300, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(400, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(500, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(100, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(200, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(300, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(400, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(500, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_10.jpg');
        $("#star10").fadeIn();
      });

    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });


    $("#star2").hover(function() {
      $("#star1").fadeOut(200, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(100, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(200, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(300, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(400, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(200, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(100, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(200, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(300, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(400, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });


    $("#star3").hover(function() {
      $("#star1").fadeOut(300, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(200, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(100, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(200, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(300, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(300, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(200, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(100, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(200, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(300, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });




    $("#star4").hover(function() {
      $("#star1").fadeOut(400, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(300, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(200, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(100, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(200, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(400, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(300, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(200, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(100, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(200, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');
    });

    $("#star5").hover(function() {
      $("#star1").fadeOut(500, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(400, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(300, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(200, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(100, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(500, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(400, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(300, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(200, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(100, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });

    $("#star6").hover(function() {
      $("#star1").fadeOut(100, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(200, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(300, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(400, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(500, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(100, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(200, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(300, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(400, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(500, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_10.jpg');
        $("#star10").fadeIn();
      });

    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });
    $("#star7").hover(function() {
      $("#star1").fadeOut(200, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(100, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(200, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(300, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(400, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(200, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(100, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(200, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(300, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(400, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });
    $("#star8").hover(function() {
      $("#star1").fadeOut(300, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(200, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(100, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(200, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(300, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(300, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(200, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(100, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(200, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(300, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });
    $("#star9").hover(function() {
      $("#star1").fadeOut(400, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(300, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(200, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(100, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(200, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(400, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(300, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(200, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(100, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(200, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');
    });
    $("#star10").hover(function() {
      $("#star1").fadeOut(500, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(400, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(300, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(200, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(100, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(500, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(400, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(300, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(200, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(100, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });
    </script>
    
<script type="text/javascript">
//     ????????????
    var contextPath = "${pageContext.request.contextPath}";
    $("div.dialogue").hide();
   
    $("ul.cart-list").on("click","#delete",function(e){
    	e.stopPropagation();
    	console.log(this);
    	let price = $(this).attr("data-price");
    	let memID = $(this).attr("data-memID");
    	let comID = $(this).attr("data-comID");
    	let cartVO = $(this).parent();
		$.ajax({
			url:"<%=request.getContextPath()%>/cart/comCart.do",
			type:"POST",
			 data:{
				 action : "delete_Cart",
				 memID : memID,
				 comID : comID
			 },
			 dataType : "json",
			 cache:false,
			 ifModified :true,
		     success:function(data){
		    	 $("div.mini-cart-icon").attr("data-count", $("div.mini-cart-icon").attr("data-count")-1);
		    	 cartVO.remove();
		    	 $("span.amount").children("span").text($("span.amount").children("span").text()-price);
		     }
		});
	});
  
    $(document).on('show.bs.modal', '.modal', function () {
  	  $(this).appendTo('body');
  	});
    
    $("li.contact-icon>a").click(function(e){
    	e.preventDefault();
    	$(".contact-icon a").toggleClass("openMsgs");
    	$(".contact-icon a").attr("data-count",0);
    	if($(".contact-icon a").hasClass("contactMsgs")){
        	$(".contact-icon a").toggleClass("contactMsgs");
    	}
    	$("div.dialogue").toggle();
    	if(!webSocket){
    		connect();
    	}
    	dialogue.scrollTop = dialogue.scrollHeight;
    });
 
    <c:if test="${!empty memVO}">
	memID = ${memVO.memID};
	</c:if>
    
	var MyPoint = "/ServiceWS/member/"+memID;
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	var messagesArea = document.getElementById("messagesArea");
	var productArea = document.getElementById("productArea");
	var self = "member"+'${memVO.memID}';
	var selfName = '${memVO.memName}';
	var webSocket;
	var dialogue = $("div.messagesArea")[0];
	<c:if test="${!empty memVO}">
		connect();
	</c:if>
	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);
		webSocket.onopen = function(event) {
			console.log("Connect Success!");
			getHistory();
		};

		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			if ("history" === jsonObj.type) {
				
				// ?????????jsonObj.message??????redis????????????????????????????????????parse???JSON????????????
				var messages = JSON.parse(jsonObj.message);
				
				for (var i = 0; i < messages.length; i++) {
					var jsonObj = JSON.parse(messages[i]);
					
					if(jsonObj.lesVO){
						$("#productArea").empty();
						let div = document.createElement('div');
						let html="<ul class='cart-list'><li><img src =";
						html += contextPath+jsonObj.lesVO.pic+">";
						html += jsonObj.lesVO.lesName+"</li></ul>";
						div.innerHTML= html;
						productArea.append(div);
					}
					if(jsonObj.comVO){
						$("#productArea").empty();
						let div = document.createElement('div');
						let html="<ul class='cart-list'><li><img src =";
						html += contextPath+"/ComPicReader"+jsonObj.comVO.comPicSrc+"&pic=1>";
						html += jsonObj.comVO.comName+"</li></ul>";
						div.innerHTML= html;
						productArea.append(div);
					}
					
					if(jsonObj.sender===self){
						let div = document.createElement('div');
						let html="<div class='user local'><div class='avatar'>";
						html+="<div class='pic'><img src=''></div>";
						html+="<div class='name'>"+selfName+"</div></div>";
						html+="<div class='text'>"+jsonObj.message+"</div></div>";
						div.innerHTML= html;
						messagesArea.append(div);
					}else{
						let div = document.createElement('div');
						let html="<div class='user remote'><div class='avatar'>";
						html+="<div class='pic'><img src=''></div>";
						html+="<div class='name'>"+jsonObj.sender+"</div></div>";
						html+="<div class='text'>"+jsonObj.message+"</div></div>";
						div.innerHTML= html;
						messagesArea.append(div);
					}
				}
				dialogue.scrollTop = dialogue.scrollHeight;
			} else if ("chat" === jsonObj.type) {	
					
				if(!$(".contact-icon a").hasClass("openMsgs")){
					if(typeof $(".contact-icon a").attr("data-count") == "undefined"){
						$(".contact-icon a").attr("data-count",1);
						$(".contact-icon a").addClass("contactMsgs");
					}else{
						let count = +$(".contact-icon a").attr("data-count")+1;
						$(".contact-icon a").attr("data-count",count);
						$(".contact-icon a").addClass("contactMsgs");
					}
				}
				if(jsonObj.lesVO){
					$("#productArea").empty();
					let div = document.createElement('div');
					let html="<ul class='cart-list'><li><img src =";
					html += contextPath+jsonObj.lesVO.pic+">";
					html += jsonObj.lesVO.lesName+"</li></ul>";
					div.innerHTML= html;
					productArea.append(div);
				}
				if(jsonObj.comVO){
					$("#productArea").empty();
					let div = document.createElement('div');
					let html="<ul class='cart-list'><li><img src =";
					html += contextPath+"/ComPicReader"+jsonObj.comVO.comPicSrc+"&pic=1>";
					html += jsonObj.comVO.comName+"</li></ul>";
					div.innerHTML= html;
					productArea.append(div);
				}
				
				if(jsonObj.sender===self){
					let div = document.createElement('div');
					let html="<div class='user local'><div class='avatar'>";
					html+="<div class='pic'><img src=''></div>";
					html+="<div class='name'>"+selfName+"</div></div>";
					html+="<div class='text'>"+jsonObj.message+"</div></div>";
					div.innerHTML= html;
					messagesArea.append(div);
				}else{
					let div = document.createElement('div');
					let html="<div class='user remote'><div class='avatar'>";
					html+="<div class='pic'><img src=''></div>";
					html+="<div class='name'>"+"admin"+"</div></div>";
					html+="<div class='text'>"+jsonObj.message+"</div></div>";
					div.innerHTML= html;
					messagesArea.append(div);
				}
				dialogue.scrollTop = dialogue.scrollHeight;
			}
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	function sendMessage() {
		var inputMessage = document.getElementById("message");
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else {
			var jsonObj = {
				"type" : "chat",
				"lesID":lesID,
				"comID":comID,
				"sender" : "member"+memID,
				"receiver" : "admin",
				"message" : message
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
	function getHistory() {
		var jsonObj = {
				"type" : "history",
				"sender" : "member"+memID,
				"receiver" : "admin",
				"message" : ""
			};
		webSocket.send(JSON.stringify(jsonObj));
	}
	
	function disconnect() {
		webSocket.close();
	}
</script>	
<script>
<c:if test="${!empty comVO}">
comID = ${comVO.comID};
</c:if>
</script>
<script type="text/javascript">

	    $(document).ready(function(){
	
	        $(".wishlist").each(function(){
				let wishlist=$(this);
	        	let comID =wishlist.prev().prev().val();
				let memID = wishlist.prev().prev().prev().val();
				let location = wishlist.prev().val();
				if(memID===null||memID===''){
					wishlist.prepend("<img src='<%=request.getContextPath()%>/resource/images/heartempty.png' alt='' />");
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/front_end/commodity/comf.do",
						type:"post",
						data:{
							action:"firstload",
							comID:comID,
							memID:memID,
						},
						cache:false,
						ifModified :true,
						success : function(date){
							if(date==="true"){
							console.log("123");
								wishlist.prepend("<img src='<%=request.getContextPath()%>/resource/images/heart.png' alt='' />");
								
							}else{
								wishlist.prepend("<img src='<%=request.getContextPath()%>/resource/images/heartempty.png' alt='' />");
								
							}
						}
					});
				}
	        });
	    });
	    
	    $(".wishlist").click(function(){
	    	let wishlist=$(this);
        	let comID =wishlist.prev().prev().val();
			let memID = wishlist.prev().prev().prev().val();
			let location = wishlist.prev().val();
			if(memID == ''){
				window.location.href = "<%=request.getContextPath()%>/cart/comCart.do?action=ADD&location="+location+"&comID="+comID+"";
				return;
			}

			$.ajax({
				url:"<%=request.getContextPath()%>/front_end/commodity/comf.do",
				type:"post",
				data:{
					action:"insertByRedis",
					comID:comID,
					memID:memID,
				},
				cache:false,
				ifModified :true,
				success : function(date){
					if(date==="true"){
						wishlist.empty();
						wishlist.prepend("<img src='<%=request.getContextPath()%>/resource/images/heart.png' alt='' />");
					}else{
						wishlist.empty();
						wishlist.prepend("<img src='<%=request.getContextPath()%>/resource/images/heartempty.png' alt='' />");
					}
				}
			});
			
		 });
		$("#product-grid").on("click",".add-to-cart",function(){
			let memID = $(this).next().val();
			let comID = $(this).next().next().val();
			console.log($(this));
			console.log(memID);
			console.log(comID);
			if(memID == ""){
				window.location.href = "<%=request.getContextPath()%>/cart/comCart.do?action=ADD&location=<%=request.getServletPath()%>&comID="+comID+"";
				return;
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/cart/comCart.do",
				type:"post",
				data:{
					action:"ADD",
					comID:comID,
					cardCount:1
				},
				cache:false,
				ifModified :true,
				success : function(){
					window.location.reload();
				}
			});
		});
		
    </script>    	

  
  

  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();

  </script>
</body>

</html>


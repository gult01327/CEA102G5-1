<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>


	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script2.js"></script>


    
    
    <!-- link -->
    <link rel="stylesheet" href="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/resource/css/table.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/font-awesome.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/ionicons.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/owl.carousel.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/owl.theme.css" type="text/css" media="all" />
    <link rel='stylesheet' href='<%=request.getContextPath()%>/resource/css/prettyPhoto.css' type='text/css' media='all' />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/custom.css" type="text/css" media="all" />
    <link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
    <title>EatinBack</title>
    
    <style>
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
  	width: 500px;
  	display:flex;
  	height:350px;
  	padding: 5px 20px;
  	box-shadow: 0 0 10px #000;
  	background-color: #f4f5f7;
  	border-radius: 20px;
}
.messagesArea{
	overflow:auto;
}
.dialogueMain{
	width:400px;
	overflow:auto;
	position:relative;
	display:flex;
	flex-direction:column;
	justify-content:flex-end;
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
.contactMembermsgs{
	position:relative;
	background-color:light-green;
}
.contactMembermsgs::after {
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
  right: 24%;
  background-color: #02F78E;
}
.contactMembermsg{
	position:relative;
	background-color:light-green;
}
.contactMembermsg::after {
  content: attr(data-count);
  position: absolute;
  font-size: 14px;
  text-align: center;
  line-height: 16px;
  height: 16px;
  width: 16px;
  border-radius: 16px;
  color: #fff;
  background-color: #02F78E;
}
.contactMemberList ul{
display:flex;
flex-direction:column-reverse;
width:100px;
}
.msgActive{
    order: -1;
    flex: 1 0 100%;
}
.memberMsgLatest{
	color:#aaa;
	text-align:left;
	text-overflow: ellipsis;
}

a.contactMember{
	display:flex;
	flex-direction:column;
	flex-wrap:wrap;
	height:50px;
	width:auto;
}
div.contactMemberList{
	max-height: 290px;
    overflow: auto;
    width: 170px;
}
div.memberListMain{
	width:200px;
}
.memberPic {
  border-radius: 50%;
  overflow: hidden;
  width:50px;
  height:100%;
}
.memberPic img {
  width:auto;
 
}

   .header-right{
    margin-right:-40px;
    }
    
    #logoutmenu{
    min-width: 100px;
    }
    
    #rowchange{
    margin-right:0px;
    margin-left:-30px;
    }
    .header{
    background-color:#333;
    height:120px;
    }
	.header.scrolling-menu{
	background-color:#333;
	height:95px;
	}
	.logo-image{
	width:65%;
	}
	.headfont{
	color:#aaa;
	}
 	</style>
   
</head>

<body>
    <c:set var="addLes" value="${pageContext.request.contextPath}/back_end/lesson/addLesson.jsp" />
    <c:set var="searchLes" value='${pageContext.request.contextPath}/back_end/lesson/mainLesson.jsp' />
    <c:set var="updateLes" value='${pageContext.request.contextPath}/back_end/lesson/updateLesson.jsp' />
    <c:set var="lesResult" value='${pageContext.request.contextPath}/back_end/lesson/listQueryLesson.jsp' />
    <c:set var="listAllLes" value='${pageContext.request.contextPath}/back_end/lesson/listAllLesson.jsp' />
    <c:set var="addCoa" value='${pageContext.request.contextPath}/back_end/coach/addCoach.jsp' />
    <c:set var="searchCoa" value='${pageContext.request.contextPath}/back_end/coach/mainCoach.jsp' />
    <c:set var="updateCoa" value='${pageContext.request.contextPath}/back_end/coach/updateCoach.jsp' />
    <c:set var="coaResult" value='${pageContext.request.contextPath}/back_end/coach/listOneCoach.jsp' />
    <c:set var="listAllCoa" value='${pageContext.request.contextPath}/back_end/coach/listAllCoach.jsp' />
    <c:set var="addTal" value='${pageContext.request.contextPath}/back_end/talent/addTalent.jsp' />
    <c:set var="searchTal" value='${pageContext.request.contextPath}/back_end/talent/mainTalent.jsp' />
    <c:set var="updateTal" value='${pageContext.request.contextPath}/back_end/talent/updateTalent.jsp' />
    <c:set var="talResult" value='${pageContext.request.contextPath}/back_end/talent/listOneTalent.jsp' />
    <c:set var="listAllTal" value='${pageContext.request.contextPath}/back_end/talent/listAllTalent.jsp' />
    <c:set var="listLesByCoa" value='${pageContext.request.contextPath}/back_end/lesson/listLessonForCoach.jsp' />
    
<!--????????? -->
    <c:set var="addAdmin" value='${pageContext.request.contextPath}/back_end/admin_info/addAdmin.jsp' />
    <c:set var="listAllAdmin" value='${pageContext.request.contextPath}/back_end/admin_info/listAllAdmin.jsp' />
    <c:set var="updateAdmin" value='${pageContext.request.contextPath}/back_end/admin_info/updateAdmin.jsp' />
    

<!-- ?????? -->
<!-- ????????????     -->
<c:set var="addComc" value='${pageContext.request.contextPath}/back_end/commodity/addComc.jsp' />
<c:set var="listAllComc" value='${pageContext.request.contextPath}/back_end/commodity/listAllComc.jsp' />
<!-- ?????? -->
<c:set var="addCom" value='${pageContext.request.contextPath}/back_end/commodity/addCom.jsp' />
<c:set var="listAllCom" value='${pageContext.request.contextPath}/back_end/commodity/listAllCom.jsp' />
<c:set var="comSelectPage" value='${pageContext.request.contextPath}/back_end/commodity/comSelectPage.jsp' />
<c:set var="updateCom" value='${pageContext.request.contextPath}/back_end/commodity/updateCom.jsp' />
<c:set var="listCom_ByCompositeQuery" value='${pageContext.request.contextPath}/back_end/commodity/listCom_ByCompositeQuery.jsp' />
<c:set var="listAllComComment" value='${pageContext.request.contextPath}/back_end/commodity/listAllComComment.jsp' />
<c:set var="listOneCom" value='${pageContext.request.contextPath}/back_end/commodity/listOneCom.jsp' />
<!-- ?????? -->
<c:set var="listAllOm" value='${pageContext.request.contextPath}/back_end/commodity/listAllOm.jsp' />
<c:set var="listOd_ByOmID" value='${pageContext.request.contextPath}/back_end/commodity/listOd_ByOmID.jsp' />
<!-- ?????? -->
<c:set var="memSelect" value='${pageContext.request.contextPath}/back_end/member/memSelect.jsp' />
<c:set var="listAllMem" value='${pageContext.request.contextPath}/back_end/member/listAllMem.jsp' />
<c:set var="listOneMem" value='${pageContext.request.contextPath}/back_end/member/listOneMem.jsp' />
<c:set var="updateMem" value='${pageContext.request.contextPath}/back_end/member/updateMem.jsp' />


<!-- ?????? -->
<c:set var="addRes" value="${pageContext.request.contextPath}/back_end/reservation/addReservation.jsp" />
<c:set var="searchRes" value="${pageContext.request.contextPath}/back_end/reservation/searchReservation.jsp" />
<c:set var="searchResByMem" value="${pageContext.request.contextPath}/back_end/reservation/listByMember.jsp" />
<c:set var="searchResByLes" value="${pageContext.request.contextPath}/back_end/reservation/listByLesson.jsp" />
<c:set var="updateRes" value="${pageContext.request.contextPath}/back_end/reservation/updateReservation.jsp" />

<!-- ?????? -->
<c:set var="listAllRec_Stop" value='${pageContext.request.contextPath}/back_end/recipe/listAllRec_Stop.jsp' />
<c:set var="listAllRec_Approve" value='${pageContext.request.contextPath}/back_end/recipe/listAllRec_Approve.jsp' />
<c:set var="listAllRec" value='${pageContext.request.contextPath}/back_end/recipe/listAllRec.jsp' />
<c:set var="listAllRecReport" value='${pageContext.request.contextPath}/back_end/recipe/listAllRecReport.jsp' />
<c:set var="listAllRecbReport" value='${pageContext.request.contextPath}/back_end/recipe/listAllRecb_Report.jsp' />
    <div class="site">

        <header id="header" class="header header-desktop header-2">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <a href="#" id="logo">
                            <img class="logo-image" src="<%=request.getContextPath()%>/resource/images/logo4_white.png" alt="Organik Logo" />
                        </a>
                    </div>
                    <div class="col-md-9">
                        <div class="header-right">
                            <nav class="menu">
                                <ul class="main-menu" style="margin-right:-10px;">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/back_end/back_end_index.jsp" class="headfont">Home</a>
                                    </li>
                                   	<c:if test='${funList.contains("??????")}'>
                                    <li class="dropdown">
                                        <a href="#" class="headfont">Course</a>
                                        <ul class="sub-menu">
                                            <li><a href="#">Course</a></li>
                                            <li><a href="#">Coach</a></li>
                                            <li><a href="#">Talent</a></li>
                                            <li><a href="#">Reservation</a></li>
                                        </ul>
                                    </li>
                                    </c:if>
                                    <c:if test='${funList.contains("??????")}'>
                                    <li class="dropdown">
                                        <a href="#" class="headfont">Shop</a>
                                        <ul class="sub-menu">
                                        	<li><a href="#">Commodity</a></li>
                                            <li><a href="#">Category</a></li>
                                            <li><a href="#">Order</a></li>
                                        </ul>
                                    </li>
                                    </c:if>
                                    <c:if test='${funList.contains("??????") }'>
                                    <li class="dropdown">
                                        <a href="#" class="headfont">Recipe</a>
                                        <ul class="sub-menu">
                                            <li><a href="#">Recipe</a></li>
                                        </ul>
                                    </li>
                                    </c:if>
                                    <c:if test='${funList.contains("??????") }'>
                                    <li class="dropdown">
                                        <a href="#" class="headfont">Member</a>
                                        <ul class="sub-menu">
                                            <li><a href="#">Member</a></li>
                                        </ul>
                                    </li>
                                    </c:if>
                                    <c:if test='${funList.contains("?????????") }'>
                                    <li class="dropdown">
                                        <a href="#" class="headfont">Admin</a>
                                        <ul class="sub-menu">
                                            <li><a href="#">Admin</a></li>
                                        </ul>
                                    </li>
                                    </c:if>

                            		<c:if test="${empty sessionScope.coaVO}">
								          	<li class="contact-icon">
								            	<a href="#" style="margin-right:-20px;"><img class="mic123" src="<%=request.getContextPath()%>/resource/images/backContact2.png" width=50px></a>
								            </li>
                                	</c:if>

                             <li class="dropdown"><a href="#" class="headfont">${(empty sessionScope.coaVO)? sessionScope.admiVO.admName:sessionScope.coaVO.coaName}</a>
                            	 <ul class="sub-menu" id="logoutmenu">
                    			  <li>
                    			  <div>
                    			  	<a href="<%=request.getContextPath()%>/admin_info/admi.do?action=logOut">??????</a>
                    			  	</div>
                    			  </li>
                  				</ul>
                            </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <header class="header header-mobile">
            <div class="container">
                <div class="row">
                    <div class="col-xs-2">
                        <div class="header-left">
                            <div id="open-left"><i class="ion-navicon"></i></div>
                        </div>
                    </div>
                    <div class="col-xs-8">
                        <div class="header-center">
                            <a href="html-organik.html" id="logo-2">
                                <img class="logo-image" src="<%=request.getContextPath()%>/resource/images/logo4_white.png" alt="Organik Logo" style="width:35%;margin-top:-15px;"/>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="header-right">
                            <div class="mini-cart-wrap">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="section pt-7 pb-7">
            <div class="container">
                <div class="row" id="rowchange">
                    <div class="col-md-10 col-md-push-2">
                        <!--?????? -->
                        <div class="category-carousel-2 mb-3" data-auto-play="true" data-desktop="3" data-laptop="3" data-tablet="2" data-mobile="1">
                            <div class="cat-item">
                                <sitemesh:write property='body' />
  <div class="dialogue">
  <div class=memberListMain>MemberList
  <div class="searchBtn">
  	<input style="width:70px;height:25px;" placeHolder="search">
  	<a href="#">
    	<i class="ion-search"></i>
    </a>
  </div>
  <div class="contactMemberList">
  <jsp:useBean id="memSvc" class="com.member.model.MemService"></jsp:useBean>
  <ul>
  <c:forEach var="memVO" items="${memSvc.all}">
  	<a id="member${memVO.memID}" href="#" class="contactMember" data-memID="member${memVO.memID}" style="order:0">
		<li style="order:2;" class="memberID">ID:${memVO.memID}-${memVO.memName}</li>
		<div style="order:3;" class="memberMsgLatest" id="member${memVO.memID}Latest"></div>
		<div class="memberPic" style="order:1;"><img src="<%=request.getContextPath()%>/commodity/comPic.do${memVO.memPicSrc}&pic=1"/></div>
  	</a>
  </c:forEach>
  </ul>
  </div>
  </div>
  <div class="dialogueMain">
			<div id=productArea class=productArea>
			</div>
            <div id=messagesArea class=messagesArea>
			</div>
 	<div class=inputarea>
 	<input id="message" class="text-field" type="text" placeholder="Message" /> 
 	</div>
 </div>
 </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-md-pull-10">
                        <div class="sidebar">
                            <!--????????????link -->
                            <div class="widget widget-product-categories">
                                <h3 class="widget-title">Categories</h3>
                                <ul class="product-categories">
                                    <div id=Course>
                                    	<li><a href=${addLes}>????????????</a></li>
                                        <li><a href=${searchLes}>????????????</a></li>
                                        <li><a href=${updateLes}>????????????</a></li>
                                        <li><a href=${lesResult} class=disabled>????????????</a></li>
                                        <li><a href=${listAllLes}>????????????</a></li>
                                    </div>
                                    <div id=Coach>
                                        <li><a href=${addCoa}>????????????</a></li>
                                        <li><a href=${searchCoa}>????????????</a></li>
                                        <li><a href=${updateCoa}>????????????</a></li>
                                        <li><a href=${coaResult} class=disabled>????????????</a></li>
                                        <li><a href=${listAllCoa}>????????????</a></li>
                                    </div>
                                    <div id=Talent>
                                        <li><a href=${addTal}>????????????</a></li>
                                        <li><a href=${searchTal}>????????????</a></li>
                                        <li><a href=${updateTal}>????????????</a></li>
                                        <li><a href=${talResult} class=disabled>????????????</a></li>
                                        <li><a href=${listAllTal}>????????????</a></li>
                                    </div>
                                    <div id=Reservation>                                      
                                        <li><a href=${searchRes}>??????????????????</a></li> 
                                        <li><a href=${updateRes}>??????????????????</a></li> 
                                        <li><a href=${searchResByMem} class=disabled>??????????????????</a></li>
                                        <li><a href=${searchResByLes} class=disabled>??????????????????</a></li>                                    
                                    </div>
                                    <div id=Category>
                                    	<li><a href=${addComc}>????????????</a></li>
		                            	<li><a href=${listAllComc}>????????????</a></li>
                                    </div>
                                    <div id=Commodity>
                                    	<li><a href=${addCom}>????????????</a></li>
                                    	<li><a href=${listAllCom}>????????????</a></li>
                                    	<li><a href=${comSelectPage}>????????????</a></li>
                                    	<a href=${listCom_ByCompositeQuery} class=disabled></a>
                                    	<a href=${updateCom} class=disabled></a>
                                    	<a href=${listOneCom} class=disabled></a>
		                            	
                                    </div>
                                    <div id=Recipe>
                                   
                                    	<li><a href=${listAllRec_Approve}>????????????(?????????)</a></li>
                                    	<li><a href=${listAllRec}>????????????(?????????)</a></li>
                                    	<li><a href=${listAllRec_Stop}>????????????(?????????)</a></li>
                                    	<li><a href=${listAllRecReport}>??????????????????</a></li>
                                    	<li><a href=${listAllRecbReport}>????????????????????????</a></li>
                                    </div>
                                    
                                    <div id=Order>
                                   		<li><a href=${listAllOm}>????????????</a></li>
                                   		<a href=${listOd_ByOmID} class=disabled></a>
                                   		<li><a href=${listAllComComment}>???????????????</a></li>
                                   		
                                    </div>
                                    <div id=Member>
                                    	<li><a href=${listAllMem}>????????????</a></li>
                                    	<li><a href=${updateMem} class=disabled>????????????</a></li>
                                    	<li><a href=${memSelect}>????????????</a></li>
                                    	<li><a href=${listOneMem} class=disabled>????????????</a></li>
                                    	
                                    	
                                    
                                    </div>
                                    <div id=Admin>
                                        <li><a href=${addAdmin}>????????????</a></li>
                                        <li><a href=${listAllAdmin}>????????????</a></li>
                                        <li><a href=${updateAdmin} class=disabled>???????????????</a></li>
                                    </div>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
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
    
                                 
    
    <script type="text/javascript">
    
    var contextPath = "${pageContext.request.contextPath}";
    $("div.dialogue").hide();
    $("ul.product-categories").children().hide();
    $("ul.product-categories").parent().hide();
    $("ul.sub-menu>li>a").click(function(e){
    	e.preventDefault();
    	$("ul.product-categories").children().hide();
    	$("ul.product-categories").children("#"+$(this).text()).show();
    	$("ul.product-categories").parent().show();
    });
    
    openRow(servletPathName);
    function openRow(str){	
		if(str !="<%=request.getContextPath()%>/back_end/back_end_index.jsp" ){
    		let link = $("a[href='"+str+"']");
        	if(link){
        		link.parent().addClass("active");
        		link.css("color","#fff");
            	link.css("background-color","#8fbc8f");
            	link.parent().show();
            	link.parent().parent().show();
            	$("ul.product-categories").parent().show();
        	}
		}
    }
    
    $(document).on('show.bs.modal', '.modal', function () {
  	  $(this).appendTo('body');
  	});
    </script>
    
    <script>
    $(".searchBtn a").click(function(e){
    	e.preventDefault();
    	let search = $(".searchBtn>input").val();
    	let array = $(".contactMember").children("li");
    	for(let i = 0; i < array.length ; i++){
    		array.eq(i).parent().css("display","none");
    		if ( array.eq(i).text().indexOf(search) != -1 ){
    			array.eq(i).parent().css("display","");	
    		}
    	}
    });
    var memberArray=[];
    
    $("li.contact-icon>a").click(function(e){
    	e.preventDefault();
    	$("div.dialogue").toggle();
    	$(".contact-icon a").toggleClass("openMsgs");
    	$(".contact-icon a").attr("data-count",0);
	if($(".contact-icon a").hasClass("contactMembermsgs")){
    	$(".contact-icon a").toggleClass("contactMembermsgs");
}
    	if(!webSocket){
    		connect();
    	}
    	dialogueMain.scrollTop = dialogueMain.scrollHeight;
    	for(let i = 0 ; i<$(".contactMember").length ; i++){
    		getHistoryForLeft($(".contactMember").eq(i).attr("data-memid"));
    		memberArray[i]=$(".contactMember").eq(i).attr("data-memid");
    	}
    });
    
    $("#message").keydown(function(e){
    	if (e.keyCode == 13){
    		sendMessage($(this));
    	}
    });
    
	
    
	$("body").on("click",".contactMember",function(e){
		e.preventDefault();
		let memberID = $(this).attr("data-memid");
		$(this).attr("data-count",0);
		$(this).removeClass("contactMembermsg");
		$("div.productArea").empty();
		$("div.messagesArea").empty();
		$("div.messagesArea").attr("data-memid",memberID);
		getHistory(memberID);
	});
    
    let admID=${admiVO.admID};
    let lesID="-1";
    let comID="-1";
    
	var MyPoint = "/ServiceWS/admin/"+admID;
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	var messagesArea = document.getElementById("messagesArea");
	var self = "admin";
	var selfName = 'admin';
	var webSocket;
	var dialogueMain = $("div.messagesArea")[0];
	
    connect();
	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);
		webSocket.onopen = function(event) {
			console.log("Connect Success!");
		};

		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			if ("historyForLeft" === jsonObj.type) {
				let messages = JSON.parse(jsonObj.message);
				for(let i = 0; i < messages.length; i++){
					var jsonObj = JSON.parse(messages[i]);
					if (jsonObj.sender.indexOf(memberArray) || jsonObj.receiver.indexOf(memberArray)){
							$("#"+jsonObj.sender+"Latest").html(jsonObj.message);
							$("#"+jsonObj.receiver+"Latest").html(jsonObj.message);
					}
				}
			}else if ("history" === jsonObj.type) {
				console.log(jsonObj);
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
						let html="<div class='user remote' data-memID="+jsonObj.sender+"><div class='avatar'>";
						html+="<div class='pic'><img src=''></div>";
						html+="<div class='name'>"+jsonObj.sender+"</div></div>";
						html+="<div class='text'>"+jsonObj.message+"</div></div>";
						div.innerHTML= html;
						messagesArea.append(div);
						messagesArea.setAttribute("data-memID",jsonObj.sender);
					}
				}
				dialogueMain.scrollTop = dialogueMain.scrollHeight;
			} else if ("chat" === jsonObj.type) {
				if(!$(".contact-icon a").hasClass("openMsgs")){
					if(typeof $(".contact-icon a").attr("data-count") == "undefined"){
						$(".contact-icon a").attr("data-count",1);
						$(".contact-icon a").addClass("contactMembermsgs");
					}else{
						let count = +$(".contact-icon a").attr("data-count")+1;
						$(".contact-icon a").attr("data-count",count);
						$(".contact-icon a").addClass("contactMembermsgs");
					}
				}
				if($("#messagesArea").attr("data-memid")===jsonObj.sender || $("#messagesArea").attr("data-memid")===jsonObj.receiver){
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
					$("#"+jsonObj.receiver+"Latest").html(jsonObj.message);
				}else{
					let div = document.createElement('div');
					let html="<div class='user remote'><div class='avatar'>";
					html+="<div class='pic'><img src=''></div>";
					html+="<div class='name'>"+jsonObj.sender+"</div></div>";
					html+="<div class='text'>"+jsonObj.message+"</div></div>";
					div.innerHTML= html;
					messagesArea.append(div);
					messagesArea.setAttribute("data-memID",jsonObj.sender);
					$("#"+jsonObj.sender+"Latest").html(jsonObj.message);
				}
				dialogueMain.scrollTop = dialogueMain.scrollHeight;
				}else{
					if(typeof $("#"+jsonObj.sender).attr("data-count") == "undefined"){
						$("#"+jsonObj.sender).attr("data-count",1);
// 						$("#"+jsonObj.sender).addClass("msgActive");
						$("#"+jsonObj.sender).css("order",countOrder());
						$("#"+jsonObj.sender).siblings().removeClass("msgActive");
						$("#"+jsonObj.sender).addClass("contactMembermsg");
					}else{
						let count = +$("#"+jsonObj.sender).attr("data-count")+1;
// 						$("#"+jsonObj.sender).addClass("msgActive");
						$("#"+jsonObj.sender).css("order",countOrder());
						$("#"+jsonObj.sender).siblings().removeClass("msgActive");
						$("#"+jsonObj.sender).attr("data-count",count);
						$("#"+jsonObj.sender).addClass("contactMembermsg");
					}
				}
			}
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	function countOrder(){
		let maxOrder = 0;
		for(let i = 0 ; i < $(".contactMember").length ; i++){
			if(+$(".contactMember").eq(i).css("order") > maxOrder){
				maxOrder = +$(".contactMember").eq(i).css("order");
			}
		}
		return maxOrder+1;
	}
	
	
	function sendMessage(e) {
		var inputMessage = document.getElementById("message");
		var message = inputMessage.value.trim();
		console.log(e.parent().parent().children("#messagesArea"));
		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else {
			var jsonObj = {
				"type" : "chat",
				"lesID":lesID,
				"comID":comID,
				"sender" : "admin",
				"receiver" : e.parent().parent().children("#messagesArea").attr("data-memID"),
				"message" : message
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
	function getHistory(memberID) {
		var jsonObj = {
				"type" : "history",
				"sender" : "admin",
				"receiver" : memberID,
				"message" : ""
			};
		webSocket.send(JSON.stringify(jsonObj));
	}
	
	function getHistoryForLeft(memberID) {
		var jsonObj = {
				"type" : "historyForLeft",
				"sender" : "admin",
				"receiver" : memberID,
				"message" : ""
			};
		webSocket.send(JSON.stringify(jsonObj));
	}
	function disconnect() {
		webSocket.close();
	}
</script>
    
   
</body>




</html>
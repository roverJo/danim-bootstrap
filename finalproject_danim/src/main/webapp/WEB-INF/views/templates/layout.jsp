<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<title>DANIM</title>
<meta charset="utf-8">
<meta name = "format-detection" content = "telephone=no" />
<!-- 다님 로고 삽입 -->
<link rel="icon" href="resources/img/logo.png">
<link rel="shortcut icon" href="resources/img/logo.png" />

<script type="text/javascript" src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>

<!-- 유진이꺼 -->
<script type="text/javascript" src="${initParam.root}resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
#main {
	/* background: url(resources/bootstrap/images/bg.jpg) no-repeat center fixed; */
	background: url(resources/img/back1.jpg) no-repeat center fixed;
	-webkit-background-size: cover;
	/* 	background-size: cover; */
}

.addHeight {
	height: 30px;
}

.community {
	background-color: #fdfdcc;
	/* padding: 10px; */
}

.custab {
	border: 1px solid #ccc;
	padding: 5px;
	/* margin: 5% 0; */
	box-shadow: 3px 3px 2px #ccc;
	transition: 0.5s;
	background-color: white;
}
.custab tr>th{
	border: 1px solid white;
	color: white;
	text-align: center;
	background-color: #ec9e9e;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 0.5s;
}

#contact-area {
	width: 400px;
	background-color: #fdfdcc;
	padding: 5px;
}

.btn-md-4 {
	width: 33.33333333333333%;
	float: center;
}

.selectArea {
	display: table;
	margin-left: 25%;
	margin-right: 30%;
	display: inline-block;
}

.searchForm {
	width: 350px;
	/* margin-top: 10px;
		margin-bottom: 30px;
		margin-left: 20px;
		margin-right: 10px; */
	margin-left: 20px;
	/* 	padding: 10px;  */
	/* 	text-align: left; */
	background-color: #ffffff;
}

.thumimg {
	width: 100%;
	max-width: 350px;
	height: 100%;
	max-height: 200px;
	vertical-align: middle;
}

	/* Community 게시판 List */
	.card-receep-header {
		border-bottom: 1px solid;
		/* background-color: #32d66c; */
		border: 1px solid grey;
		/* border-top: 1px solid #e9ecf0; */
	}
	.card-receep-header .username {
		color: #009688;
		font-weight: bold;
	}
	.card-receep-header .timeago {
		color: #c7cbd1;
		font-size: 12px;
	}
	.card-receep-header #like {
		color: #8a8f96;
	}
	.card-receep-header #like:hover {
		color: #ff0080;
	}
	.card-receep-entry {
		background-size: 33px 34px;
		position: relative;
	}
	#owl1{
		text-align: center;
	}
	
	/* 테이블 색깔 지정 */
	.box-black {
	background-color: #ec9e9e;
	/* rgba(0, 0, 0, 0.7) */
	}
	/*********************/
	.box-col-top{
	background-color: #fdfdcc;
	color: #cc6262;
	}
	.box-col-bottom{
	background-color: #32d66c;
	color: #fffdfd;
	}
	/* 테이블 속성 길이 지정 */
	.box-time{
		width: 71px;
		color: white;
		text-align: center;
	}
	.box-notice{
		width: 60px;
		color: white;
		text-align: center;
	}
	/****************************/
	.form-con{	
	    width: 15%;
	    height: 34px;
	    padding: 6px 12px;
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #555;
	    background-color: #fff;
	    background-image: none;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
	    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	}
	
	/*********** 영역 길이 수정 *****************/
	#rankTable {
		width: 50%;
		text-align: center;
	}
	
	#notice-list {
		width: 700px;
	}
	#noticeTable {
		width: 70%;
	}	
	/****************************/
	
	#h3r{
	    font-family: nanumbarunpenb !important;
	    font-size: 57px;
	    color: #5c627c;
	    margin-top: 5px;
	    margin-bottom: 25px;
	}
}
</style>

<!-- CSS -->

<link rel="stylesheet" href="${initParam.root}resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/camera.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<!-- <script src="js/jquery.easing.1.3.js"></script> -->
<script src="js/script.js"></script>
<script src="js/superfish.js"></script>
<!-- <script src="js/jquery.equalheights.js"></script> -->
<!-- <script src="js/jquery.mobilemenu.js"></script> -->
<script src="js/tmStickUp.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/camera.js"></script>
<script src="js/owl.carousel.js"></script> 
<!--[if (gt IE 9)|!(IE)]><!-->
<script src="js/jquery.mobile.customized.min.js"></script>
<!--<![endif]-->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
$(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({});  

  $('#camera_wrap').camera({
    loader: false,
    pagination: false ,
    minHeight: '400',
    thumbnails: false,
/*     height: '38.07291666666667%', */
    height: '10%',
    caption: false,
    navigation: true,
    fx: 'mosaic'
  });

  $("#owl").owlCarousel({
    items : 3, //10 items above 1000px browser width
    itemsDesktop : [995,1], //5 items between 1000px and 901px
    itemsDesktopSmall : [767, 1], // betweem 900px and 601px
    itemsTablet: [700, 1], //2 items between 600 and 0
    itemsMobile : [479, 1], // itemsMobile disabled - inherit from itemsTablet option
    navigation : true,
    pagination :  false
  }); 
 }); 
</script>
<!--[if lt IE 8]>
 <div style=' clear: both; text-align:center; position: relative;'>
   <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
     <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
   </a>
</div>
<![endif]-->
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->
</head>

<body class="page1" id="top">
<!--==============================
              header
=================================-->
<header>
  <div class="container_12">
    <div class="grid_12">
      <h1 class="logo">
        <a href="home.do">
          DANIM
        </a>
      </h1>
    </div>
    <div class="clear"></div>
  </div>
  <div id="header_top"><tiles:insertAttribute name="header_top" /></div>
  <div id="header_bottom" class="container_12">
    <div class="grid_12">
      <tiles:insertAttribute name="header_bottom" />
	  <div class="clear"></div>
	</div>
  	<div class="clear"></div>
  </div>
</header>
 
<!--=====================
          Content
======================-->
<section id="content">
<div id="main">
  <tiles:insertAttribute name="main" />
  <div class="clear"></div>
  <div class="addHeight"></div>
</div>
</section>
<!--==============================
              footer
=================================-->
<footer id="footer">
    <div id="footer" class="container_12">
      <tiles:insertAttribute name="footer" />
    </div>
    <div class="clear"></div>
</footer>
<a href="#" id="toTop" class="fa fa-angle-up"></a>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danim</title>
<!-- 다님 로고 삽입 -->
<link rel="icon" href="resources/img/danim_logo.jpg">
<link rel="shortcut icon" href="resources/img/danim_logo.jpg" />

<script type="text/javascript" src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<!-- 유진이꺼 -->
<script type="text/javascript" src="${initParam.root}resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- 증현이형꺼 -->
<!-- <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->

<!-- 증현이형꺼 -->
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
<!-- <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
 -->
<!-- 부트스트랩 적용  -->
<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/font-awesome.css">
<link rel="stylesheet" href="${initParam.root}resources/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div id="container">
	<div id="header_top"><tiles:insertAttribute name="header_top" /></div>
	<div id="header_bottom"><tiles:insertAttribute name="header_bottom" /></div>
	<div id="main"><tiles:insertAttribute name="main" /></div>
	<div id="footer"><tiles:insertAttribute name="footer" /></div>
</div>
</body>
</html>
 --%>
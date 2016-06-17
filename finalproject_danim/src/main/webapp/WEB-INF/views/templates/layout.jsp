<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>css를 이용한 layout</title>
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
	<div id="header_top"><tiles:insertAttribute name="left" /></div>
	<div id="header_bottom"><tiles:insertAttribute name="header" /></div>
	<div id="main"><tiles:insertAttribute name="main" /></div>
	<div id="footer"><tiles:insertAttribute name="footer" /></div>
</div>
</body>
</html>










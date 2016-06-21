<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세정보</title>
<script type="text/javascript" src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		 $("#pic1").click(function(){
			$("#pictureView").html("<img src='${initParam.root}${requestScope.lodgeVO[0].lodgePictureVO.picture_name }'width=800 height=500>");
		});
		 $("#pic2").click(function(){
				$("#pictureView").html("<img src='${initParam.root}${requestScope.lodgeVO[1].lodgePictureVO.picture_name }'width=800 height=500>");
			});
		 $("#pic3").click(function(){
				$("#pictureView").html("<img src='${initParam.root}${requestScope.lodgeVO[2].lodgePictureVO.picture_name }'width=800 height=500>");
			});		
		 $("#pic4").click(function(){
				$("#pictureView").html("<img src='${initParam.root}${requestScope.lodgeVO[3].lodgePictureVO.picture_name }'width=800 height=500>");
			});	
	});
</script>

</head>
<body>
<!-- 버스상세정보 -->
<c:if test="${busVO != null }">
	${busVO }
</c:if>
<!-- 기차상세정보 -->
<c:if test="${trainVO != null }">
	${trainVO }
</c:if>
<!-- 숙박상세정보 -->
<c:if test="${!empty lodgeVO }">
	<table class="table table-striped ">
	<tr>
	<td>
	<table class="table">
	<tr>
	<td width="50%"><br><br><div id="pictureView"><img src="${initParam.root}${requestScope.lodgeVO[0].lodgePictureVO.picture_name }" alt="..."  width=800 height=500 align="middle"></div><br><br></td>
	</tr>
	<tr>
	<td>
	<img src="${initParam.root}${requestScope.lodgeVO[0].lodgePictureVO.picture_name }" alt="..."  width=200 height=150 id="pic1"></img>
	<img src="${initParam.root}${requestScope.lodgeVO[1].lodgePictureVO.picture_name }" alt="..."  width=200 height=150 id="pic2"></img>
	<img src="${initParam.root}${requestScope.lodgeVO[2].lodgePictureVO.picture_name }" alt="..."  width=200 height=150 id="pic3"></img>
	<img src="${initParam.root}${requestScope.lodgeVO[3].lodgePictureVO.picture_name }" alt="..."  width=200 height=150 id="pic4"></img>
	<hr>
	</td>
	</tr>
	</table></td>
	<td rowspan=3 width="40%">
	<h2>${lodgeVO[0].lodgetype } 정보</h2>
	<hr>
	<br>
	지역 : ${requestScope.lodgeVO[0].detailarea_name}
	<br><br>
	숙소 : ${requestScope.lodgeVO[0].shopname }
	<br><br>
	가격 : ${requestScope.lodgeVO[0].price}
	<br>
	<hr>
	<h4>상세정보</h4><br><br>
	${requestScope.lodgeVO[0].shopinfo}
	</td>
	</tr>
	</table>
</c:if>
</body>
</html>
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
		 
		 $("#foodpic1").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[0].food_picture}'width=100% height=500>");
			});
		 $("#foodpic2").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[1].food_picture}'width=100% height=500>");
			});
		 $("#foodpic3").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[2].food_picture}'width=100% height=500>");
			});		
		 $("#foodpic4").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[3].food_picture}'width=100% height=500>");
			});
	});
</script>

</head>
<body>
<!-- 버스상세정보 -->
<c:if test="${busVO != null }">
	<table border='1'>
		<tr>
			<td>버스번호</td>
			<td>${busVO.bus_no }</td>
		</tr>
		<tr>
			<td>운행시간</td>
			<td>${busVO.operation_time}</td>
		</tr>
		<tr>
			<td>출발터미널</td>
			<td>${busVO.terminalVO.terminal_name}</td>
		</tr>
		<tr>
			<td>도착지역</td>
			<td>${busVO.end_area}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${busVO.price}</td>
		</tr>
		<tr>
			<td>소요시간</td>
			<td>${busVO.leadTime}</td>
		</tr>
		<tr>
			<td>버스종류</td>
			<td>${busVO.busType}</td>
		</tr>
	</table>
</c:if>
<!-- 기차상세정보 -->
<c:if test="${trainVO != null }">
	<table border='1'>
		<tr>
			<td>기차번호</td>
			<td>${trainVO.train_no }</td>
		</tr>
		<tr>
			<td>운행시간</td>
			<td>${trainVO.operation_time}</td>
		</tr>
		<tr>
			<td>출발역</td>
			<td>${trainVO.stationVO.station_name}</td>
		</tr>
		<tr>
			<td>도착지역</td>
			<td>${trainVO.end_area}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${trainVO.price}</td>
		</tr>
		<tr>
			<td>소요시간</td>
			<td>${trainVO.leadTime}</td>
		</tr>
		<tr>
			<td>기차종류</td>
			<td>${trainVO.trainType}</td>
		</tr>
	</table>
</c:if>
<!-- 숙박상세정보 -->
<c:if test="${!empty lodgeVO }">
	<table class="table table-striped ">
	<tr>
	<td>
	<table class="table">
	<tr>
	<td width="50%"><br><br><div id="pictureView"><img src="${initParam.root}${requestScope.lodgeVO[0].lodgePictureVO.picture_name }" alt="..."  width=100% height=500 align="middle"></div><br><br></td>
	</tr>
	<tr>
	<td>
	<c:forEach var="list" items="${requestScope.lodgeVO}" varStatus="i">
	<img src="${initParam.root}${list.lodgePictureVO.picture_name }" alt="..."  width=24% height=150 id="pic${i.index+1}"></img>
	</c:forEach>
	<hr>
	</td>
	</tr>
	</table></td>
	<td rowspan=3 width="50%">
	<h2>${lodgeVO[0].lodgetype } 정보</h2>
	<hr>
	<br>
	지역 : ${requestScope.lodgeVO[0].local_area}
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
<!-- 음식상세정보 -->
<c:if test="${!empty dList }">
	<table class="table table-striped ">
	<tr>
	<td>
	<table class="table">
	<tr>
	<td width="50%"><br><br><div id="pictureView"><img src="${initParam.root}resources/img/food/menu/${dList[0].food_picture}" alt="..."  width=100% height=500 align="middle"></div><br><br></td>
	</tr>
	<tr>
	<td>
	<c:forEach var="list" items="${requestScope.dList}" varStatus="i">
	<img src="${initParam.root }resources/img/food/menu/${list.food_picture}" alt="..."  width=24% height=150  id="foodpic${i.index+1}"></img>
	</c:forEach>
	<hr>
	
	</td>
	</tr>
	</table></td>
	<td rowspan=3 width="50%">
	<h2>정보</h2>
	<hr>
	<br>
	메뉴 : ${requestScope.dList[0].food_name }
	<br><br>
	가격 : ${requestScope.dList[0].price}
	<br>
	<hr>
	
	</td>
	</tr>
	</table>
</c:if>
</body>
</html>
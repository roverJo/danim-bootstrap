<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function(){	
	var setInfo="메뉴 : ${requestScope.dList[0].food_name }<br><br>";
	setInfo+= "가격 : ${requestScope.dList[0].price}";
	$("#infoMenu").html(setInfo);
	 $("#pic1").click(function(){
		$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[0].food_picture}'width=100% height=500>");
		var menuInfo="메뉴 : ${requestScope.dList[0].food_name }<br><br>";
		menuInfo += "가격 : ${requestScope.dList[0].price}";
		$("#infoMenu").html(menuInfo);
	});
	 $("#pic2").click(function(){
			$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[1].food_picture}'width=100% height=500>");
			var menuInfo="메뉴 : ${requestScope.dList[1].food_name }<br><br>";
			menuInfo += "가격 : ${requestScope.dList[1].price}";
			$("#infoMenu").html(menuInfo);
		});
	 $("#pic3").click(function(){
			$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[2].food_picture}'width=100% height=500>");
			var menuInfo="메뉴 : ${requestScope.dList[2].food_name }<br><br>";
			menuInfo += "가격 : ${requestScope.dList[2].price}";
			$("#infoMenu").html(menuInfo);
		});		
	 $("#pic4").click(function(){
			$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[3].food_picture}'width=100% height=500>");
			var menuInfo="메뉴 : ${requestScope.dList[3].food_name }<br><br>";
			menuInfo += "가격 : ${requestScope.dList[3].price}";
			$("#infoMenu").html(menuInfo);
		});	
});
</script>

<form id="addLodgeForm" action="login_checkZimByLodge.do" method="get">
	<input type="hidden" name="lodge_no"
		value="${requestScope.list[0].lodge_no }">
	<table class="table table-striped ">
		<tr>
			<td>
				<table class="table">
					<tr>
						<td width="50%"><br>
						<br>
						<div id="pictureView">
								<img
									src="${initParam.root}resources/img/food/menu/${dList[0].food_picture}"
									alt="..." width=100% height=500 align="middle">
							</div>
							<br>
						<br></td>
					</tr>
					<tr>
						<td><c:forEach var="list" items="${requestScope.dList}" varStatus="i">
								<img
									src="${initParam.root }resources/img/food/menu/${list.food_picture}"
									alt="..." width=24% height=150 id="pic${i.index+1}"></img>
							</c:forEach>
							<hr></td>
					</tr>
				</table>
			</td>
			<td rowspan=3 width="50%">
				<h2>정보</h2>
				<div id="infoMenu"></div>
				<hr> 
				<br><br><br><br><br><br><br><br><br>
			 <a href="#" onClick="history.back(-1);">결과페이지</a>
				<div align="right">
					<a href="#top">TOP으로</a>
				</div>
			</td>
		</tr>
	</table>
</form>

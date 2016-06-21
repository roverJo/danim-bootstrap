<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){	
		 $("#pic1").click(function(){
			$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[0].food_picture}'width=100% height=500>");
		});
		 $("#pic2").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[1].food_picture}'width=100% height=500>");
			});
		 $("#pic3").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[2].food_picture}'width=100% height=500>");
			});		
		 $("#pic4").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[3].food_picture}'width=100% height=500>");
			});	
	});
</script>

<form id="addLodgeForm" action="login_checkZimByLodge.do" method="get">
<input type="hidden" name="lodge_no" value="${requestScope.list[0].lodge_no }">
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
<img src="${initParam.root }resources/img/food/menu/${list.food_picture}" alt="..."  width=24% height=150  id="pic${i.index+1}"></img>
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

<br><br><br><br><br><br><br><br><br>
<a href="#" onClick="history.back(-1);">결과페이지</a>
<div align="right"><a href="#top">TOP으로</a></div>
</td>
</tr>
</table>
</form>



<%-- 


<h2 align="center">메뉴</h2>
<table  cellpadding="20">
	<tr>
		<c:forEach items="${dList }" var="dList">
		<td>${dList.shopname }</td>
			<c:choose>
				<c:when test="${dList!=null }">
					<td>
					<img	src="${initParam.root }resources/img/food/menu/${dList.food_picture}"
						style="width: 120px; height: 120px; margin-left: 20px; border-radius: 100px; left: 220px;">
						<h4>메뉴 : ${dList.food_name }</h4>
						<h4>가격 : ${dList.price }원</h4></td>

				</c:when>
			</c:choose>

		</c:forEach>
	</tr>
</table>
<br><br><br><br><br><br>
--%>




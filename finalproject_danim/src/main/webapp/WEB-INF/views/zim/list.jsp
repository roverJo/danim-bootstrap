<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
		////////////////////////////////////////////////교통관련 
		var cartForm = "<hr><input type='submit' value='장바구니에 담기'>";
		
		$("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]").change(function() {
			$("#lodgeZimForm input[name=lodge_no]:checked").each(function() {
				$(this).prop("checked",false);
			});
			$("#cartDiv").html(cartForm);
		});
		
		$("#lodgeZimForm input[name=lodge_no]").change(function() {
			$("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]").prop("checked",false);
			
			if($("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]:checked").length == 1 ||
			$("#foodZimForm input[type='radio'][name=insertcart_food_no]:checked").length == 1 ||
			$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]:checked").length == 1)
			{
				$("#cartDiv").html(cartForm);
			}
			else
			{
				$("#cartDiv").html("");	
			}
		});
		
		$("#foodZimForm input[type='radio'][name=insertcart_food_no]").change(function() {
			$("#foodZimForm input[name=foodshop_no]:checked").each(function() {
				$(this).prop("checked",false);
			});
			$("#cartDiv").html(cartForm);
		});
		
		$("#foodZimForm input[name=foodshop_no]").change(function() {
			$("#foodZimForm input[type='radio'][name=insertcart_food_no]").prop("checked",false);
			
			if($("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]:checked").length == 1 ||
			$("#foodZimForm input[type='radio'][name=insertcart_food_no]:checked").length == 1 ||
			$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]:checked").length == 1)
			{
				$("#cartDiv").html(cartForm);
			}
			else
			{
				$("#cartDiv").html("");	
			}
		});
		
		$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]").change(function() {
			$("#trafficZimForm input[name=bus_no]:checked").each(function() {
				$(this).prop("checked",false);
			});
			$("#trafficZimForm input[name=train_no]:checked").each(function() {
				$(this).prop("checked",false);
			});
			$("#cartDiv").html(cartForm);
		});
		
		$("#trafficZimForm input[name=bus_no]").change(function() {
			$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]").prop("checked",false);

			if($("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]:checked").length == 1 ||
			$("#foodZimForm input[type='radio'][name=insertcart_food_no]:checked").length == 1 ||
			$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]:checked").length == 1)
			{
				$("#cartDiv").html(cartForm);
			}
			else
			{
				$("#cartDiv").html("");	
			}
		});
		
		$("#trafficZimForm input[name=train_no]").change(function() {
			$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]").prop("checked",false);
			if($("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]:checked").length == 1 ||
			$("#foodZimForm input[type='radio'][name=insertcart_food_no]:checked").length == 1 ||
			$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]:checked").length == 1)
			{
				$("#cartDiv").html(cartForm);
			}
			else
			{
				$("#cartDiv").html("");	
			}
		});
		////cart
		$("#cartForm").submit(function () {
			$("#cartForm input[name=traffic_no]").val($("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]:checked").val());
			$("#cartForm input[name=lodge_no]").val($("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]:checked").val());
			$("#cartForm input[name=foodshop_no]").val($("#foodZimForm input[type='radio'][name=insertcart_food_no]:checked").val());
		});
		
		
		//////////////////////////////////////////////////////////////////////////////
		
		$("#trafficZimForm").submit(function () {
			//$("#trafficZimForm input[type='radio'][name=traffic_no]:checked").val()
			var bus_no = [];
			var train_no = [];
			
			$("#trafficZimForm input[name=bus_no]:checked").each(function() {
				bus_no.push($(this).val());
			});
			
			$("#trafficZimForm input[name=train_no]:checked").each(function() {
				train_no.push($(this).val());
			});
			
			if(bus_no.length == 0 && train_no.length == 0)
			{
				alert("삭제할 교통을 선택하세요");
				return false;
			}
			
			var flag = confirm("선택한 교통을 삭제하시겠습니까?");
			if(flag == false)
			{
				return false;
			}
		});
		
		////////////////////////////////////////////////숙박관련
		
		$("#lodgeZimForm").submit(function(){
			var lodge_no = [];
			$("#lodgeZimForm input[name=lodge_no]:checked").each(function() {
				lodge_no.push($(this).val());
			});
			if(lodge_no.length == 0){
				alert("삭제할 숙박지를 선택하세요");
				return false;
			}
			var flag = confirm("선택한 숙박지를 삭제하시겠습니까?");
			if(flag == false){
				return false;
			}
		});
		
		////////////////////////////////////////////////음식관련
		
		//음식
		$("#foodZimForm").submit(function(){
			var foodshop_no=[];
			$("#foodZimForm input[name=foodshop_no]:checked").each(function(){
				foodshop_no.push($(this).val());
			});
			if(foodshop_no.length==0){
				alert("삭제할 음식을 선택하세요");
				return false;
			}
			var flag = confirm("선택한 음식을 삭제하시겠습니까?");
			if(flag == false)
			{
				return false;
			}
		});//음식 끝
	});
</script>
<h2>찜목록</h2>


<c:if test="${!empty trafficList.busList || !empty trafficList.trainList}">
<form id="trafficZimForm" action="login_deleteTrafficZim.do">
	<h4>교통</h4>
	<table border="1">
		<tr>
			<td>출발터미널,역이름</td>
			<td>운행시간</td>
			<td>도착지점</td>
			<td>가격</td>
			<td>시간</td>
			<td>종류</td>
			<td>삭제</td>
			<td>담기</td>
		</tr>
		<c:if test="${!empty trafficList.busList}">
			<c:forEach items="${trafficList.busList }" var = "list">
			<tr>
				<td>${list.terminalVO.terminal_name }</td>
				<td>${list.operation_time }</td>
				<td>${list.end_area }</td>
				<td>${list.price }원</td>
				<td>${list.leadTime }</td>
				<td>${list.busType }</td>
				<td><input type="checkbox" name="bus_no" value="${list.bus_no }"></td>
				<td><input type="radio" name="insertcart_traffic_no" value="bus/${list.bus_no }"></td>
			</tr>
			</c:forEach>
		</c:if>
		<c:if test="${!empty trafficList.trainList}">
			<c:forEach items="${trafficList.trainList }" var = "list">
			<tr>
				<td>${list.stationVO.station_name }</td>
				<td>${list.operation_time }</td>
				<td>${list.end_area }</td>
				<td>${list.price }원</td>
				<td>${list.leadTime }</td>
				<td>${list.trainType }</td>
				<td><input type="checkbox" name="train_no" value="${list.train_no }"></td>
				<td><input type="radio" name="insertcart_traffic_no" value="train/${list.train_no }"></td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	<input type="submit" value="교통삭제">
</form>
</c:if>
<!-- 숙박 -->

<c:if test="${!empty lodgeList }">
<hr>
<form id="lodgeZimForm" action="login_deleteLodgeZim.do">
	<h4>숙박</h4>
	<table border="1">
		<tr>
			<td>숙박지역</td>
			<td>숙박종류</td>
			<td>숙소이름</td>
			<td>가격</td>		
			<td>삭제</td>
			<td>담기</td>
		</tr>
		<c:forEach items="${lodgeList }" var = "list">
			<tr>
				<td>${list.detailarea_name }</td>
				<td>${list.lodgetype }</td>
				<td>${list.shopname }</td>
				<td>${list.price }원</td>			
				<td><input type="checkbox" name="lodge_no" value="${list.lodge_no }"></td>
				<td><input type="radio" name="insertcart_lodge_no" value="${list.lodge_no }"></td>
			</tr>
		</c:forEach>		
	</table>
	<input type="submit" value="숙박삭제">
</form>	
</c:if>
<!--  음식 찜리스트 -->

<c:if test="${!empty bestFoodList }">
<hr>
	<form id="foodZimForm" action="login_deleteFoodZim.do">
		<h4>음식</h4>
		<table border="1">
			<tr align="center">
				<td>가게명</td>
				<td>위치</td>
				<td>종류</td>
				<td>주소</td>
				<td>메인메뉴</td>
				<td>가격</td>
				<td>삭제</td>
				<td>담기</td>
			</tr>
			<c:forEach items="${bestFoodList }" var="bestFoodList">
			<tr>
				<td>${bestFoodList.shopname }</td>
				<td>${bestFoodList.detailarea_name }</td>
				<td>${bestFoodList.foodtype }</td>
				<td>${bestFoodList.shop_add }</td>
				<td>${bestFoodList.main_food }</td>
				<td>${bestFoodList.main_price }원</td>
				<td align="center"><input type="checkbox" name="foodshop_no" value="${bestFoodList.foodshop_no }"></td>
				<td align="center"><input type="radio" name="insertcart_food_no" value="${bestFoodList.foodshop_no }"></td>
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="음식점삭제">
	</form>

</c:if>
<form id="cartForm" action="login_cartInsert.do">
	<input type="hidden" name="traffic_no" value="">
	<input type="hidden" name="lodge_no" value="">
	<input type="hidden" name="foodshop_no" value="">
	<div id = "cartDiv"></div>
</form>



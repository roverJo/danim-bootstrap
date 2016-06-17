<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
		var traffic = function traffic(data) {
			alert(data);
		}
		
		//screen.width  : 현재 운영체제의 너비
		//screen.height : 현재 운영체제의 높이
		/* w = 640;    //팝업창의 너비
		h = 510;    //팝업창의 높이

		//중앙위치 구해오기
		LeftPosition=(screen.width-w)/2;
		TopPosition=(screen.height-h)/2;

		//팝업 호출
		function popup_open() {   
		    window.open(
		        팝업url, 
		        "팝업창이름",
		        "width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
		} */
		


		/* $("input[name=index]").each(function () {
			$("input[name=busDetailViewBtn]").click(function () {
				alert($(this).val());
			});
		}); */
		
		/* $("input[name=busDetailViewBtn]").each(function() {
			alert($(this).index());
		}); */
		
	});
</script>

<h2>장바구니</h2>
<hr>
<c:if test="${!empty cartListVO}">
	<c:forEach items="${cartListVO.cartList }" var="list" varStatus="stat">
	
	<input type="hidden" name = "index" value="${stat.index }">
	<table border="1">
		<c:if test="${!empty list.busVO }">
			<input type="hidden" name="traffic_type" value="bus">
			<input type="hidden" name="bus_no" value="${list.busVO.bus_no }">
			<tr>
				<td>교통</td>
				<td>${list.busVO.terminalVO.terminal_name } --> ${list.busVO.end_area }</td>
				<td>${list.busVO.busType}</td>
				<td>${list.busVO.price } 원</td>
				<td><a href="#" onclick="traffic(${list.busVO.bus_no})">상세보기</a></td>
			</tr>
		</c:if>
		<c:if test="${!empty list.trainVO}">
			<input type="hidden" name="traffic_type" value="train">
			<tr>
				<td>교통</td>
				<td>${list.trainVO.stationVO.station_name } --> ${list.trainVO.end_area }</td>
				<td>${list.trainVO.trainType}</td>
				<td>${list.trainVO.price }원</td>
				<td><a href="">상세보기</a></td>
			</tr>
		</c:if>
		<c:if test="${!empty list.lodgeVO }">
			<tr>
				<td>숙박</td>
				<td>${list.lodgeVO.detailarea_name }</td>
				<td>${list.lodgeVO.lodgetype }</td>
				<td>${list.lodgeVO.price }원</td>
				<td><a href="showlodge.do?no=${list.lodgeVO.lodge_no }">상세보기</a></td>
			</tr>
		</c:if>
		<c:if test="${!empty list.bestFoodVO }">
			<tr>
				<td>음식</td>
				<td>${list.bestFoodVO.detailarea_name }</td>
				<td>${list.bestFoodVO.foodtype }</td>
				<td>${list.bestFoodVO.main_price }원</td>
				<td><a href="detailFood.do?foodshop_no=${list.bestFoodVO.foodshop_no }">상세보기</a></td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5">총금액 : ${list.totalPrice }원</td>
		</tr>
	</table>
	<div id="trafficDetail"></div>
	<hr>
	</c:forEach>
	
<p class="paging">
	<c:set var="pb" value="${cartListVO.pagingBean}"></c:set>
	<c:if test="${pb.previousPageGroup}">
		&nbsp;
		<a href="${initParam.root }login_cartList.do?pageNo=${pb.startPageOfPageGroup-1}">◀</a>&nbsp;
	</c:if>

	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
		<c:choose>
		<c:when test="${pb.nowPage!=i}">
			<a href="${initParam.root }login_cartList.do?pageNo=${i}">${i}</a> 
		</c:when>
		<c:otherwise>
		${i}
		</c:otherwise>
		</c:choose>
		&nbsp;
	</c:forEach>	 
	
	<c:if test="${pb.nextPageGroup}">
		&nbsp;
		<a href="notice_list.do?pageNo=${pb.endPageOfPageGroup+1}">▶</a>&nbsp;
	</c:if>
	<a href="#" onclick="window.open ('${initParam.root}home.do', 'popup' , 'width=500,height=300,top=center' )">글자나 이미지</a> 
</p>
	
</c:if>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	
	$(document).ready(function() {
		var w = 640;    //팝업창의 너비
		var h = 510;    //팝업창의 높이

		//중앙위치 구해오기
		var LeftPosition=(screen.width-w)/2;
		var TopPosition=(screen.height-h)/2;
		//버스
		$(".cartDiv").on("click",".bus", function(){
			w = 300;    //팝업창의 너비
			h = 200;    //팝업창의 높이

			//중앙위치 구해오기
			LeftPosition=(screen.width-w)/2;
			TopPosition=(screen.height-h)/2;
			
			var bus_no = $(this).parent().parent().find("input[name=bus_no]").val();
			window.open("cartDetailInfoByBus.do?bus_no="+bus_no,"교통상세정보","width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
		})
		//기차
		$(".cartDiv").on("click",".train", function(){
			w = 300;    //팝업창의 너비
			h = 200;    //팝업창의 높이

			//중앙위치 구해오기
			LeftPosition=(screen.width-w)/2;
			TopPosition=(screen.height-h)/2;
			
			var train_no = $(this).parent().parent().find("input[name=train_no]").val();
			window.open("cartDetailInfoByTrain.do?train_no="+train_no,"교통상세정보","width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
		});
		//숙박
		$(".cartDiv").on("click",".lodge", function(){
			w = 1500;    //팝업창의 너비
			h = 800;    //팝업창의 높이

			//중앙위치 구해오기
			LeftPosition=(screen.width-w)/2;
			TopPosition=(screen.height-h)/2;
			
			var lodge_no = $(this).parent().parent().find("input[name=lodge_no]").val();
			window.open("cartDetailInfoByLodge.do?lodge_no="+lodge_no,"숙박상세정보","width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
		});
		//음식
		$(".cartDiv").on("click",".food", function(){
			w = 640;    //팝업창의 너비
			h = 510;    //팝업창의 높이

			//중앙위치 구해오기
			LeftPosition=(screen.width-w)/2;
			TopPosition=(screen.height-h)/2;
			
			var foodshop_no = $(this).parent().parent().find("input[name=foodshop_no]").val();
			window.open("cartDetailInfoByFood.do?foodshop_no="+foodshop_no,"음식상세정보","width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
		});		
	});
</script>
<div class="container" align="center">
<div class="cartDiv">
<h2>장바구니</h2>
<hr>
<c:if test="${!empty cartListVO}">
	<c:forEach items="${cartListVO.cartList }" var="list" varStatus="stat">
	<table border="1" class="table custab">
	<div class="addHeight"></div>
		<c:if test="${!empty list.busVO }">
			<input type="hidden" name="bus_no" value="${list.busVO.bus_no }">
			<tr class="bus box-black" >
				<td>교통</td>
				<td>${list.busVO.terminalVO.terminal_name } --> ${list.busVO.end_area }</td>
				<td>${list.busVO.busType}</td>
				<td>${list.busVO.price } 원</td>
				<td><input type="button" name="busBtn" value="상세보기"></td>
			</tr>
		
		</c:if>
		<c:if test="${!empty list.trainVO}">
			<input type="hidden" name="train_no" value="${list.trainVO.train_no }">
			<tr class="train box-black">
				<td>교통</td>
				<td>${list.trainVO.stationVO.station_name } --> ${list.trainVO.end_area }</td>
				<td>${list.trainVO.trainType}</td>
				<td>${list.trainVO.price }원</td>
				<td><input type="button" name="trainBtn" value="상세보기"></td>
			</tr>
		</c:if>
		<c:if test="${!empty list.lodgeVO }">
			<input type="hidden" name="lodge_no" value="${list.lodgeVO.lodge_no }">
			<tr class="lodge box-black">
				<td>숙박</td>
				<td>${list.lodgeVO.detailarea_name }</td>
				<td>${list.lodgeVO.lodgetype }</td>
				<td>${list.lodgeVO.price }원</td>
				<td><input type="button" name="lodgeBtn" value="상세보기"></td>
			</tr>
		</c:if>
		<c:if test="${!empty list.bestFoodVO }">
			<input type="hidden" name="foodshop_no" value="${list.bestFoodVO.foodshop_no }">
			<tr class="food box-black">
				<td>음식</td>
				<td>${list.bestFoodVO.detailarea_name }</td>
				<td>${list.bestFoodVO.foodtype }</td>
				<td>${list.bestFoodVO.main_price }원</td>
				<td><input type="button" name="foodBtn" value="상세보기"></td>
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
		<a href="login_cartList.do?pageNo=${pb.endPageOfPageGroup+1}">▶</a>&nbsp;
	</c:if>
	 
</p>
	
</c:if>
</div>
</div>
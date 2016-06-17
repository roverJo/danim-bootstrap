<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	//alert(1);

	if($("#searchArea").html()==""){
		$.ajax({
			type:"get",
			url:"searchAreaFood.do",
			dataType:"json",
			success:function(area){
				var selectArea ="<select id='areaFoodName'>";
				selectArea += "<option value=''>출발지를 선택하세요</option>";
				for(var i = 0 ; i < area.length; i++)
				{
					selectArea += "<option value="+area[i].area_name+">"+area[i].area_name+"</option>";
				}
				selectArea += "</select>";
				$("#searchArea").html(selectArea);
			}
		});
	}//처음 지역 선택
	
	//처음 지역 선택 후 세부 지역 선택
	$("#bestfoodForm").on("change", "#areaFoodName", function () {
		$("#searchDetailArea").html("");
		$("#searchFoodBtn").html("");
		$.ajax({
			type:"get",
			url:"searchFoodDetailArea.do?area_name="+$("#areaFoodName").val(),
			dataType:"json",
			success:function(detailAreaList){
				var selectFoodDetailArea ="<select id='DetailAreaName'>";
				selectFoodDetailArea += "<option value=''>세부지역을 선택하세요</option>";
				for(var i = 0 ; i < detailAreaList.length; i++)
				{
					selectFoodDetailArea += "<option value="+detailAreaList[i].detailarea_name+">"+detailAreaList[i].detailarea_name+"</option>";
				}
				selectFoodDetailArea += "</select>";
				$("#searchDetailArea").html(selectFoodDetailArea);
			}
		});
	});// 세부지역 선택 끝
	
	//세부지역 선택 후 음식종류 검색
	$("#bestfoodForm").on("change", "#DetailAreaName", function () {
		if($(this).val() != "")
		{
			var selectKind = "<select id='foodtype'>"
			selectKind += "<option value=''>음식종류를 선택하세요</option>"
			selectKind += "<option value='한식'>한식</option>";
			selectKind += "<option value='중식'>중식</option>";
			selectKind += "<option value='일식'>일식</option>";
			selectKind += "<option value='양식'>양식</option>";
			selectKind += "<option value='분식'>분식</option>";
			selectKind += "<option value='기타'>기타</option>";
			selectKind += "<option value='전체'>전체</option>";
			selectKind += "</select>";
			$("#searchFoodMenu").html(selectKind);
		}
	});//음식종류 선택 끝

	//검색버튼 생성
	$("#bestfoodForm").on("change", "#foodtype", function () {
		$("#searchFoodBtn").html("");
		if($(this).val() != ""){
			$("#searchFoodBtn").html("<input type='button' id='searchBtn' value='검색'>");	
		}
	});
	

	//검색버튼 눌렀을때
	$("#bestfoodForm").on("click", "#searchBtn",function(){
		$.ajax({
			type:"get",
			url:"chkLogging.do",
			dataType:"json",
			success:function(flag){
				$.ajax({
					type:"get",
					url:"searchBestFood.do?foodtype="+$("#foodtype").val()+"&detailarea_name="+$("#DetailAreaName").val(),
					dataType:"json",
					success:function(foodList){
						var result = "<table border='1'>";
						if(foodList != null){
							result += "<input type='hidden' name='type' value='food'>";
							result += "<tr>";
							result +="<td>가게명</td>";
							result +="<td>위치</td>";
							result +="<td>종류</td>";
							result +="<td>주소</td>";
							result +="<td>메인메뉴</td>";
							result +="<td>가격</td>";
							if(!flag)
							{
								result +="<td>선택</td>";
							}
							result +="</tr>";
							for(var i = 0; i < foodList.length; i++)
							{
								result += "<tr>";
								result +="<td><a href='detailFood.do?foodshop_no="+foodList[i].foodshop_no+"'>"+foodList[i].shopname+"</a></td>";
								result +="<td>"+foodList[i].detailarea_name+"</td>";
								result +="<td>"+foodList[i].foodtype+"</td>";
								result +="<td>"+foodList[i].shop_add+"</td>";
								result +="<td>"+foodList[i].main_food+"</td>";
								result +="<td>"+foodList[i].main_price+"</td>";
								if(!flag)
								{
									result +="<td><input type='radio' name ='foodListchbox' value="+foodList[i].foodshop_no+"></td>";
								}
								result +="</tr>";
							}
						}

						result += "</table>";
						$("#searchFoodResult").html(result);
					}
				});//searchtraffic.do
				
				
			}
		});
	});//검색 버튼 끝
	
	//장바구니(찜리스트) 넣기
	$("#bestfoodForm").on("change", "input[type='radio'][name=foodListchbox]", function () {
		if($("#bestfoodForm input[type='radio'][name=foodListchbox]:checked").length == 1)
		{
			var flag = confirm("장바구니에 넣으시겠습니까?");
			if(flag == true)
			{
				$("#bestfoodForm input[name=no]").val($("#bestfoodForm input[type='radio'][name=foodListchbox]:checked").val());
				$("#bestfoodForm").submit();
			}
			else
			{
				$(this).prop("checked",false);
			}
		}
	});

	//다 선택 후 넘어갈 때
	$("#bestfoodForm").submit(function(){
		$("#bestfoodForm :input[name=detailarea_name]").val($("#DetailAreaName").val());
		$("#bestfoodForm :input[name=foodtype]").val($("#foodtype").val());
	});
	
});
  </script>
 <h3>음식검색페이지</h3>
 <form id="bestfoodForm" method="post" action="checkFoodShopNo.do">
 	<!-- <input type="hidden" name="area_name" value=""> -->
	<input type="hidden" name="no" value="">
	<!-- 지역검색 -->
	<span id="searchArea"></span>
	<!-- 세부지역검색 -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	  <span id="searchDetailArea"></span><br><br>
	<!-- 음식종류 검색 -->
	<span id="searchFoodMenu"></span>
	<!-- 검색 -->
&nbsp;&nbsp;&nbsp;	  <span id="searchFoodBtn"></span>
	<!-- 장바구니버튼 -->
	<div id="basketTraffic"></div>
	<!-- 검색결과 보여주는 곳 -->
	<div id="searchFoodResult"></div>
 </form>
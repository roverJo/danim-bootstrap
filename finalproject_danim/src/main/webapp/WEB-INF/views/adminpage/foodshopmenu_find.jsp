<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type:"get",
		url:"searchAreaFood.do",
		dataType:"json",
		success:function(area){
			var selectArea ="<select id='areaName'>";
			selectArea += "<option value=''>지역을 선택하세요</option>";
			for(var i = 0 ; i < area.length; i++)
			{
				selectArea += "<option value="+area[i].area_name+">"+area[i].area_name+"</option>";
			}
			selectArea += "</select>";
			$("#searchFoodArea").html(selectArea);
			
		}
	});//지역 선택 끝
	//처음 지역 선택 후 세부 지역 선택
	$("#foodshopFindForm").on("change", "#areaName", function () {
		
		$.ajax({
			type:"get",
			url:"searchFoodDetailArea.do?area_name="+$("#areaName").val(),
			dataType:"json",
			success:function(detailAreaList){
				var selectFoodDetailArea ="<select id='detailareaName'>";
				selectFoodDetailArea += "<option value=''>세부지역을 선택하세요</option>";
				for(var i = 0 ; i < detailAreaList.length; i++)
				{
					selectFoodDetailArea += "<option value="+detailAreaList[i].detailarea_name+">"+detailAreaList[i].detailarea_name+"</option>";
				}
				selectFoodDetailArea += "</select>";
				
				$("#searchFoodDetailArea").html(selectFoodDetailArea);
				
			}
		});
		
		
	});// 세부지역 선택 끝
	$("#foodshopFindForm").submit(function () {
		$("#foodshopFindForm :input[name=area_name]").val($("#areaName").val());
		$("#foodshopFindForm :input[name=detailarea_name]").val($("#detailareaName").val());
	});
	
	
});
	
</script>
<h3>음식점을 검색하세요</h3>
<form id="foodshopFindForm" action="foodshopfind2.do" >
음식점 이름 <input type="text" name="shopname">  <br>
<input type="hidden" value="" name="area_name">
<input type="hidden" value="" name="detailarea_name">
<div id="searchFoodArea"></div><br>
<div id="searchFoodDetailArea"></div><br>
<input type="submit" value="검색">
</form>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type:"get",
			url:"searchAreaLodge.do",
			dataType:"json",
			success:function(areaList){
				var selectArea ="<select id='areaName'>";
				selectArea += "<option value=''>지역을 선택하세요</option>";
				for(var i = 0 ; i < areaList.length; i++)
				{
					selectArea += "<option value="+areaList[i].area_name+">"+areaList[i].area_name+"</option>";
				}
				selectArea += "</select>";
				$("#searchLodgeArea").html(selectArea);
				
			}
		});//지역 선택 끝
		//처음 지역 선택 후 세부 지역 선택
		$("#lodgeManagementForm").on("change", "#areaName", function () {
			$("#searchLodgeDetailArea").html("");
			$("#lodgelocalArea").html("");
			$("#lodgeKind").html("");
			$.ajax({
				type:"get",
				url:"searchLodgeDetailArea.do?area_name="+$("#areaName").val(),
				dataType:"json",
				success:function(detailAreaList){
					var selectFoodDetailArea ="<select id='detailareaName'>";
					selectFoodDetailArea += "<option value=''>세부지역을 선택하세요</option>";
					for(var i = 0 ; i < detailAreaList.length; i++)
					{
						selectFoodDetailArea += "<option value="+detailAreaList[i].detailarea_name+">"+detailAreaList[i].detailarea_name+"</option>";
					}
					selectFoodDetailArea += "</select>";
					
					$("#searchLodgeDetailArea").html(selectFoodDetailArea);
					
				}
			});
		});// 세부지역 선택 끝
		
		//숙박 타입
		$("#lodgeManagementForm").on("change", "#detailareaName", function () {
			$("#lodgelocalArea").html("");
			$("#lodgeKind").html("");
			if($(this).val() != "")	{
				var selectKind = "<select id='lodgeKind'>"
				selectKind += "<option value=''>숙박종류를 선택하세요</option>"
				selectKind += "<option value='게스트하우스'>게스트하우스</option>";
				selectKind += "<option value='찜질방'>찜질방</option>";
				selectKind += "</select>";		
				$("#searchLodgeType").html(selectKind);
			}
		});
		
		//지역 입력 텍스트창
		$("#lodgeManagementForm").on("change","#lodgeKind",function(){
			var inputFoodLocalArea="지역구 : <input type='text' name='local_area' id='lodgelocalArea'>";
			$("#searchLodgeLocalArea").html(inputFoodLocalArea);
		});
		
		
		$("#lodgeManagementForm").submit(function () {
			$("#lodgeManagementForm :input[name=area_name]").val($("#areaName").val());
			$("#lodgeManagementForm :input[name=detailarea_name]").val($("#detailareaName").val());
			$("#lodgeManagementForm :input[name=lodgetype]").val($("#lodgeKind").val());
		});
		
	});
</script>

<div class="container" align="center">
	<h3>숙박 추가</h3>
	<form id="lodgeManagementForm" action="lodgeshopregister.do">
	숙소 이름 <input type="text" name="shopname"> <br>
	가격 <input type="text" name="price"><br><br>
	숙소 정보 <br>
	<textarea rows="5" cols="30" name="shopinfo"></textarea>
	<input type="hidden" value="" name="area_name">
	<input type="hidden" value="" name="detailarea_name">
	<input type="hidden" value="" name="lodgetype">
	
	<div id="searchLodgeArea"></div><br>
	<div id="searchLodgeDetailArea"></div><br>	
	<div id="searchLodgeType"></div><br>
	<div id="searchLodgeLocalArea"></div>
	<input type="submit" value="등록">
	</form>
</div>
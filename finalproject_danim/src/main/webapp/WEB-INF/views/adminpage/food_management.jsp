<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type:"get",
			url:"searchAreaFood.do",
			dataType:"json",
			success:function(area){
				var selectArea ="<select class='form-control' id='areaName'>";
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
		$("#foodManagementForm").on("change", "#areaName", function () {
			$("#searchFoodDetailArea").html("");
			
			$.ajax({
				type:"get",
				url:"searchFoodDetailArea.do?area_name="+$("#areaName").val(),
				dataType:"json",
				success:function(detailAreaList){
					var selectFoodDetailArea ="<select class='form-control' id='detailareaName'>";
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
		
		//지역 입력 텍스트창
		$("#foodManagementForm").on("change","#detailareaName",function(){
			$("#searchFoodType").html("");
			var inputFoodLocalArea="지역구 : <input type='text' name='local_area' id='localArea'>";
			$("#searchLocalArea").html(inputFoodLocalArea);
		});
		
		//음식 타입
		$("#foodManagementForm").on("change", "#localArea", function(){
			var inputFoodType="<select class='form-control' id='foodType'> ";
			inputFoodType+="<option value=''>음식종류를 선택하세요</option>";
			inputFoodType+="<option value='한식'>한식</option>";
			inputFoodType+="<option value='중식'>중식</option>";
			inputFoodType+="<option value='일식'>일식</option>";
			inputFoodType+="<option value='양식'>양식</option>";
			inputFoodType+="<option value='분식'>분식</option>";
			inputFoodType+="<option value='기타'>기타</option>";
			inputFoodType+="</select>";	
			
				$("#searchFoodType").html(inputFoodType);
		});
		
		
		$("#foodManagementForm").submit(function () {
			
			$("#foodManagementForm :input[name=area_name]").val($("#areaName").val());
			$("#foodManagementForm :input[name=detailarea_name]").val($("#detailareaName").val());
			$("#foodManagementForm :input[name=foodtype]").val($("#foodType"));
		});
		
	});
</script>
<div class="container_12" align="center">
<div class="addHeight"></div>
	<div id="contact-area" class="community">	
		<form id="foodManagementForm" action="foodshopregister.do" method="post" class="input_form">
			<div class="text-left">
			음식점 이름 <input type="text" name="shopname" class="form-control"> <br>
			음식점 주소 <input type="text" name="shop_add" class="form-control"><br>
			주메뉴 <input type="text" name="main_food" class="form-control"><br>
			주메뉴<input type="file" name="uploadFile"><br>
			주메뉴 가격 <input type="text" name="main_price" class="form-control"><br><br>
			<input type="hidden" value="" name="area_name">
			<input type="hidden" value="" name="detailarea_name">
			<input type="hidden" value="" name="foodtype">
			<div id="searchFoodArea"></div><br>
			<div id="searchFoodDetailArea"></div><br>
			<div id="searchLocalArea"></div><br>
			<div id="searchFoodType"></div>
		</div>
		<input type="submit" value="등록" class="btn btn-info btn-md-4">
		</form>		
	</div>
	<div class="clear"></div>
</div>

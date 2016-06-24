<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="../common/js/jquery-1.9.1.min.js" charset="euc-kr"></script>
<script type="text/javascript">

function readURL0(input) {
     if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#UploadedImg0').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]); 
    } 
}
function readURL1(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
           $('#UploadedImg1').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]); 
   } 
}
function readURL2(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
           $('#UploadedImg2').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]); 
   } 
}
function readURL3(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
           $('#UploadedImg3').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]); 
   } 
}

	$(document).ready(function () {
		$("#lodgePicUpdateForm").submit(function () {
			//사진의 고유 PK
			var lodge_PicNo_list="";
			$.each($(this).parent().parent().find("input[name=picture_no]"),function(index,items){
				lodge_PicNo_list += $(this).val()+",";
			});
			$("#viewHiddenPicNo").html("<input type='hidden' name='LodgePicNo_list' value='"+lodge_PicNo_list+"'>");	
			//사진의 PK 끝
		});
	});
</script>


<h2 align="center">메뉴 수정</h2>
<form id = "lodgePicUpdateForm" action="lodge_pic_update_list.do" method="post" enctype="multipart/form-data">

	<table>
		<tr>
			<c:forEach	items="${lodgePicList }" var="lodgePicList" varStatus="status">
				<td id = "test">
					사진<br>
					<img id="UploadedImg${status.index }" src="${initParam.root }/resources/img/lodge/${lodgePicList.picture_name}" style="width: 120px; height: 120px; margin-left: 20px;  border-radius: 100px; left: 220px;"><br>
					<input type="file" onchange="readURL${status.index }(this);" name="file[${status.index }]" id="uploadFile" ><br>
					<!-- <div id="fileuploadDiv"></div> -->
					<input type="hidden" name="picture_no" value="${lodgePicList.picture_no }">
					<input type="hidden" name="lodgetype" value="${lodgeVO.lodgetype }">
					<input type="hidden" name="lodge_no" value="${lodgePicList.lodge_no }">
				</td>
			
			</c:forEach>
		<tr>
	</table>

	<input type="submit" value="수정하기">
	<div id="viewHiddenPicNo"></div>

</form>





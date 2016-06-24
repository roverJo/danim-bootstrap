<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <% request.setCharacterEncoding("euc-kr"); %>
<%
 String foodshop_no=request.getParameter("foodshop_no");
%>
<script type="text/javascript" src="../common/js/jquery-1.9.1.min.js" charset="euc-kr"></script>
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
           $('#UploadedImg').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]); 
   } 
}
</script>
<div class="addHeight"></div>
<div class="container" align="center" id="contact-area">

<form action="foodmenu_multi_fileupload.do" method="post" enctype="multipart/form-data">
<img id="UploadedImg" src="" style="width: 180px; height: 180px; border-radius: 100px; left: 220px;">
<br><br><br>
<input type="file"  onchange="readURL(this);" name="uploadFile"><br>
<input type="text" name="food_name" placeholder="메뉴를 입력하세요" class="form-control"><br>
<input type="text" name="price" placeholder="가격을 입력하세요" class="form-control"><br>
<c:choose>
	<c:when test="${fvo==null }">
	<input type="hidden" name="foodshop_no" value=<%=foodshop_no %>>
	</c:when>
	<c:otherwise>
		<input type="hidden" name="foodshop_no" value="${fvo.foodshop_no }">
	</c:otherwise>
</c:choose>

<input type="submit" value="등록" class="btn btn-warning btn-lg">
</form>
</div>
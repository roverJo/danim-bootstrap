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
<h3>음식점 메뉴 추가하기</h3>

<%-- 파일업로드의 폼은 반드시 post 전송방식
	   enctype="multipart/form-data" 속성을 부여해야 함
 --%>
<!-- <form action="foodmenu_multi_fileupload.do" enctype="multipart/form-data" method="post">
<input type="text" name="userInfo"><br>
<input type="file" name="file[0]"><br>
<input type="file" name="file[1]"><br>
<input type="file" name="file[2]"><br>
<input type="submit" value="메뉴 업로드"><br>
</form> -->

<form action="foodmenu_multi_fileupload.do" method="post" enctype="multipart/form-data">
<img id="UploadedImg" src="" style="width: 120px; height: 120px; margin-left: 20px;  border-radius: 100px; left: 220px;"><br>
메뉴 이미지<input type="file"  onchange="readURL(this);" name="uploadFile"><br>
메뉴명<input type="text" name="food_name"><br>

가격<input type="text" name="price"><br>
<c:choose>
	<c:when test="${fvo==null }">
	<input type="hidden" name="foodshop_no" value=<%=foodshop_no %>>
	</c:when>
	<c:otherwise>
		<input type="hidden" name="foodshop_no" value="${fvo.foodshop_no }">
	</c:otherwise>
</c:choose>

<input type="submit" value="등록">
</form>
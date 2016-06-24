<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% request.setCharacterEncoding("euc-kr"); %>
<%
 String lodge_no=request.getParameter("lodge_no");
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
	<form action="lodgepicture_fileupload.do" method="post" enctype="multipart/form-data">
	
	<img id="UploadedImg" src="" style="width: 180px; height: 180px;  border-radius: 100px; left: 220px;">
	<br><br><br>
	<input type="file"  onchange="readURL(this);"  name="uploadFile"><br>
	<!-- 사진명<input type="text" name="picture_name"><br> -->
	<c:choose>
		<c:when test="${lvo==null }">
			<input type="hidden" name="lodge_no" value=<%=lodge_no %>>
		</c:when>
		<c:otherwise>
			<input type="hidden" name="lodge_no" value="${lvo.lodge_no }">
		</c:otherwise>
	</c:choose>
	
	<input type="submit" value="등록" class="btn btn-warning btn-lg"><br>
	</form>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#updateBtn").click(function(){ 
	if($("#title").val()==""){
	alert("제목을 입력하세요!")
	return false
	}
	if($("#content").val()==""){
	alert("본문을 입력하세요!")
	return false
	}else{
	$("#update_form").submit();
	}
	})
	$("#returnBtn").click(function(){
		location.href="${initParam.root}notice_content.do?no=${requestScope.nvo.noticeno}"
	})
})
</script>
<c:if test="${sessionScope.mvo==null}">
<script type="text/javascript">
alert("관리자제한");
location.href="${initParam.root}home.do";
</script>
</c:if>
<div class="container_12" align="center">
<div class="addHeight"></div>
	<div class="community">
		<form method="post" id="update_form" 
		action="${initParam.root}noticeupdate.do?no=${requestScope.nvo.noticeno}">
			<table class="update" border="1">
			<tr>
			<td>
			글번호:<input type="text" name="noticeno" value="${requestScope.nvo.noticeno}"  readonly></input>
			|제목:<input type="text" id="title" name="title" value="${requestScope.nvo.title}"></input>
			</td>
			<tr>
			<td>
			<textarea rows="16" cols="64" id="content" name="content">${requestScope.nvo.content}</textarea>
			</td>
			</tr>
			<tr>
			<td valign="middle">
			<img id="updateBtn" class="action btn-info" src="" alt="수정"  onclick="content_submit()">
			<img id="returnBtn" class="action" src="" alt="취소" onclick="cancel()">
			</td>
			</tr>
			</table>
		</form>
	</div>
	<div class="clear"></div>
</div>
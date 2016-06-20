<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#listImg").click(function(){
		location.href="notice_list.do";
	});
	$("#deleteImg").click(function(){ 
		if(confirm("게시물을 삭제하시겠습니까?"))
		location.href="notice_delete.do?&no=${requestScope.nvo.noticeno}";
	});
	$("#updateImg").click(function(){  
		if(confirm("게시물을 수정하시겠습니까?"))
		location.href="notice_update_view.do?no=${requestScope.nvo.noticeno}";
	});
});
</script>
<div class="container_12" align="center">
<div class="addHeight"></div>
	<div class="community">
	<table class="table">
	<caption>상세보기</caption>
	<c:set var="nvo" value="${requestScope.nvo}"/>
	<tr>
		<td>글번호:${nvo.noticeno}</td>
		<td align="right">제목:${nvo.title}</td>
	</tr>
	<tr>
		<td>작성자:${nvo.memberVO.nickname}</td>
		<td align="right">작성일시:${nvo.timePosted}</td>
	</tr>
	<tr>
		<td colspan="3">${nvo.content}</td>
	</tr>
	<tr>
		<td valign="middle" align="center" colspan="3">

		<img id="listImg" class="action" src="" alt="목록" onclick="notice_list()">
	<c:if test="${requestScope.nvo.memberVO.id==sessionScope.mvo.id}">
		<img id="deleteImg" class="action" src="" alt="삭제" onclick="notice_delete()">
		<img id="updateImg" class="action" src="" alt="수정" onclick="notice_update()">
	</c:if>
	

		</td>
		</tr>
	</table>
	</div>
	<div class="clear"></div>
</div>

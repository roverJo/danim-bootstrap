<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#writeBtn").click(function(){
		//showObj($("#write_form input[name=content]"));
//	alert($("#write_form input[name=content]"))

	if($("#title").val()==""){
	alert("제목을 입력하세요!");
	}else if($("#noticeContent").val()==""){
	alert("본문을 입력하세요!");
	}else{
	$("#write_form").submit();
	}
	});
	$("#resetBtn").click(function(){
	$("#write_form")[0].reset();
	});
});
function showObj(obj) {
	var str = "";
	for(key in obj) {
		str += key+"="+obj[key]+"\n";
	}

	alert(str);
	return;
}
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
		<form method="post" action="${initParam.root}write.do" id="write_form">
		<table class="inputForm">
		<caption>글쓰기</caption>
		<tbody>
		<tr>
		<td>제목</td>
		<td><input type="text" id="title" name="title" size="45"></td>
		</tr>
		<tr>
		<td>닉네임</td>
		<td>${sessionScope.mvo.nickname}</td>
		</tr>
		<tr>
		<td colspan="4" align="left">&nbsp;&nbsp;
		<textarea cols="52" rows="16" id="noticeContent" name="content"></textarea>
		</td>
		</tr>
		<tr>
		<td colspan="4" align="center">
		<input type="button" class="btn btn-success" id="writeBtn" value="입력"/>
		<input type="reset" class="btn btn-default" id="resetBtn" value="취소"/>
		<!-- <img id="writeBtn" class="action" src="" alt="입력"  onclick="content_submit()">
		<img id="resetBtn" class="action" src="" alt="취소" onclick="cancel()"> -->
		</td>
		</tr>
		</tbody>
		</table>
		</form>
	</div>
	<div class="clear"></div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#loginForm").submit(function(){
			/* if($("#loginForm :input[name=id]").val()==""){
				alert("아이디를 입력하세요!");
				return false;
			}else if($("#loginForm :input[name=password]").val()==""){
				alert("비밀번호를 입력하세요!");
				return false; 
			} */
		});
	});
</script>
<div align="center">
	<ul class="sf-menu">
		<c:if test="${sessionScope.mvo==null}">
			<form id="loginForm" action="login.do" method="post">
			아이디 <input type="text" name="id" placeholder="id" class="input-small" required>
			비밀번호  <input type="password" name="password" placeholder="password" class="input-small" required>
			<input type="submit" class="btn btn-primary" value="로그인">
			<a href="${initParam.root}inregi.do" class="btn btn-primary">회원가입</a>
			</form>
		</c:if>
		<c:if test="${sessionScope.mvo!=null}">
		${sessionScope.mvo.nickname}님 로그인 완료 | 
		<a href="${initParam.root}member_updateCheck.do">회원정보수정</a> |
		<c:if test="${sessionScope.mvo.admin>=1}">
			<a href="${initParam.root}admin_login.do">관리자페이지</a> |
		</c:if>
		<a href="${initParam.root}logout.do" class="btn btn-primary">로그아웃</a>
		</c:if>
	</ul>
	<div class="clear"></div>
</div>
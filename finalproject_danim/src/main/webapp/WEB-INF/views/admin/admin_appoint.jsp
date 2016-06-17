<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#selectForm :input[name=inputVal]").keydown(function (key) {
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	key.cancelBubble = true;
	            $("#clickBtn").click();
	            return false;
	        }
	    });
			$("#clickBtn").click(function(){
			var administer=$("#selectForm :input[name=administer]").val();
			var inputVal=$("#selectForm :input[name=inputVal]").val()
			$("#submitView").empty();
			$.ajax({
				type:"post",
				url:"findJSONAdmin.do?administer="+administer+"&inputVal="+inputVal,
				dataType:"json",
				success:function(jsonData){
					if(jsonData==""){
						$("#memberView").html("검색결과가 없습니다");
					}else{					
					var table = "<br><table border='1'><tr><td>아이디</td><td>닉네임</td><td>주소</td><td>이메일</td>";
						table+= "<td>회원권한</td><td>권한부여</td></tr>";
					for(var i=0;i<jsonData.length;i++){
						table+= "<tr><td>"+jsonData[i].id+"</td><td>"+jsonData[i].nickname+"</td><td>"+jsonData[i].address;
						table+= "</td><td>"+jsonData[i].email_add+"</td>";
						if(jsonData[i].admin>=1){
							table+="<td>운영진</td>";
						}else if(jsonData[i].admin==0){
							table+="<td>회원</td>";
						}
						table+="<td align='center'><input type='radio' name='appoint' value='"+jsonData[i].id+"'</td></tr>";
					}
					table+= "</table>";
					$("#memberView").html(table);
					if($("#memberView").html()!=""){
						$("#submitView").html("<input type='submit' value='권한부여' id='subBtn'>");
					}
					}
				}
			});
		});
		$("#selectForm").submit(function () {
			if($("#selectForm :checked[name=appoint]").val()==null){
				alert("선택하세요");
				return false;
			}
		});
		$("#adminTable input[name=fireBtn]").click(function(){
			if(confirm("권한을 해제하시겠습니까?")){
				location.href="${initParam.root}admin_fireAdmin.do?id="+$(this).attr("title");
			}
		});
	});
</script>
<c:if test="${sessionScope.mvo.admin==99}">
<h3>운영진 관리</h3>
<form id="selectForm" action="admin_appointMember.do">
운영진 추가 <select name="administer">
<option value="id">아이디</option>
<option value="nickname">닉네임</option>
</select>
<input type="text" name="inputVal" >
<input type="button" value="검색" id="clickBtn">
<div id="memberView"></div>
<div id="submitView"></div>
</form>
</c:if>
<c:if test="${sessionScope.mvo.admin>=1}">
<h3>운영진명단</h3>
<table border="1" id="adminTable">
<tr>
	<td>아이디</td><td>닉네임</td><td>주소</td><td>이메일</td><td>회원권한</td>
	<c:if test="${sessionScope.mvo.admin==99}">
	<td>권한해제</td>
	</c:if>
</tr>
<c:forEach items="${list}" var="list">
	<tr>
	<td>${list.id}</td><td>${list.nickname}</td><td>${list.address}</td><td>${list.email_add}</td>
	<c:if test="${list.admin==1}">
	<td>운영진</td>
	</c:if>
	<c:if test="${sessionScope.mvo.admin==99}">
	<td><input type="button" value="권한해제" name="fireBtn" title="${list.id}"></td>
	</c:if>
	</tr>	
</c:forEach>
</table>
</c:if>
<c:if test="${sessionScope.mvo.admin==0}">
<script type="text/javascript">
alert("관리자만 입장가능한 페이지입니다!");
location.href="${initParam.root}home.do";
</script>
</c:if>
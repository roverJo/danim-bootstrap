<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container_12">
<div class="addHeight"></div>
	<div class="community">
		<h3>공지사항</h3>
		<table class="table custab">
			<thead>
			<tr class="box-black">
				<th class="box-no">글번호</th>
				<th class="box-text">제목</th>
				<th class="box-text">작성자</th>
				<th class="box-text">작성일</th>
			</tr>
			</thead>
		<c:forEach var="nvo" items="${requestScope.lvo.list}">
		<tr>
			<td align="center">${nvo.noticeno}</td>
			<td><a href="${initParam.root}notice_content.do?no=${nvo.noticeno}">${nvo.title}</a></td>
			<td>${nvo.memberVO.nickname}</td>
			<td>${nvo.timePosted}</td>
		</tr>
		</c:forEach>
		</table>
		<c:if test="${sessionScope.mvo.admin==1||sessionScope.mvo.admin==99}">
		<a href="${initParam.root}notice_write.do">글쓰기</a>
		</c:if>
		
		<div class="addHeight"></div>	
		
<!-- 		<p class="paging"> -->
		<p id="owl1">
			<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
			<c:if test="${pb.previousPageGroup}">
			&nbsp;
			<a href="notice_list.do?pageNo=${pb.startPageOfPageGroup-1}" class="owl-prev">◀</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
				<c:choose>
				<c:when test="${pb.nowPage!=i}">
				<a href="notice_list.do?pageNo=${i}">${i}</a> 
				</c:when>
				<c:otherwise>
				${i}
				</c:otherwise>
				</c:choose>
				&nbsp;
			</c:forEach>	 
			<c:if test="${pb.nextPageGroup}">
				&nbsp;
				<a href="notice_list.do?pageNo=${pb.endPageOfPageGroup+1}" class="owl-next">▶</a>&nbsp;
			</c:if>
		</p>
	</div>
	<div class="clear"></div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>검색 순위</h2>
<form>
	<h3>맛집</h3>
	<table border="1">
			<tr>
				<td>위치</td>
				<td>이름</td>
				<td>종류</td>
			</tr>
		<c:forEach items="${foodlist }" var="foodlist">
			<tr>
				<td>${foodlist.detailarea_name }</td>
				<td>${foodlist.shopname }</td>
				<td>${foodlist.foodtype }</td>		
			</tr>
		</c:forEach>
	</table>
	<h3>숙박</h3>
	<table border="1">
		<tr>
				<td>위치</td>
				<td>이름</td>
				<td>종류</td>
			</tr>
			<c:forEach items="${lodgelist }" var="lodgelist">
				<tr>
					<td>${lodgelist.detailarea_name }</td>
					<td>${lodgelist.shopname }</td>
					<td>${lodgelist.lodgetype }</td>
				</tr>
			</c:forEach>
	</table>
</form>
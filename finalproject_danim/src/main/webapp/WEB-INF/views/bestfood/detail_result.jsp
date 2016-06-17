<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2 align="center">메뉴</h2>
<table  cellpadding="20">
	<tr>
		<c:forEach items="${dList }" var="dList">
		<%-- <td>${dList.shopname }</td> --%>
			<c:choose>
				<c:when test="${!empty dList}">
					<td>
						<img src="${initParam.root }resources/img/food/${dList.food_picture}"
						style="width: 120px; height: 120px; margin-left: 20px; border-radius: 100px; left: 220px;">
						<h4>메뉴 : ${dList.food_name }</h4>
						<h4>가격 : ${dList.price }원</h4>
					</td>

				</c:when>
			</c:choose>

		</c:forEach>
	</tr>
</table>
<br><br><br><br><br><br>

<a href="#" onClick="history.back(-1);">뒤로</a>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="addHeight"></div>

<table class="table">
<tr>
<c:forEach var="list" items="${requestScope.foodList.bestFoodList}" varStatus="i">
  <c:if test="${i.index != 0 && i.index % 4  == 0}">
	</tr>
		<tr>
</c:if>
		<td>
		<div class="searchForm">
		    <div class="thumbnail">
				<img src="${initParam.root }resources/img/food/${list.main_menu_picture}" alt="..."  class="thumimg">
							<h4>
								${list.detailarea_name }:${list.local_area }<br>
								${list.shopname }<br>
								${list.foodtype }<br>
								${list.main_food } : ${list.main_price }
							</h4>
							<p align="center">
								<a href="detailFood.do?foodshop_no=${list.foodshop_no }"
									class="btn btn-success" role="button">상세보기</a>
									&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${sessionScope.mvo!=null}">
											<a href="checkFoodShopNo.do?foodshop_no= ${list.foodshop_no }"class="btn btn-success" role="button">찜리스트로</a>
									</c:when>
								</c:choose>
							</p>
						</div>
					</div>
				</td>
			</c:forEach>
	</tr>
</table>

<p class="paging" align="center">
	<c:set var="pb" value="${foodList.pagingBean}"></c:set>
	<c:if test="${pb.previousPageGroup}">
		&nbsp;
		<a href="${initParam.root }searchBestFood.do?pageNo=${pb.startPageOfPageGroup-1}&detailarea_name=${foodList.bestFoodList[0].detailarea_name}&foodtype=${foodtype}">◀</a>&nbsp;
	</c:if>

	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
		<c:choose>
		<c:when test="${pb.nowPage!=i}">
			<a href="${initParam.root }searchBestFood.do?pageNo=${i}&detailarea_name=${foodList.bestFoodList[0].detailarea_name}&foodtype=${foodtype}">${i}</a> 
		</c:when>
		<c:otherwise>
		${i}
		</c:otherwise>
		</c:choose>
		&nbsp;
	</c:forEach>	 
	
	<c:if test="${pb.nextPageGroup}">
		&nbsp;
		<a href="${initParam.root }searchBestFood.do?pageNo=${pb.endPageOfPageGroup+1}&detailarea_name=${foodList.bestFoodList[0].detailarea_name}&foodtype=${foodtype}">▶</a>&nbsp;
		
	</c:if>
	 
</p>

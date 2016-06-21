<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="addHeight"></div>
<table class="table">
<tr>
<c:forEach var="list" items="${requestScope.list.lodgeList}" varStatus="i">
  <c:if test="${i.index != 0 && i.index % 4  == 0}">
	</tr>
	<tr>
	</c:if>
<td>
<div class="searchForm">
    <div class="thumbnail">
      <img src="${initParam.root}${list.lodgePictureVO.picture_name}" alt="..." class="thumimg">
        <h4>${list.lodgetype }:  <br> ${list.shopname }</h4> <br>
        <p align="center"><a href="${initParam.root}showlodge.do?no=${list.lodge_no}" class="btn btn-success" role="button">상세보기</a>
        &nbsp;&nbsp;&nbsp;<a href="login_checkZimByLodge.do?lodge_no=${list.lodge_no}" class="btn btn-success" role="button">경비카트로</a>
        </p>
      </div>
    </div>    
  </td>
</c:forEach>
</tr> 
</table>

<p class="paging" align="center">
	<c:set var="pb" value="${list.pagingBean}"></c:set>
	<c:if test="${pb.previousPageGroup}">
		&nbsp;
		<a href="${initParam.root }searchLodgeByNameAndKind.do?pageNo=${pb.startPageOfPageGroup-1}&detailarea_name=${list.lodgeList[0].detailarea_name}&lodgetype=${list.lodgeList[0].lodgetype}">◀</a>&nbsp;
	</c:if>

	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
		<c:choose>
		<c:when test="${pb.nowPage!=i}">
			<a href="${initParam.root }searchLodgeByNameAndKind.do?pageNo=${i}&detailarea_name=${list.lodgeList[0].detailarea_name}&lodgetype=${list.lodgeList[0].lodgetype}">${i}</a> 
		</c:when>
		<c:otherwise>
		${i}
		</c:otherwise>
		</c:choose>
		&nbsp;
	</c:forEach>	 
	
	<c:if test="${pb.nextPageGroup}">
		&nbsp;
		<a href="${initParam.root }searchLodgeByNameAndKind.do?pageNo=${pb.endPageOfPageGroup+1}&detailarea_name=${list.lodgeList[0].detailarea_name}&lodgetype=${list.lodgeList[0].lodgetype}">▶</a>&nbsp;
		
	</c:if>
	 
</p>

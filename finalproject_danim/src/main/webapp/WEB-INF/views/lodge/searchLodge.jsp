<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
<tr>
<c:forEach var="list" items="${requestScope.list}" varStatus="i">
  <c:if test="${i.index != 0 && i.index % 4  == 0}">
	</tr>
	<tr>
	</c:if>
<td>
<div class="searchForm">
    <div class="thumbnail">
      <img src="${initParam.root}${list.lodgePictureVO.picture_name}" alt="..." class="thumimg">
      <div class="caption">
        <h4>${list.lodgetype }:  <br> ${list.shopname }</h4>
        <p align="center"><a href="${initParam.root}showlodge.do?no=${list.lodge_no}" class="btn btn-success" role="button">상세보기</a>
        &nbsp;&nbsp;&nbsp;<a href="login_checkZimByLodge.do?lodge_no=${list.lodge_no}" class="btn btn-success" role="button">경비카트로</a>
        </p>
      </div>
    </div>    
  </div>
  </td>
</c:forEach>
</tr> 
</table>

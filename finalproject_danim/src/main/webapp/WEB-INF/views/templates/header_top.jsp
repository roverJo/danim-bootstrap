<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <div id="home"> -->
  <!--==============================
              Stuck menu
  =================================-->
<section id="stuck_container">
    <div class="container_12">
        <div class="grid_12">          
          <div class="navigation">
            <nav>
              <ul class="sf-menu">
               <li class="current"><a href="home.do">Home</a></li>
               <li><a href="${initParam.root }community_list.do?rownum=5">Community</a></li>
             <c:if test="${sessionScope.mvo!=null }">
               <li><a href="${initParam.root}zim_list.do">ZZim</a>
               <li><a href="${initParam.root}login_cartList.do">Cart</a></li>
             </c:if>
               <li><a href="${initParam.root }notice_list.do?pageNo=1">Notice</a></li>
               <li><a href="#" class="dropdown-toggle">Search
               <i class="fa fa-caret-down" aria-hidden="true" title="Toggle dropdown menu"></i>
               </a>
             	 	<ul>
					    <li><a href="${initParam.root}traffic_search.do">교통검색</a></li>
					    <li><a href="${initParam.root}lodge_lodge.do">숙박검색</a></li>
					    <li><a href="${initParam.root }bestfood_search.do">음식검색</a></li>
             		</ul>
               </li>
             </ul>
            </nav>	
            <div class="clear"></div>
          </div>       
         <div class="clear"></div>  
     </div> 
     <div class="clear"></div>
    </div> 
</section>
<div class="addHeight"></div>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${sessionScope.mvo==null}">
		<a href="${initParam.root }notice_list.do?pageNo=1">공지사항</a><br>
		<a href="${initParam.root }community_list.do?rownum=5">게시판</a><br>
		<a href="${initParam.root}traffic_search.do">교통검색</a><br>
		<a href="${initParam.root}lodge_lodge.do">숙박검색</a><br>
		<a href="${initParam.root }bestfood_search.do">음식검색</a><br>
	</c:when>
	<c:otherwise>
		<a href="${initParam.root }notice_list.do?pageNo=1">공지사항</a><br>
		<a href="${initParam.root }community_list.do?rownum=5">게시판</a><br>
		<a href="${initParam.root}traffic_search.do">교통검색</a><br>
		<a href="${initParam.root}lodge_lodge.do">숙박검색</a><br>
		<a href="${initParam.root }bestfood_search.do">음식검색</a><br>
		<a href="${initParam.root}zim_list.do">찜목록</a><br>
		<a href="${initParam.root}login_cartList.do">장바구니</a><br>
	</c:otherwise>
</c:choose>
 --%>
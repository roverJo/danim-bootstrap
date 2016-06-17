<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script type="text/javascript">
	$(document).ready(function(){	
		 $("#pic1").click(function(){
			$("#pictureView").html("<img src='${initParam.root}${requestScope.list[0].lodgePictureVO.picture_name }'width=800 height=500>");
		});
		 $("#pic2").click(function(){
				$("#pictureView").html("<img src='${initParam.root}${requestScope.list[1].lodgePictureVO.picture_name }'width=800 height=500>");
			});
		 $("#pic3").click(function(){
				$("#pictureView").html("<img src='${initParam.root}${requestScope.list[2].lodgePictureVO.picture_name }'width=800 height=500>");
			});		
		 $("#pic4").click(function(){
				$("#pictureView").html("<img src='${initParam.root}${requestScope.list[3].lodgePictureVO.picture_name }'width=800 height=500>");
			});	
	});
</script>
<form id="addLodgeForm" action="login_checkZimByLodge.do" method="get">
<input type="hidden" name="lodge_no" value="${requestScope.list[0].lodge_no }">
<table class="table table-striped ">
<tr>
<td>
<table class="table">
<tr>
<td width="50%"><br><br><div id="pictureView"><img src="${initParam.root}${requestScope.list[0].lodgePictureVO.picture_name }" alt="..."  width=800 height=500 align="middle"></div><br><br></td>
</tr>
<tr>
<td>
<img src="${initParam.root}${requestScope.list[0].lodgePictureVO.picture_name }" alt="..."  width=200 height=150 id="pic1"></img>
<img src="${initParam.root}${requestScope.list[1].lodgePictureVO.picture_name }" alt="..."  width=200 height=150 id="pic2"></img>
<img src="${initParam.root}${requestScope.list[2].lodgePictureVO.picture_name }" alt="..."  width=200 height=150 id="pic3"></img>
<img src="${initParam.root}${requestScope.list[3].lodgePictureVO.picture_name }" alt="..."  width=200 height=150 id="pic4"></img>
<hr>
<c:if test="${sessionScope.mvo != null }">

<input type="submit" class="col-md-12 btn btn-danger btn-lg" value="경비카트로">

</c:if>
</td>
</tr>
</table></td>
<td rowspan=3 width="40%">
<h2>${list[0].lodgetype } 정보</h2>
<hr>
<br>
지역 : ${requestScope.list[0].detailarea_name}
<br><br>
숙소 : ${requestScope.list[0].shopname }
<br><br>
가격 : ${requestScope.list[0].price}
<br>
<hr>
<h4>상세정보</h4><br><br>
${requestScope.list[0].shopinfo}
<br><br><br><br><br><br><br><br><br>
<div align="right"><a href="#top">TOP으로</a></div>
</td>
</tr>
</table>
</form>
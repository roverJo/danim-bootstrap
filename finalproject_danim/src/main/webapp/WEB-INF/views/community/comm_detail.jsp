<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function() {
		$("#contentUpdate").click(function() {
			if(confirm("수정하시겠습니까?")){
				location.href="comm_update_click.do?comm_no=${commVO.comm_no}";
				return false;
			}
		});
		$("#contentDelete").click(function() {
			if(confirm("삭제하시겠습니까?")){
				location.href="comm_delete.do?comm_no=${commVO.comm_no}";
				return false;
			}
		});
		
		
<%-- 댓글 --%>		
$("#commentParentText").keydown(function (key) {
    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
    alert(1)
    	key.cancelBubble = true;
        $("#commentParentSubmit").click();
        return false;
    }
});
		$("#commentParentSubmit").click(function( event ) {
			var pText = $("#commentParentText");
			if($.trim(pText.val())==""){
                alert("내용을 입력하세요.");
                pText.focus();
                return;
            }
			$.ajax({
				type: "post",
				url: "registerComment.do",
				data: $("#commentForm").serialize() + "&comm_no=${commVO.comm_no}",
				success : function(result){
						/* var commentParentText = '<tr id="r1" name="commentParentCode">'+
			            '<td colspan=2>'+
			                '<strong>'+item.communityVO.memberVO.nickname+'</strong> '+' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel" value="'+item.comment_no+'">삭제</a><p>'+item.content+'</p>'+
			            '</td>'+'</tr>'; */
						//var row = 						$("#commentTable").insertRow(0);
			            var row = document.getElementById("commentTable").insertRow(0);
						var cell1 = row.insertCell(0);
					    cell1.innerHTML = '<strong>'+result.communityVO.memberVO.nickname+'</strong> '+' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel" value="'+result.comment_no+'">삭제</a><p>'+result.content+'</p>';
				}//success
			});//ajax
            /* 
            //ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
            var pName = $("#commentParentName");
            //var pPassword = $("#commentParentPassword");//패스워드를 노출 시켰는데 저장하고 나서 저장한 날짜를 보여줄 예정
            var pText = $("#commentParentText");
               
            if($.trim(pName.val())==""){
                alert("이름을 입력하세요.");
                pName.focus();
                return;
             }else if($.trim(pPassword.val())==""){
                alert("패스워드를 입력하세요.");
                pPassword.focus();
                return;
            }else if($.trim(pText.val())==""){
                alert("내용을 입력하세요.");
                pText.focus();
                return;
            }
               
            var commentParentText = '<tr id="r1" name="commentParentCode">'+
                                        '<td colspan=2>'+
                                            '<strong>'+pName.val()+'</strong> '+' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                        '</td>'+
                                    '</tr>';
            //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
            if($('#commentTable').contents().size()==0){
                $('#commentTable').append(commentParentText);
            }else{
                $('#commentTable tr:last').after(commentParentText);
            }
               
            $("#commentParentName").val("");
            $("#commentParentPassword").val("");
                */
            $("#commentParentText").val("");
        });
<%-- 댓글 수정 --%>
$(document).on("click","#commentEditSubmit", function(){
	var commentNo = $(this).attr("title");
	var content = $(this).parent().parent().children().eq(4);
			//filter($("#commentEditText")).html());
	$('[type=text], textarea').each(function(){ this.defaultValue = this.value; });
	$.ajax({
		type: "post",
		url: "updateComment.do",
		data: "comment_no="+commentNo+"&content="+content.text(),
		success : function(result){
		}//success
	});//ajax
});
<%-- 댓글의 댓글 수정 --%>
$(document).on("click","#replyEditSubmit", function(){
	var commentNo = $(this).attr("title");
	var content = $(this).parent().parent().children().eq(4);
	$('[type=text], textarea').each(function(){ this.defaultValue = this.value; });
	$.ajax({
		type: "post",
		url: "updateReply.do",
		data: "reply_no="+commentNo+"&content="+content.text(),
		success : function(result){
		}//success
	});//ajax
});
<%-- --%>
        //댓글의 댓글을 다는 이벤트
        $(document).on("click","#commentChildSubmit", function(){
            //var cName = $("#commentChildName");
//            var cPassword = $("#commentChildPassword");
            var cText = $("#commentChildText");
            var comment_no = $(this).parent().parent().parent().parent().prev().attr("title");
           /*  if($.trim(cName.val())==""){
                alert("이름을 입력하세요.");
                cName.focus();
                return; */
            /* }else if($.trim(cPassword.val())==""){
                alert("패스워드를 입력하세요.");
                cPassword.focus();
                return; */
            /* }else */ 
            if($.trim(cText.val())==""){
                alert("내용을 입력하세요.");
                cText.focus();
                return;
            }
            var commentChildText="";
            var prevTr = $(this).parent().parent().parent().parent().prev();
            $.ajax({
				type: "post",
				url: "registerReply.do",
				data: "comment_no="+comment_no+"&content="+cText.val()+"&comm_no=${commVO.comm_no}",
				success : function(result){
						/* var commentParentText = '<tr id="r1" name="commentParentCode">'+
			            '<td colspan=2>'+
			                '<strong>'+item.communityVO.memberVO.nickname+'</strong> '+' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel" value="'+item.comment_no+'">삭제</a><p>'+item.content+'</p>'+
			            '</td>'+'</tr>'; 
						//var row = 						$("#commentTable").insertRow(0);
			            var row = document.getElementById("childCommentTable").insertRow(0);
						var cell1 = row.insertCell(0);
					    cell1.innerHTML = '<strong>'+result.memberVO.nickname+'</strong> '+'<a style="cursor:pointer;" name="pDel" value="'+result.reply_no+'">삭제</a><p>'+result.content+'</p>';
					    */
            commentChildText += '<tr name="commentChildCode">'+
                                        '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'+
                                        '<td style="width:99%">'+
                                            '<strong>'+result.memberVO.nickname+'</strong> '+
                                            '<a style="cursor:pointer;" name="cEdit" title="'+result.reply_no+'">수정</a> | '+
                                            '<a style="cursor:pointer;" name="cDel" value="'+result.reply_no+'">삭제</a>'+
                                            '<p>'+result.content+'</p>'+
                                        '</td>'+
                                    '</tr>';
                                    
            //앞의 tr노드 찾기
            //댓글 적는 에디터 삭제
            $("#commentEditor").remove();//여기에서 삭제를 해줘야 에디터tr을 안 찾는다.
            //댓글을 타고 올라가며 부모 tr을 찾음
            while(prevTr.attr("name")!="commentParentCode"){
                prevTr = prevTr.prev();
            }
            prevTr.after(commentChildText);
/*             //while를 타는지 체크
            var check = false;
            //다음 노드가 댓글(depth1)의 댓글인지 찾기위해 next
            var nextTr = prevTr.next();
            //뒤에 댓글(depth1)의 댓글(depth2_1)이 없다면 바로 붙인다.
            if(nextTr.attr("name")!="commentChildCode"){
                prevTr.after(commentChildText);
            }else{
                //댓글(depth1)의 댓글(depth2_n)이 있는경우 마지막까지 찾는다.
                while(nextTr.attr("name")=="commentChildCode"){
                    nextTr = nextTr.next();
                    check = true;
                }
            } 
               
            if(check){//댓글(depth1)의 댓글(depth2_n)이 있다면 그 댓글(depth2_n) 뒤에 댓글(depth2_n+1) 추가
                nextTr = nextTr.prev();//while문에서 검색하느라 next로 넘거갔던거 다시 앞으로 돌려줌
                nextTr.after(commentChildText);
            }*/
				}//success
			});//ajax
        });

		//답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
        $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
            if($(this).attr("name")=="pDel"){
                if (confirm("정말로 삭제하시겠습니까?") == true) {
                    var $commentNo = $(this).attr('title');
                    $.ajax({
                		type: "post",
                		url: "deleteComment.do",
                		data: "comment_no="+$commentNo,
                		success : function(result){
                		}//success
                	});//ajax
                    var delComment = $(this).parent().parent();
                    var nextTr = delComment.next();
                    var delTr;
                    //댓글(depth1)의 댓글(depth2_1)이 있는지 검사하여 삭제
                    while(nextTr.attr("name")=="commentCode"){
                        nextTr = nextTr.next();
                        delTr = nextTr.prev();//삭제하고 넘기면 삭제되서 없기 때문에 다음값을 가져오기 어려워 다시 앞으로 돌려서 찾은 다음 삭제
                        delTr.remove();
                    }
                       
                    delComment.remove();
                    //$('#deleteCommentForm input[name*=commentNo]').val($commentNo);
                    //$('#deleteCommentForm').submit();
                }
                //return false;
                
                /* if (confirm("답글을 삭제 하시면 밑에 답글도 모두 삭제 됩니다. 정말 삭제하시겠습니까?") == true){    //확인
                       
                }else{   //취소
                    return;
                } */
            }else if($(this).attr("name")=="cDel"){
                if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                	var $commentNo = $(this).attr('title');
                    $.ajax({
                		type: "post",
                		url: "deleteReply.do",
                		data: "reply_no="+$commentNo,
                		success : function(result){
                		}//success
                	});//ajax
                    $(this).parent().parent().remove();
                }else{   //취소
                    return;
                }
            }else if($(this).attr("name")=="pEdit"){
            	var $commentNo = $(this).attr('title');
            	var content = $(this).siblings().filter("p");
            	var parentElement = $(this).parent().parent();
                //댓글달기 창을 없앤다.
                //$("#commentEditor").remove();
                //부모의 하단에 댓글달기 창을 삽입
                var commentEditor = '<tr id="commentEditor">'+
                                        '<td style="width:1%"> </td>'+
                                        '<td>'+
                                            '<span class="form-inline" role="form">'+
                                                '<p>'+
                                                    '<div class="form-group">'+
                                                        '<input type="text" id="commentEditName" name="commentEditName" class="form-control col-lg-2" data-rule-required="true" value="${sessionScope.mvo.nickname}" maxlength="10" readonly>'+
                                                    '</div>'+
                                                    '<div class="form-group">'+
                                                        '<button type="button" id="commentEditSubmit" class="btn btn-default" title='+$commentNo+'>확인</button>'+
                                                    '</div>'+
                                                '</p>'+
                                                    '<textarea id="commentEditText" name="commentEditText" class="form-control" style="width:98%" rows="4">'+content.text()+'</textarea>'+
                                            '</span>'+
                                        '</td>'+
                                    '</tr>';
                                       
                parentElement.html(commentEditor);
            }else if($(this).attr("name")=="cEdit"){
            	var $commentNo = $(this).attr('title');
            	var content = $(this).siblings().filter("p");
            	var parentElement = $(this).parent().parent();
                //댓글달기 창을 없앤다.
                //$("#commentEditor").remove();
                //부모의 하단에 댓글달기 창을 삽입
                var commentEditor = '<tr id="commentEditor">'+
                                        '<td style="width:1%"> </td>'+
                                        '<td>'+
                                            '<span class="form-inline" role="form">'+
                                                '<p>'+
                                                    '<div class="form-group">'+
                                                        '<input type="text" id="commentEditName" name="commentEditName" class="form-control col-lg-2" data-rule-required="true" value="${sessionScope.mvo.nickname}" maxlength="10" readonly>'+
                                                    '</div>'+
                                                    '<div class="form-group">'+
                                                        '<button type="button" id="replyEditSubmit" class="btn btn-default" title='+$commentNo+'>확인</button>'+
                                                    '</div>'+
                                                '</p>'+
                                                    '<textarea id="replyEditText" name="replyEditText" class="form-control" style="width:98%" rows="4">'+content.text()+'</textarea>'+
                                            '</span>'+
                                        '</td>'+
                                    '</tr>';
                                       
                parentElement.html(commentEditor);
            }else{
                //자기 부모의 tr을 알아낸다.
                var parentElement = $(this).parent().parent();
                //댓글달기 창을 없앤다.
                $("#commentEditor").remove();
                //부모의 하단에 댓글달기 창을 삽입
                var commentEditor = '<tr id="commentEditor">'+
                                        '<td style="width:1%"> </td>'+
                                        '<td>'+
                                            '<span class="form-inline" role="form">'+
                                                '<p>'+
                                                    '<div class="form-group">'+
                                                        '<input type="text" id="commentChildName" name="commentChildName" class="form-control col-lg-2" data-rule-required="true" value="${sessionScope.mvo.nickname}" maxlength="10" readonly>'+
                                                    '</div>'+
                                                   /*  '<div class="form-group">'+
                                                        ' <input type="password" id="commentChildPassword" name="commentChildPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">'+
                                                    '</div>'+ */
                                                    '<div class="form-group">'+
                                                        '<button type="button" id="commentChildSubmit" class="btn btn-default">확인</button>'+
                                                    '</div>'+
                                                '</p>'+
                                                    '<textarea id="commentChildText" name="commentChildText" class="form-control" style="width:98%" rows="4"></textarea>'+
                                            '</span>'+
                                        '</td>'+
                                    '</tr>';
                                       
                parentElement.after(commentEditor); 
            }
               
        });
           
        $( "#list" ).click(function( event ) {
            location.href='/community/notice';
        });
        $( "#modify" ).click(function( event ) {
            location.href='/community/modify/notice/${community.id}';
        });
        $( "#delete" ).click(function( event ) {
            location.href='/community/delete/notice/${community.id}';
        });
        $( "#write" ).click(function( event ) {
            location.href='/community/notice/edit';
        });
	});
</script>
<table class="list">
	<thead>
		<tr>
			<th class="no"><h3>상세내용</h3></th>
		</tr>
	</thead>
	<tbody>			
		<tr>
			<td>${commVO.content }</td>
		</tr>
		<tr>
		<c:if test="${commVO.memberVO.id==sessionScope.mvo.id }">
			<td><input type="button" id="contentUpdate" value="수정" class="btn btn-primary"><input type="button" id="contentDelete" value="삭제" class="btn btn-danger"></td>
		</c:if>		
		</tr>
	</tbody>
</table>

<div class="addHeight"></div>

<table>
<thead>
		<tr><th><h4>Comments</h4></th></tr>
</thead>
</table>

<c:if test="${sessionScope.mvo!=null }">
<form id="commentForm">
<table class="table table-condensed">
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                    <p>
                                        <%-- <div class="form-group">
                                            <input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" value="${sessionScope.mvo.nickname }" maxlength="10" readonly>
                                        </div> --%>
                                        <!-- <div class="form-group">
                                            <input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">
                                        </div> -->
                                        <div class="form-group">
                                            <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">확인</button>
                                        </div>
                                    </p>
                                        <textarea id="commentParentText" name="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4" placeholder="댓글"></textarea>
                                </span>
                            </td>
                        </tr>
</table>
</form>
</c:if>

<table id="commentTable" class="table table-condensed">
	<c:forEach items="${commentList}" var="item">
		<tr id="r1" name="commentParentCode" title="${item.comment_no}">
			<td colspan=2><strong>${item.communityVO.memberVO.nickname}</strong>
			<c:if test="${sessionScope.mvo!=null }">
			<a style="cursor:pointer;" name="pAdd">답글</a>
			<c:if test="${item.communityVO.memberVO.id==sessionScope.mvo.id }">
			| <a style="cursor:pointer;" name="pEdit" title="${item.comment_no}">수정</a>
			| <a style="cursor:pointer;" name="pDel" title="${item.comment_no}">삭제</a>
			</c:if>
			</c:if> 
				<p>${item.content}</p>
			</td>
		</tr>
				<!-- <table id="childCommentTable"> -->
		<c:if test="${!empty item.replyList }">
			<c:forEach items="${item.replyList }" var="child">
				<tr name="commentChildCode">
							<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>
							<td style="width:99%">
								<strong>${child.memberVO.nickname }</strong>
								<c:if test="${sessionScope.mvo!=null }">
									<!-- <a style="cursor:pointer;" name="cAdd">답글</a> -->
									<c:if test="${child.memberVO.id==sessionScope.mvo.id }">
										<a style="cursor:pointer;" name="cEdit" title="${child.reply_no}">수정</a>
										| <a style="cursor:pointer;" name="cDel" title="${child.reply_no}">삭제</a>
									</c:if>
								</c:if>
								<p>${child.content }</p>
							</td>
				</tr>
			</c:forEach>
		</c:if>
				<!-- </table> -->
	</c:forEach>
</table>
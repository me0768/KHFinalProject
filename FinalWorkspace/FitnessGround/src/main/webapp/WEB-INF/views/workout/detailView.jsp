<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Modal -->
  <div class="modal fade" id="detailView" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          </button>
          <h4 class="modal-title" id="video_title"> </h4>
         
        </div>
        	<div class="modal-body">
				<div class="modal-play" id="video_detail"></div>
				<div class="modal-desc">
					<div id="video_explain" style="color: black; font-size:13px">
						<span id="span-content"></span>
					</div>
					<hr>
					<div id="read_count" style="color:black; font-size:13px"></div>
					
				
					<c:if test="${sessionScope.user==null }">
						<div id="video-reply" style="color:black;">
							<input type="text" id="reply-input" placeholder="댓글을 입력하세요">
							<button type="submit" id="reply-btn" onclick="loginMessage();">댓글달기</button>
						</div>
					</c:if>
					
					<c:if test="${sessionScope.user !=null }">
						<div id="video-reply" style="color:black;">
							<input type="text" id="reply-input" placeholder="댓글을 입력하세요">
							<button type="submit" id="reply-btn" onclick="insertComment();">댓글달기</button>
						</div>
					</c:if>
					
					<div id="reply_content" style="color:black;"></div>
					
					
				</div>
			</div>
      </div>
    </div>
  </div>
<script type="text/javascript">
	function loginMessage(){
		alert("로그인이 필요한 서비스 입니다.");
		
	}	

	function detailView(v_no){	//모달창 띄우는 메서드
		$("#detailView").show();
		$("#detailView").modal();
		
		viewVideo(v_no);			
		selectComment(v_no);
	}
	
	function viewVideo(v_no){ //클릭한 객체 가져오는 메서드
		$.ajax({
			url:"detail.do",
			dataType:"json",
			type:"get",
			data : {"v_no" : v_no},
			success:function(data){
			
			var responseData = data.health;
			var src= "";
			
			
			src="<iframe width='600' height='400' src="+ responseData.url.replace(/\^/g,"&")
			+"frameborder='0' gesture='media' allow='encrypted-media' allowfullscreen name='iframe'></iframe>"
			
			
			$("#read_count").html("조회수  : " + responseData.readcount);
			$("#video_title").html(responseData.title.replace(/\+/g," "));
			$("#video_explain").html(responseData.content);
			$("#video_detail").html(src);
				
				
			},
			error: function(request, status, errorData){
				alert("error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
			}
				
		})
	}
	
	function selectComment(v_no){	//댓글 select
		$.ajax({
			url:"selectComment.do",
			dataType:"json",
			type:"get",
			data : {"v_no" : v_no},
			success:function(data){
				var values="";
				console.log("dataList!!!!!" + data.commentList);
				console.log("size!!!!!!!!" + data.commentList.length);
				console.log("data.commentList.comment" + data.commentList.comment);
				for(var i =0; i<data.commentList.length;i++){
					values += "<hr>" + data.commentList.comment +"<hr>"
				}
				
				$("#reply_content").html(values);/* 
				$(data.commentList).each(function(){
					console.log(this.content);
				}) */
				
			},
			error: function(request, status, errorData){
				alert("error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
			}
			
		})
	}
  	
	function insertComment(v_no){	//댓글 insert
		var content = $("#reply-input").val();
		var queryString ={"v_no" : v_no,"content" : content};
		$.ajax({
			url:"reply.do",
			dataType:"json",
			type:"get",
			data : queryString,
			success:function(data){
			
				
			},
			error: function(request,status,errorData){
				alert("error code : " + request.status + "\n" +
						"message : " + request.responseText + "\n" +
						"error : " + errorData);
			}
		})
	}
	
	function updateComment(v_no){	//댓글 update
		
	}
	
	function deleteComment(v_no){ //댓글 delete
		
	}
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Modal -->
  <div class="modal fade" id="detailView" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" id="workout-dialog">
      <div class="modal-content" id="workout-content">
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
						<div id="nvideo-reply" style="color:black;">
							<input type="text" id="reply-input" placeholder="댓글을 입력하세요">
							<button type="submit" id="reply-btn" onclick="loginMessage();">댓글달기</button>
						</div>
					</c:if>
					
					<c:if test="${sessionScope.user !=null }">
						
						<div id="video-reply" style="color:black; font-size:13px;"> <!-- 댓글 입력하는 곳 -->
							
						</div>
					</c:if>
					<!-- 댓글 보여주는 곳 -->
					<div id="reply_content" style="color:black; font-size:13px;">
						
					</div>
						
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
		var comment = '<input type="text" id="reply-input" placeholder="댓글을 입력하세요">' +
					 '<input type="hidden" id="user_no" value="' + ${sessionScope.user.user_no}  + '" >' +
					'<button type="submit" id="reply-btn" onclick="return insertComment(' + v_no + ');">댓글달기</button>';
		$("#video-reply").html(comment);
		
				
		viewVideo(v_no); //모달창에서 영상 띄워주는 메서드			
		
		selectComment(v_no); 
		

		$("#reply-input").keydown(function(key){
			if(key.keyCode==13){
				insertComment(v_no);
			}
		})
		
	}
	
	function viewVideo(v_no){ //모달창에서 영상 띄워주는 메서드
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
		var user_no = $("#user_no").val();
		
		$.ajax({
			url:"selectComment.do",
			dataType:"json",
			type:"post",
			data : {"v_no" : v_no},
			success:function(data){
				var values="";
				
				//스크롤 바로 수정 해야함
				for(var i =0; i<data.commentList.length;i++){
					values += "<hr>" +"작성자 : " + data.commentList[i].name + "내용: " + data.commentList[i].content+ " 날짜 : " + data.commentList[i].reply_date
					
					if(user_no==data.commentList[i].user_no){
						
						values+="<button class='btn btn-primary' type='submit' onclick ='deleteComment("+ v_no +")'>삭제</button><hr>"+
								"<input type='hidden' id='vb_no' value="+data.commentList[i].vb_no+">"
					}
				}
				
				$("#reply_content").html(values); 
			
				
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
		
		if(content==""){
			alert("댓글 내용을 입력 해 주세요!");
			focus("#reply-input");
			return false;
		}
	
		var user_no = $("#user_no").val();
	
		var queryString ={"v_no" : v_no,"content" : content,"user_no":user_no};
		
		$.ajax({
			url:"insertReply.do",
			dataType:"json",
			type:"post",
			data : queryString,
			async:false
		});
		
		$("#reply-input").val(' ');
		selectComment(v_no);
				
		return true;
	}
	
	function deleteComment(v_no){ //댓글 delete
		var vb_no = $("#vb_no").val();
		$.ajax({
			url:"deleteReply.do",
			dataType:"json",
			type:"post",
			data:{"v_no":v_no,"vb_no":vb_no},
			async:false
		});
	
		selectComment(v_no);
		
	}
	
	function updateComment(v_no){	//댓글 update
		
	}
	
	
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Modal -->
  <div class="modal fade" id="detailView" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" id="workout-dialog">
      <div class="modal-content" id="workout-content">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">x
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
					
					<div id="like_up">
						<!-- <button type="submit" id="like-btn" onclick="likeUp()">
							좋아요 </button>
						<span id="like" style="color:black; font-size:13px">//좋아요 갯수 :</span>  -->
					</div>					
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

	function detailView(v_no,category1,category2){	//모달창 띄우는 메서드
		$("#detailView").show();
		$("#detailView").modal();
		console.log(v_no);
		console.log(category1);
		console.log(category2);
		
	
		var comment = '<input type="text" id="reply-input" placeholder="댓글을 입력하세요">' +
					 '<input type="hidden" id="user_no" value="' + ${sessionScope.user.user_no}  + '" >' +
					 /* '<input type="hidden" id="user" value="' + ${sessionScope.user}  + '" >' +  */
					 '<input type="hidden" id="v_no" value="' + v_no  + '" >' +
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
	
	function viewVideo(v_no){ //모달창에서 영상 띄워주는 메서드 (조회수, 제목, 설명 ,좋아요 누르는부분)
		$.ajax({
			url:"detail.do",
			dataType:"json",
			type:"get",
			data : {"v_no" : v_no},
			success:function(data){
			
			var responseData = data.health;
			var src= "";
			var like="";
			var likeCount = selectLikeCount(v_no);
			
			/* 모달창 왼쪽에 영상 띄워주는 부분 */			
			src="<iframe width='600' height='400' src="+ responseData.url.replace(/\^/g,"&")
			+"frameborder='0' gesture='media' allow='encrypted-media' allowfullscreen name='iframe'></iframe>"
			
			if($("#user").val()==null){
				like='<button type="submit" class="btn btn-default" id="like-btn"'+
				' onclick="loginMessage()"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>' +
				'<span style="color:black; font-size:13px">좋아요:</span>'+
				'<span id="like_count" style="color:black; font-size:13px">' + likeCount + '</span>'
				
			}else{
				like='<button type="submit" class="btn btn-default" id="like-btn" onclick="likeUp(' 
					+ '\'' + responseData.category1 +'\'' + ',' + '\'' + responseData.category2  + '\'' +')"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> </button>' +
				'<span style="color:black; font-size:13px">//좋아요 :</span>'+
				'<span id="like_count" style="color:black; font-size:13px">' + likeCount + '</span>'
				
			}
			
			
				
			$("#read_count").html("조회수  : " + responseData.readcount);
			$("#video_title").html(responseData.title.replace(/\+/g," "));
			$("#video_explain").html(responseData.content);
			$("#video_detail").html(src);
			$("#like_up").html(like);
				
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
		
		if(content=="" || content==null){
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
	
	//좋아요 증가처리
	function likeUp(category1,category2){	
		var v_no = $("#v_no").val();
		var user_no = $("#user_no").val();
		
		console.log(v_no);
		console.log(user_no);
		console.log("좋아요" + category1);
		console.log("좋아요 " + category2);
		
		$.ajax({
			url:"likeUp.do",
			dataType:"json",
			type:"post",
			data:{"v_no":v_no,"user_no":user_no,"category1":category1,"category2":category2},
			async:false
		});
		
		selectLikeCount(v_no);
	}
	
	function selectLikeCount(v_no){
		$.ajax({
			url:"likeCount.do",
			dataType:"json",
			type:"post",
			data:{"v_no":v_no},
			success:function(data){
				var likeCount = data.likeCount;
				$("#like_count").html(likeCount + "개");
			},
			error: function(request, status, errorData){
				alert("error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
			}
		});
	}
	
	

	
	
</script>

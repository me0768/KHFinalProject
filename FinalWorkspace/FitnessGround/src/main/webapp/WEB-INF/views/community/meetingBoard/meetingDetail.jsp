<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:import url="../../include/common/head.jsp" />
	
	<style type="text/css">
    h1{
    font-size: 30pt;
    }
    div#detail_all_div{
    padding: 5%;
    }
    div#detail_div{
    border: 1px solid;
    }
    </style>
	
	
	<c:import url="../../include/common/headend.jsp" />
  
<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
  
	<div id="page-wrapper">
		<!-- Header -->
		<div id="mypage_header">
            <!-- Nav -->
			<c:import url="../../include/main/nav.jsp" />
			
			<c:import url="../../user/login.jsp"/>
			<c:import url="../../user/findidpwd.jsp"/>
			<c:import url="../../user/register.jsp"/>
		</div>
    </div>
       
   
    <script type="text/javascript">
 	
    //목록
    function meetingCommentList(mb_no){
   		$.ajax({
   			 url:"meetingCommentList.do",
   			 type:"post",
   			 dataType:"json",
   			 data:{"mb_no": mb_no},
   			 success: function(data)
   			 {
   				 console.log(data);
   				 console.log(data.mblist);
   				 var values = "";
   				 
   				 for(var i in data.mblist)
   					 {
   					 values += "<div class='jumbotron'><div class='col-md-2 text-center'><b>" + data.mblist[i].name + "<b></div>"+
   					"<div class='col-md-6 text-center'>" +  data.mblist[i].content + "</div><div class='col-md-2 text-center'>" + data.mblist[i].reply_date+ "</div><div class='col-md-2 text-right'><a class='btn' type='submit' onclick='meetingCommentDelete("+data.mblist[i].mb_no+","+ data.mblist[i].mbc_no +")'>삭제</a></div>"
   					+"</div>";
   					 }
   			    $("#meetingCommentList").html(values);
   			 }
   		});
   	}
    
  	function meetingCommentInsert(mb_no){
  		var content = $("#commentInsert").val();
  		var user_no = $("#user_no").val();
  		$.ajax({
  				url:"meetingCommentInsert.do",
  				type:"post",
  				data :{"mb_no":mb_no,"content":content,"user_no":user_no},
  				async:false
  		});
  		console.clear();
  		$("#commentInsert").val('');
  		meetingCommentList(mb_no);
  	}
  	
  	function meetingCommentDelete(mb_no,mbc_no){ //댓글 delete
  	
		$.ajax({
			url:"meetingCommentDelete.do",
			type:"post",
			data:{"mbc_no":mbc_no},
			async:false
		});
		console.clear();
		meetingCommentList(mb_no);
		
	}
    
  	$(window).on("load", function() {
  		$('#commentInsert').on('keydown', function(e) {
  			var keyCode = e.which;

  			if (keyCode === 13) { // Enter Key
  				meetingCommentInsert(${meeting.mb_no});
  				console.clear();
  			}
  		});	
	});
  	
	</script>
     <div class="container">
    <br>
    <h1 align="center">${meeting.title}</h1>
     <div id="detail_ail_div"> 
    <div id="detail_div">
    	<div>

    	</div>
     	<p align="center">${meeting.name}</p>
     	<p>${meeting.content}</p>
        </div>
        <input type="hidden" ${meeting.readcount}/>
    <div>
   </div> 
   <a href="meetingUpdate.do?no=${meeting.mb_no}" class="btn">수정</a>
   <a href="meetingDelete.do?no=${meeting.mb_no}" class="btn">삭제</a>
   <a href="meeting.do" class="btn">목록</a><br>
    </div>
   <!-- =========================댓글 쓰는 공간================================== -->
    <!--  댓글  -->
    <p align="center">---------------------------------------- 댓글 ---------------------------- </p>
 	<!--  댓글 입력 -->
 	
 	<div id="meetingCommentInsert" class="input-group" >
 		<input type="text"  class="form-control" id="commentInsert" placeholder="댓글을 입력하세요">
		<input type="hidden" id="user_no" value="${sessionScope.user.user_no}">
		<span class="input-group-btn">
        <button class="btn btn-default" type="button" id="commentInsertBtn" onclick="meetingCommentInsert(${meeting.mb_no});">입력</button>
     	</span>
	</div>	
	
   <!--댓글 목록-->
   <div id="meetingCommentList">
   	<script type="text/javascript">
   		meetingCommentList("${meeting.mb_no}");
   	</script>    
   </div>   
   </div>    
    <c:import url="../../include/main/footer.jsp" />
    <c:import url="../../include/common/end.jsp" />
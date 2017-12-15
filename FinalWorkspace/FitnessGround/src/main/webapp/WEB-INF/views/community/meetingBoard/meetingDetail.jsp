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
      <c:if test = "${result ne null }">
      <script type="text/javascript">
      alert("${result}");
      </script>
      </c:if>
    
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
    <p>댓글</p><hr> 
    <div id="meeting_comment_list">
    
    
    </div>  
	
	
	<div id="meeting_comment_insert">
		${sessionScope.user.name}
		<input type="text" id="input_meeting" placeholder="댓글을 입력하세요">
		<button type="submit" id="meetingCommentBtn" class="btn">댓글입력</button>
	</div>
	
	<hr>
	
       
    <c:import url="../../include/main/footer.jsp" />
    <c:import url="../../include/common/end.jsp" />
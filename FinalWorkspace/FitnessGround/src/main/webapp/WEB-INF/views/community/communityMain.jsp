<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.fitnessground.community.model.vo.MeetingBoard,
    					 com.kh.fitnessground.community.model.vo.CommunityBoard, java.sql.Date, java.util.ArrayList" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<c:import url="../include/common/head.jsp" />
	
	<style type="text/css">
    h1#community_title{
    font-family:"Lato";
    font-size:40pt;
    font-weight:bold;
    color:purple;
    }
    h4{
    font-size:20pt;
    font-weight:bold;
    }
  	div#community_main{
  	padding-left:100pt;
  	}
	 div#community_div{
	float:left;
	padding-left:100pt;
	font-weight:bold;
	}
	button#community_detail{
	font-size:10pt;
	} 
  </style>
	
	
	<c:import url="../include/common/headend.jsp" />
    
	<div id="page-wrapper">
		<!-- Header -->
		<div id="mypage_header">
            <!-- Nav -->
			<c:import url="../include/main/nav.jsp" />
			
			<c:import url="../user/login.jsp"/>
			<c:import url="../user/findidpwd.jsp"/>
			<c:import url="../user/register.jsp"/>
		</div>
    </div>
    
  

<script type="text/javascript">
function meetingPage(){
	location.href="meeting.do";
	}
function reviewPage(){
	location.href="review.do";
}
function qnaPage(){
	location.href="qna.do";
}
</script>

<br><br><br>
<div id="community_main">
<h1 id=community_title>커뮤니티</h1>
<br><br><br>
<div id="community_div">
<h4>운동같이해요<button id="community_detail"onclick="meetingPage();">더보기</button></h4>

<hr>
</div>
<div id="community_div">
<h4>리뷰<button id="community_detail" onclick="reviewPage();">더보기</button></h4>

<hr>
</div>

<div id="community_div">
<h4>Q & A<button id="community_detail" onclick="qnaPage();">더보기</button></h4>

<hr>
</div>
</div>

    <c:import url="../include/main/footer.jsp" />

    <c:import url="../include/common/end.jsp" />
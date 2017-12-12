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
    h4#community_h4{
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
	font-size:9pt;
	}
	button#community_detail{
	font-size:1pt;
	
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
<h4 id="community_h4">운동같이해요 &nbsp;&nbsp;<button id="community_detail"onclick="meetingPage();">더보기</button></h4>
<c:forEach items="${mlist}" var="mb">
<table>

<tr><td>${mb.name}</td> <td><a href="meetingDetail.do?no=${mb.mb_no}">${mb.title}</a></td><td>${mb.upload_date}</td></tr><hr>
</table>
 </c:forEach>

<hr>
</div>
<div id="community_div">
<h4 id="community_h4">리뷰&nbsp;&nbsp;<button id="community_detail" onclick="reviewPage();">더보기</button></h4>
<c:forEach items="${rlist }" var="rb">
	
<table>
<tr><td>${rb.name}</td> <td><a href="reviewDetail.do?no=${rb.cb_no}">${rb.title}</a></td><td>${rb.upload_date}</td></tr><hr>
</table>
  
 </c:forEach>

<hr>
</div>

<div id="community_div">
<h4 id="community_h4">Q & A&nbsp;&nbsp;<button id="community_detail" onclick="qnaPage();">더보기</button></h4>
<c:forEach items="${qlist }" var="qb">

<table>
<tr><td>${qb.name}</td> <td><a href="qnaDetail.do?no=${qb.cb_no}">${qb.title}</a></td><td>${qb.upload_date}</td></tr><hr>

</table>
 </c:forEach>
<hr>
</div>
</div>

    <c:import url="../include/main/footer.jsp" />

    <c:import url="../include/common/end.jsp" />
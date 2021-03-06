<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.fitnessground.community.model.vo.MeetingBoard,
    					 com.kh.fitnessground.community.model.vo.CommunityBoard, java.sql.Date, java.util.ArrayList" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<c:import url="../include/common/head.jsp" />
	
	<style type="text/css">
 	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
    h1#community_title{
 	font-family: 'Jeju Gothic';
    font-size:40pt;
    font-weight:bold;
    color:black;
    }
    h4#community_h4{
    font-size:20pt;
    font-weight:bold;
    }
  	div#community_main{
  	padding-left:100pt;
  	}
	div#community_div_meeting{
	float:left;
	padding-left:100pt;
	font-weight:bold;
	font-size:8pt;
	width:30%;
	}
	div#community_div_riview{
	float:left;
	padding-left:30pt;
	font-weight:bold;
	font-size:8pt;
	width:30%;
	}
	div#community_div_qna{
	float:left;
	padding-left:30pt;
	font-weight:bold;
	font-size:8pt;
	width:30%;
	}
	button#community_detail_meeting{
	position:relative;
	left:30%;
	background-color:#11A6B7;
	color:white;
	font-size:1pt;
	width:50px;
	}
	button#community_detail_review{
	position:relative;
	left:70%;
	background-color:#11A6B7;
	color:white;
	font-size:1pt;
	width:50px;
	} 
	button#community_detail_qna{
	position:relative;
	left:65%;
	background-color:#11A6B7;
	color:white;
	font-size:1pt;
	width:50px;
	}  
	table#detail_table{
	text-overflow:ellipsis;
	}
	hr#hr_line{
	border: 0.5px solid gray;
	}
	a#a_title{
	white-space: nowrap;
	overflow: hidden;
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
<br><br>
<div id="community_div_meeting">
<h4 id="community_h4">운동같이해요<button class="btn btn-default" id="community_detail_meeting"onclick="meetingPage();">더보기</button></h4>
<c:forEach items="${mlist}" var="mb">
<table id="detail_table">
		<colgroup>
			<col width="25%"/>
			<col width="50%"/>
			<col width="25%"/>
		</colgroup>
	<tr>
		<td>${mb.name}</td> 
		<td><a href="meetingDetail.do?no=${mb.mb_no}">${mb.title}</a></td>
		<td>${mb.upload_date}</td>
	</tr><hr id="hr_line">
</table>
 </c:forEach>

<hr id="hr_line">
</div>
<div id="community_div_riview">
<h4 id="community_h4">리뷰<button class="btn btn-default" id="community_detail_review" onclick="reviewPage();">더보기</button></h4>
<c:forEach items="${rlist }" var="rb">
	
<table id="detail_table">
		<colgroup>
			<col width="25%"/>
			<col width="50%"/>
			<col width="25%"/>
		</colgroup>
	<tr>
		<td>${rb.name}</td> 
		<td><a href="reviewDetail.do?no=${rb.cb_no}">${rb.title}</a></td>
		<td>${rb.upload_date}</td>
	</tr><hr id="hr_line">
</table>

 </c:forEach>

<hr id="hr_line">
</div>

<div id="community_div_qna">
<h4 id="community_h4">Q & A<button class="btn btn-default" id="community_detail_qna" onclick="qnaPage();">더보기</button></h4>
<c:forEach items="${qlist }" var="qb">

<table id="detail_table">

	
		<colgroup>
			<col width="25%"/>
			<col width="50%"/>
			<col width="25%"/>
		</colgroup>
	<tr>
		<td>${qb.name}</td> 
		<td><a id="a_title" href="qnaDetail.do?no=${qb.cb_no}">${qb.title}</a></td>
		<td>${qb.upload_date}</td>

		
	</tr><hr id="hr_line">

</table>

 </c:forEach>
<hr id="hr_line">
</div>
</div>

    <c:import url="../include/main/footer.jsp" />

    <c:import url="../include/common/end.jsp" />
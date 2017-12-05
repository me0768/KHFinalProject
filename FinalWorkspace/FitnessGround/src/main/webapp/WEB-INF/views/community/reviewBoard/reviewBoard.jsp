<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:import url="../../include/common/head.jsp" />
	<c:import url="../../include/common/headend.jsp" />
    
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
    
   <style type="text/css">
 	body {
		font-family: "Open Sans", sans-serif;
		line-height: 1.25;
	}
	
	h1 {
		font-weight: bold; 
		font-size : 20pt;
		color: black;
	}
	
	
	div#meeting_category_div {
		padding-left: 23%;
		
	}
	div#meeting_search_div{
		
		margin-left: 23%;
	}
	select#findType{
		height: 30px;
		width: 70px;
		font-size: 14px;
	}
	input#searchKey{
	
		height: 25px; 
		width: 200px;
		}
	button#searchSubmit{
		background:#210B61;
	}	
	button#community_detail{
		background:#210B61;
		width:22%;
		height:6%;
		font-size: 14pt;
	}
	input#searchKey placeholder{
		color: #F3F3F3;
		font-size: 14px;
	}
	button#meeting_writer_btn{
		left:63%;
		width:70pt;
		height:25pt;
		font-size:6pt;
		background:#210B61;
		
	}
	div#meeting_table_div{
		padding-left:23%;
		padding-right:9%;
	}
	table#meeting_table {
		
		border: 1px solid #ccc;
		border-collapse: separate;
		table-layout: fixed;
		width: 80%;
		font-size: 10pt;
		color:black;
	}
	
	table#meeting_table tr {
		border: 1px solid #ddd;
		padding: .35em;
	}
	
	table#meeting_table tr:nth-child(even) {
		background: #f8f8f8;
	}
	
	table#meeting_table th, table td {
		padding: .625em;
		text-align: center;
	}
	
	table#meeting_table th {
		background: #D8D8D8;
		font-size: .85em;
		letter-spacing: .1em;
		text-transform: uppercase;
	}
	
	table#meeting_table td {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>
 
   <script type="text/javascript">

		function meetingPage() {
			location.href = "meeting.do";
		}
		function reviewPage() {
			location.href = "review.do";
		}
		function qnaPage() {
			location.href = "qna.do";
		}
		function meetingInsert() {
			location.href = "meetingInsert.do";
		}
	</script>

<br><br>
<h1 align="center">후기</h1>
<br>
<div id="meeting_category_div">
<button id="community_detail"onclick="meetingPage();">운동같이해요</button> &nbsp;&nbsp;&nbsp;
<button id="community_detail"onclick="reviewPage();">후기</button>	&nbsp;&nbsp;&nbsp;
<button id="community_detail"onclick="qnaPage();">Q & A</button>
</div>
<br>
<div id="meeting_search_div" align="left">
			<div align="left">
			<form class="form-group" role="form" action="#" method="get" >
				<select class="btn" name="searchValue" id="findType">
					<option value="findTitle">제목</option>
					<option value="findWriter">글쓴이</option>
					<option value="findCategory">카테고리</option>
				</select> 
				<input name ="searchValue" type="search" id="searchKey" placeholder="검색어를 입력해주세요 " class="btn2">
				<button type="submit" id="searchSubmit" value="검색" class="btn">검색</button>				
			</form>
				<button id="meeting_writer_btn" onclick="meetingInsert();">글쓰기</button>					
</div>
<br>
</div>
<div id="meeting_table_div">
<table id="meeting_table">
  <thead>
    <tr>
      <th>번호</th>
      <th>카테고리</th>
      <th>제목</th>
      <th>글쓴이</th>
      <th>작성일</th>
      <th>조회수</th>
    </tr>
  </thead>
  <tbody>
    <tr>
     <td>1</td>
     <td>헬스</td>
      <td><a href="#">운동하러가실분</a></td>
      <td>kdy123</td>
      <td>2017/12/21</td>
      <td>30</td>
    </tr>
  <tr>
        <td>1</td>
     <td>헬스</td>
      <td><a href="#">운동하러가실분</a></td>
      <td>kdy123</td>
      <td>2017/12/21</td>
      <td>30</td>
    </tr>
   <tr>
        <td>1</td>
     <td>헬스</td>
      <td><a href="#">운동하러가실분</a></td>
      <td>kdy123</td>
      <td>2017/12/21</td>
      <td>30</td>
    </tr>
    <tr>
       <td>1</td>
     <td>헬스</td>
      <td><a href="#">운동하러가실분</a></td>
      <td>kdy123</td>
      <td>2017/12/21</td>
      <td>30</td>
    </tr>
  </tbody>
</table>
</div>
<div>
여기는 페이지 처리 해야해 도영...
</div>

    <c:import url="../../include/main/footer.jsp" />
    <c:import url="../../include/common/end.jsp" />

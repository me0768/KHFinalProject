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
	
	
	div#review_category_div {
		padding-left: 15%;
	}
	div#review_search_div{
		
		margin-left: 15%;
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
	input#searchKey placeholder{
		color: #F3F3F3;
		font-size: 14px;
	}
	button#review_writer_btn{
		left:72%;
		width:70pt;
		height:25pt;
		font-size:8pt;
		
	}
	div#review_table_div{
		padding-left:15%;
	}
	table {
		
		border: 1px solid #ccc;
		border-collapse: collapse;
		table-layout: fixed;
		width: 80%;
	}
	
	table tr {
		border: 1px solid #ddd;
		padding: .35em;
	}
	
	table tr:nth-child(even) {
		background: #f8f8f8;
	}
	
	table th, table td {
		padding: .625em;
		text-align: center;
	}
	
	table th {
		background: #D8D8D8;
		font-size: .85em;
		letter-spacing: .1em;
		text-transform: uppercase;
	}
	
	table td {
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
	</script>
<body>
<br><br>
<h1 align="center">후기</h1>
<br><br>
<div id="review_category_div">
<button id="community_detail"onclick="meetingPage();">운동같이해요</button>
<button id="community_detail"onclick="reviewPage();">후기</button>
<button id="community_detail"onclick="qnaPage();">Q & A</button>
</div>
<br>
<div id="review_search_div" align="left">
			<div align="left">
			<form class="form-group" role="form" action="#" method="get" >
				<select class="btn" name="searchValue" id="findType">
					<option value="findTitle">제목</option>
					<option value="findWriter">글쓴이</option>
					<option value="findCategory">카테고리</option>
				</select> 
				<input name ="searchValue" type="search" id="searchKey" placeholder="검색어를 입력해주세요 " class="btn2">
				<button type="submit" id="searchSubmit" value="검색" class="btn">검색</button><br>
							
			</form>
			
				<button id="review_writer_btn">글쓰기</button><br><br>
</div>
</div>
<div id="review_table_div">
<table>
  <thead>
    <tr>
      <th>번호</th>
      <th>카테고리</th>
      <th>제목</th>
      <th>글쓴이</th>
      <th>모임날짜</th>
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
      <td>2017/12/21</td>
      <td>30</td>
    </tr>
  <tr>
      <td>1</td>
      <td>헬스</td>
      <td>운동하러가실분</td>
      <td>kdy123</td>
      <td>2017/12/21</td>
      <td>2017/12/21</td>
      <td>30</td>
    </tr>
   <tr>
      <td>1</td>
      <td>헬스</td>
      <td>운동하러가실분</td>
      <td>kdy123</td>
      <td>2017/12/21</td>
      <td>2017/12/21</td>
      <td>30</td>
    </tr>
    <tr>
      <td>1</td>
      <td>헬스</td>
      <td>운동하러가실분</td>
      <td>kdy123</td>
      <td>2017/12/21</td>
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
</body>
</html>
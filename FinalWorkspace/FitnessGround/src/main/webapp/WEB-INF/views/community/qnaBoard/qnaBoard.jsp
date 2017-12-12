<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:import url="../../include/common/head.jsp" />
	
	
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
	
	
	div#community_category_div {
		padding-left: 23%;
		
	}
	div#community_search_div{		
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

	button#community_writer_btn{
		left:63%;
		width:70pt;
		height:25pt;
		font-size:8pt;
		
	}

	div#community_table_div{
		padding-left:23%;
		padding-right:9%;
	}
	table#community_table {
		border: 1px solid #ccc;
		border-collapse: collapse;
		table-layout: fixed;
		width: 80%;
	}

	table#community_table tr {
		border: 1px solid #ddd;
		padding: .35em;
	}
	
	table#community_table tr:nth-child(even) {
		background: #f8f8f8;
	}
	
	table#community_table th, table td {
		padding: .625em;
		text-align: center;
	}

	table#community_table th {
		background: #D8D8D8;
		font-size: .85em;
		letter-spacing: .1em;
		text-transform: uppercase;
	}

	table#community_table td {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>
	
	
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

		$(document).ready(function(){
			$("#write").on("click", function(e){
				e.preventDefault();
				write();
			})
		})
		function write() {
			location.href = "qnaInsert.do";
			}
	</script>


<br><br>
<h1 align="center">Q & A</h1>
<br>
<div id="community_category_div">
<button id="community_detail"onclick="meetingPage();">운동같이해요</button> &nbsp;&nbsp;&nbsp;
<button id="community_detail"onclick="reviewPage();">후기</button>	&nbsp;&nbsp;&nbsp;
<button id="community_detail"onclick="qnaPage();">Q & A</button>
</div>
<br>
<div id="community_search_div" align="left">
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
				<c:if test="${sessionScope.user.name != null }">
				<a href="qnaInsert.do" class="btn" id="write">글쓰기</a>					
				</c:if>
				
</div>
</div>
<div id="community_table_div">
<table id="community_table">

  		<colgroup>
			<col width="10%"/>
			<col width="*%"/>
			<col width="10%"/>
			<col width="15%"/>
			<col width="10%"/>
		</colgroup>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">글쓴이</th>
      <th scope="col">작성일</th>
      <th scope="col">조회수</th>
    </tr>
 
  <tbody>
 
	<c:forEach items="${list }" var="cm"> 
		<c:if test="${cm.board_property == 1}">
    <tr>
      <td>${cm.cb_no}</td>
      <td><a href="qnaDetail.do?no=${cm.cb_no}">${cm.title}</a>
      </td>
      <td>${cm.name}</td>
      <td>${cm.upload_date}</td>
      <td>${cm.readcount}</td>
    </tr>
    </c:if>
   </c:forEach>
  
  </tbody>
</table>
</div>
<div> 
여기는 페이지 처리 해야해 도영...
</div>

    <c:import url="../../include/main/footer.jsp" />
    <c:import url="../../include/common/end.jsp" />
    
  
    
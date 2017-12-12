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
			location.href = "meetingInsert.do";
			}
	</script>
<br><br>
<h1 align="center">운동같이해요</h1>
<br>
<div id="community_category_div">
<button id="community_detail"onclick="meetingPage();">운동같이해요</button> &nbsp;&nbsp;&nbsp;
<button id="community_detail"onclick="reviewPage();">후기</button>	&nbsp;&nbsp;&nbsp;
<button id="community_detail"onclick="qnaPage();">Q & A</button>
</div>
<br>
<div id="community_search_div" align="left">
			<div align="left">
			<form class="form-group" name="form1" role="form" action="meetingSearch.do" method="post" >
				<select class="btn" name="searchOption" id="findType">
					<option value="title"<c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
<!-- 이름으로 해야함..--><option value="mb_no"<c:out value="${map.searchOption == 'mb_no'?'selected':''}"/> >이름</option>
					<option value="content"<c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
				</select> 
				<input name ="searchKey"   id="searchKey" value="${map.searchKey}" placeholder="제목으로 검색" class="form-control">
				<button type="submit" value="검색" class="btn">검색</button><br>
			
			</form>
				
				<c:if test="${sessionScope.user.name != null }">
				<a href="meetingInsert.do" class="btn" id="write">글쓰기</a>					
				</c:if>

	<h1>게시물 갯수:${map.count}개</h1>				
</div>
</div>
<div id="community_table_div">
<table id="community_table">
  <thead>
  		<colgroup>
			<col width="10%"/>
			<col width="*%"/>
			<col width="10%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="10%"/>
		</colgroup>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>글쓴이</th>
      <th>모임날짜</th>
      <th>작성일</th>
      <th>조회수</th>
    </tr>
  
  <tbody>  	
	<c:forEach items="${list }" var="cm"> 
    <tr>
      <td>${cm.mb_no}</td>
      <td><a href="meetingDetail.do?no=${cm.mb_no}">${cm.title}</a>
      
      </td>
      <td>${cm.name}</td>
      <td>${cm.meeting_date}</td>
      <td>${cm.upload_date}</td>
      <td>${cm.readcount}</td>
    </tr>
   </c:forEach>
  </tbody>
</table>
</div>
<div>
여기는 페이지 처리 해야해 도영...
</div>

    <c:import url="../../include/main/footer.jsp" />
    <c:import url="../../include/common/end.jsp" />
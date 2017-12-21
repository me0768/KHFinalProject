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
		
		a#btn{
		position:relative;
		background-color:#11A6B7;
		color:white;
		left:54%;
		}
		
	
		div#community_category_div {
			padding-left:23%;
			height:5%;
		}
		div#community_search_div{
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
		button#community_detail{
			width:22%;
			
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
			font-size:10pt;
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
		function loginCheck(){
			alert("로그인이 필요한 서비스 입니다.");
		}	
		
		$(document).ready(function(){
			$("#write").on("click", function(e){
				e.preventDefault();
				write();
			});
		});
		
		function write() {
			location.href = "qnaInsert.do";
		}
		
		function qnaLoadList(page)
		{
			$.ajax({
				url:"qnaLoadList.do",
				type: "post",
				dataType: "json",
				data: {"page":page},
				success: function(data)
				{
					console.log(data.currentPage);
					console.log(data.maxPage);
					console.log(data.list);
					var jsonStr = JSON.stringify(data);
                    
		            var json = JSON.parse(jsonStr);
		            
		            var values = "";
		            
		            for(var i in json.list)
		            {
		             	if(json.list[i].board_property == 1){
		             		
		             	values += "<tr><td>" + json.list[i].cb_no + "</td>"+ "<td><a href='qnaDetail.do?no=" + json.list[i].cb_no + "'>" +
		            			json.list[i].title + "</a></td><td>" + json.list[i].name + "</td><td>" +
		            			json.list[i].upload_date + "</td><td>" 
		            			+ json.list[i].readcount + "</td></tr>";
		             	}
		            }
		            
		            $("#qnalist").html(values);
					
		            var valuesPaging="";
		            
		            if(data.currentPage <= 1){
		            	valuesPaging+="<li class='disabled'>" + 
			              "<a href='#' aria-label='Previous'>" +
			                "<span aria-hidden='true'>&laquo;</span></a></li>";
		            } else {
		            	valuesPaging += "<li><a href='javascript:qnaLoadList(" + (data.currentPage - 1) + ")'  aria-label='Previous'>"
			             + "<span aria-hidden='true'>&laquo;</span></a></li>";
		            }
		            
		           for(var i = data.startPage; i<=data.endPage; i++)
		        	{
		        	   if(data.currentPage == i)
		        		{
		        		  valuesPaging+="<li class='disabled'>"+"<a href='#'>"+ i + "</a></li>";
		        		} else {
		        			 valuesPaging+="<li><a href='javascript:qnaLoadList(" + i + ")'>"+ i + "</a></li>";
		        		}
		
		        	}
		           
		            if(data.currentPage >= data.maxPage)
		            {
		            	valuesPaging+= "<li class='disabled'>" + 
				            "<a href='#' aria-label='Next'>"+
				                "<span aria-hidden='true'>&raquo;</span></a></li>";
		            } else {
		            	valuesPaging += "<li><a href='javascript:qnaLoadList(" + (data.currentPage + 1)+ "') aria-label='Next'>" +
		                "<span aria-hidden='true'>&raquo;</span></a></li>";
		            }
		            
		            $("#qnapaging").html(valuesPaging);
				}
			});
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
			<form class="form-group" name="form1" role="form" action="qna.do" method="post" >
				<select class="btn" name="searchOption" id="findType">
					<option value="title"<c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
<!-- 이름으로 해야함..--><option value="cb_no"<c:out value="${map.searchOption == 'cb_no'?'selected':''}"/> >이름</option>
					<option value="content"<c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
				</select> 
				<input name ="searchKey"   id="searchKey" value="${map.searchKey}" placeholder="제목으로 검색" class="form-control">
				<button type="submit" value="검색" class="btn">검색</button><br>
			
			</form>
			
				<c:if test="${sessionScope.user==null }">
				<h1>게시물 갯수:${qna.listCount}개<a id="btn" class="btn" onclick="loginCheck();">글쓰기</a></h1><br>			
				</c:if>
				<c:if test="${sessionScope.user.name != null }">
				<h1>게시물 갯수:${qna.listCount}개<a href="qnaInsert.do" class="btn" id="btn">글쓰기</a></h1><br>							
				</c:if>

					
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
			<col width="10%"/>
		</colgroup>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>글쓴이</th>
      <th>작성일</th>
      <th>조회수</th>
    </tr>
  
  <tbody id="qnalist">
 
	<c:forEach items="${qna.list}" var="cm"> 
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
<div id="paging">
	<nav>
  <ul class="pagination" id="qnapaging">
    
    <c:if test="${qna.currentPage <= 1}">
    <li class="disabled">
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    <c:if test="${qna.currentPage > 1}">
    <li>
      <a href="javascript:qnaLoadList(${qna.currentPage - 1})" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    <c:forEach var="i" begin="${qna.startPage}" end="${qna.endPage}" step="1">
    <c:if test="${qna.currentPage eq i}">
    	<li class="disabled"><a href="#">${i}</a></li>
    </c:if>
    
    <c:if test="${qna.currentPage ne i}">
    	<li><a href='javascript:qnaLoadList(${i})'>${i}</a></li>
    </c:if>
    
    </c:forEach>
    
    <c:if test="${qna.currentPage >= qna.maxPage}">
     <li class="disabled">
    <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
       </li>
    </c:if>
    
    <c:if test="${qna.currentPage < qna.maxPage}">
     <li>
    <a href='javascript:qnaLoadList(${qna.currentPage + 1})' aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
       </li>
    </c:if>
 </ul>
</nav>
</div>
</div>


    <c:import url="../../include/main/footer.jsp" />
    <c:import url="../../include/common/end.jsp" />
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
			location.href = "reviewInsert.do";
			}
		function reviewLoadList(page)
		{
			$.ajax({
				url:"reviewLoadList.do",
				type:"post",
				dataType:"json",
				data:{"page":page},
				success:function(data){
					console.log(data.currentPage);
					console.log(data.maxPage);
					console.log(data.list);
					var jsonStr = JSON.stringfy(data);
					
			var json = JSON.parse(jsonStr);
			
			var values = "";
			
			for(var i in json.list)
				{
				values += "<tr><td>" + json.list[i].cb_no
				+ "</td>"
				+ "<td><a href='reviewDetail.do?no="
				+ json.list[i].cb_no + "'>"
				+ json.list[i].title + "</a></td><td>"
				+ json.list[i].name + "</td><td>"
				+ json.list[i].upload_date
				+ "</td><td>" + json.list[i].readcount
				+ "</td></tr>";
				}
			
			$("reviewlist").html(values);
			
			var valuesPaging="";
			
			if(data.currentPage <=1){
				valuesPaging+=" <li class='disabled'>" +
			    "<a href='#' aria-label='Previous'>" +
                "<span aria-hidden='true'>&laquo;</span></a></li>";
			}  else {
            	valuesPaging += "<li><a href='javascript:reviewLoadList(" + (data.currentPage - 1) + ")'  aria-label='Previous'>"
	             + "<span aria-hidden='true'>&laquo;</span></a></li>";
			}
				for(var i = data.startPage; i<=data.endPage; i++)
					{
						if(data.currentPage == i)
						{
						  valuesPaging+="<li class='disabled'>"+"<a href='#'>"+ i + "</a></li>";
		        		} else {
		        			 valuesPaging+="<li><a href='javascript:reviewLoadList(" + i + ")'>"+ i + "</a></li>";
		        		}
					}
				if(data.currentPage >= data.maxPage)
					{
					valuesPaging+= "<li class='disabled'>" + 
		            "<a href='#' aria-label='Next'>"+
		                "<span aria-hidden='true'>&raquo;</span></a></li>";
		            } else {
		            	valuesPaging += "<li><a href='javascript:reviewLoadList(" + (data.currentPage + 1)+ "') aria-label='Next'>" +
		                "<span aria-hidden='true'>&raquo;</span></a></li>";
		            }
				
				$("#reviewpaging").html(valuesPaging);
				}
			
			});
	}
		
	</script>


<br><br>
<h1 align="center">후기</h1>
<br>
<div id="community_category_div">
<button id="community_detail"onclick="meetingPage();">운동같이해요</button> &nbsp;&nbsp;&nbsp;
<button id="community_detail"onclick="reviewPage();">후기</button>	&nbsp;&nbsp;&nbsp;
<button id="community_detail"onclick="qnaPage();">Q & A</button>
</div>
<br>
<div id="community_search_div" align="left">
			<div align="left">
			<form class="form-group" name="searchform" role="form" action="review.do" method="post" >
				<select class="btn" name="searchOption" id="findType">
					<option value="title"<c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
<!-- 이름으로 해야함..--><option value="user_no"<c:out value="${map.searchOption == 'user_no'?'selected':''}"/> >이름</option>
					<option value="content"<c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
				</select> 
				<input name ="searchKey"   id="searchKey" value="${map.searchKey}" placeholder="제목으로 검색" class="form-control">
				<button type="submit" value="검색" class="btn">검색</button><br>
			
			</form>
				
				<c:if test="${sessionScope.user.name != null }">
				<a href="reviewInsert.do" class="btn" id="write">글쓰기</a>					
				</c:if>

	<h1>게시물 갯수:${review.listCount}개</h1>				
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

  <tbody id="reviewlist">
 
	<c:forEach items="${review.list}" var="cm"> 
		<c:if test="${cm.board_property == 0}">
    <tr>
      <td>${cm.cb_no}</td>
      <td><a href="reviewDetail.do?no=${cm.cb_no}">${cm.title}</a>
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
	 <ul class="pagination" id="reviewpaging">
	 	<c:if test="${review.currentPage <= 1}">
	 	<li class = "disabled">
	 	 <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
     <c:if test="${review.currentPage > 1}">
    <li>
      <a href="javascript:reviewLoadList(${review.currentPage - 1})" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    <c:forEach var="i" begin="${review.startPage}" end="${review.endPage}" step="1">
    <c:if test="${review.currentPage eq i}">
    	<li class="disabled"><a href="#">${i}</a></li>
    </c:if>
    
    <c:if test="${review.currentPage ne i}">
    	<li><a href='javascript:reviewLoadList(${i})'>${i}</a></li>
    </c:if>
    
    </c:forEach>
    
    <c:if test="${review.currentPage >= review.maxPage}">
     <li class="disabled">
    <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
       </li>
    </c:if>
    
    <c:if test="${review.currentPage < review.maxPage}">
     <li>
    <a href='javascript:reviewLoadList(${review.currentPage + 1})' aria-label="Next">
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />
	<link rel="stylesheet" href="http://www.w3ii.com/lib/w3.css">
    <c:import url="../include/common/headend.jsp" />
	
	<script type="text/javascript">
		$(function() {
			$('#hiddenFileInput').hide();
			$("#hiddenFileInput").on('change', function(){
	            readURL(this);
	        });
		});
		function qSearch() {
			location.href="qSearch.do?searchKeyword="+$('input[name="searchKeyword"]').val()+"&userno="+${sessionScope.user.user_no};
		}
	 </script>	

    <c:if test="${ sessionScope.user == null }">
		<script type="text/javascript">
			$(function (){
				alert("로그인이 필요합니다.");
				location.href="main.do";
			});
		</script>
	</c:if>
	
    <c:if test="${ sessionScope.user != null }">    
	<div id="page-wrapper">
		<!-- Header -->
		<div id="mypage_header">
            <!-- Nav -->
			<c:import url="../include/main/nav.jsp" />			
			<c:import url="login.jsp"/>
			<c:import url="findidpwd.jsp"/>
			<c:import url="register.jsp"/>
		</div>
    </div>
    
    <div id="myPageBar">
		<c:import url="../include/user/myPageBar.jsp"/>
	</div>
	
	<br><div role="tabpanel" class="userBoardNav col-md-8 col-md-offset-2 col-sm-12">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist" id="navTitle">
			<c:if test="${com eq 'no'}">
		  	<li role="presentation" class="active col-md-6 col-sm-6"><a href="#qna" aria-controls="qna" role="tab" data-toggle="tab">문의내역</a></li>
		  	<li role="presentation" class="col-md-6 col-sm-6"><a href="#community" aria-controls="community" role="tab" data-toggle="tab">커뮤니티</a></li>
			</c:if>
		  	<c:if test="${com eq 'ok'}">
		  	<li role="presentation" class="col-md-6 col-sm-6"><a href="#qna" aria-controls="qna" role="tab" data-toggle="tab">문의내역</a></li>
		  	<li role="presentation" class="active col-md-6 col-sm-6"><a href="#community" aria-controls="community" role="tab" data-toggle="tab">커뮤니티_게시글</a></li>
		  	</c:if>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content" style="margin-top:0px;">
		  	<div role="tabpanel" class="tab-pane fade in active" id="qna">
				<table class="w3-table-all" style="background:white; border-style:1px;border-top:0px;" id="qnaT">
					<tr>
						<th colspan="3">  
							<!-- <form class="input-group col-md-offset-8 col-md-4" id="qnaF"> -->
							<div class="input-group col-md-offset-8 col-md-4" id="qnaF">
							  <input type="text" class="form-control" placeholder="제목으로 검색..." name="searchKeyword" onkeydown="javascript: if (event.keyCode == 13) {qSearch();}">
							  <span class="input-group-addon" id="searchBt">
							  	<a onclick="qSearch();" class="glyphicon glyphicon-search"></a>
							  </span>
							<!-- </form> -->
							</div>
						</th>
					</tr>
					<tr style="font-weight:bold;">
					  <th style="width:15%;">번호</th>
					  <th style="width:60%; text-align:left; padding-left:100px;">제목</th>
					  <th style="width:25%;">작성일</th>
					</tr>
					<c:choose>
						<c:when test="${!empty qlist}">
							<c:forEach items="${qlist}" var="q" varStatus="st">
								<c:url var="detail" value="">
									<c:param name="q_no" value="${q.q_no}"/>
								</c:url>
								<tr>
								  <td>${q.q_no}</td>
								  <td style="text-align:left; padding-left:100px;"><a href="${detail}">${q.title}</a></td>
								  <td>${q.write_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="3">문의내역이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</table>
				<div class="boardPage col-md-offset-2 col-md-8" align="center"><nav>
				  <ul class="pagination">
				    <li>
					    <c:if test="${qCurrentPage <= 1}">
					    	<a href="#" aria-label="Previous">
					        	<span aria-hidden="true">&laquo;</span>
					      	</a>
					     </c:if>
						<c:if test="${qCurrentPage > 1}">
							<a href="userboard.do?page=${qCurrentPage-1}&userno=${sessionScope.user.user_no}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</c:if>				      
				    </li>
				    <c:forEach var="p" begin="${qStartPage}" end="${qEndPage}">
						<c:choose>
							<c:when test="${qCurrentPage == p}">
								 <li><a href="#">${p}</a></li>
							</c:when>
							<c:otherwise>
								 <li><a href="userboard.do?userno=${sessionScope.user.user_no}&page=${p}">${p}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				    <li>
				    	<c:choose>
				    	<c:when test="${qCurrentPage >= qMaxPage}">
				    		<a href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						    </a>
				    	</c:when>
				    	<c:otherwise>
					      	<a href="userboard.do?page=${qCurrentPage+1}&userno=${sessionScope.user.user_no}" aria-label="Next">
					        	<span aria-hidden="true">&raquo;</span>
					      	</a>
				      	</c:otherwise>
				      	</c:choose>
				    </li>
				  </ul>
				</nav></div>
			</div>
			
			
		  	<div role="tabpanel" class="tab-pane fade" id="community">
		  		<table class="w3-table-all" style="background:white; border-style:1px;border-top:0px;" id="communityT">
					<tr>
						<th colspan="3">
							<form class="input-group col-md-offset-8 col-md-4">
								<input type="text" class="form-control" placeholder="Search Keyword..." name="searchKeyword">
								<span class="input-group-addon" id="searchBt"><a class="glyphicon glyphicon-search"></a></span>
							</form>
						</th>
					</tr>
					<tr style="font-weight:bold;">
					  <th style="width:15%;">
					  	<select name="no" id="no" class="selectBox">
							<option value="1">전체</option>
							<option value="2">운동같이</option>
							<option value="3">후기</option>
							<option value="4">QnA</option>
						</select>
					  </th>
					  <th style="width:60%; text-align:left; padding-left:100px;">제목</th>
					  <th style="width:25%;">작성일</th>
					</tr>
					<tr>
					  <td>Jill</td>
					  <td style="text-align:left; padding-left:100px;">Smith</td>
					  <td>50</td>
					</tr>
				</table>
				<div class="boardPage col-md-offset-2 col-md-8" align="center"><nav>
				  <ul class="pagination">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav></div>
		  	</div>
		</div>
	</div>
	
		
    </c:if>
    
    <c:import url="../include/main/footer.jsp" />
    <c:import url="../include/common/end.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />
	<link rel="stylesheet" href="http://www.w3ii.com/lib/w3.css">
    <c:import url="../include/common/headend.jsp" />

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
		  	<li role="presentation" class="active col-md-6 col-sm-6"><a href="#qna" aria-controls="qna" role="tab" data-toggle="tab">문의내역</a></li>
		  	<li role="presentation" class="col-md-6 col-sm-6"><a href="#community" aria-controls="community" role="tab" data-toggle="tab">커뮤니티_게시글</a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content" style="margin-top:0px;">
		  	<div role="tabpanel" class="tab-pane fade in active" id="qna">
				<table class="w3-table-all" style="background:white; border-style:1px;border-top:0px;" id="qnaT">
					<tr>
						<th colspan="3">  
							<form class="input-group col-md-offset-8 col-md-4">
							  <input type="text" class="form-control" placeholder="Search Keyword..." name="searchKeyword">
							  <span class="input-group-addon" id="searchBt"><a class="glyphicon glyphicon-search"></a></span>
							</form>
						</th>
					</tr>
					<tr>
					  <th>번호</th>
					  <th>제목</th>
					  <th>작성일</th>
					</tr>
					<tr>
					  <td>Jill</td>
					  <td>Smith</td>
					  <td>50</td>
					</tr>
					<tr>
					  <td>Jill</td>
					  <td>Smith</td>
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
					<tr>
					  <th>
					  	<select name="no" id="no" class="selectBox">
							<option value="1">전체</option>
							<option value="2">운동같이</option>
							<option value="3">후기</option>
							<option value="4">QnA</option>
						</select>
					  </th>
					  <th>제목</th>
					  <th>작성일</th>
					</tr>
					<tr>
					  <td>Jill</td>
					  <td>Smith</td>
					  <td>50</td>
					</tr>
					<tr>
					  <td>Jill</td>
					  <td>Smith</td>
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
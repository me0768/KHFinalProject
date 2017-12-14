<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="../common/head.jsp" />

<style type="text/css">

</style>



<c:import url="../common/headend.jsp" />

<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>

<script type="text/javascript">

function adminMettingBoard(){
	location.href="adminMettingBoard.do"
}
function adminQNABoard(){
	location.href="adminQNABoard.do"
}
function adminReviewBoard(){
	location.href="adminReviewBoard.do"
}

function registerView(){
	
	
	$("#registerView").show();
	$("#registerView").modal();
}
function reviewDelete(cb_no){
	
	$.ajax({
		url : "reviewBoardDelete.do",
		dataType : "json",
		type : "post",
		data : {"cb_no" : cb_no},
		success : function(result){
			alert(cb_no + "번 게시물이 삭제 되었습니다.")
			location.href = "adminReviewBoard.do";
		},
		error : function(request, status, error){
			alert("error code : " +request.status + "\n"
					+ "message : " +request.responseText + "\n"
					+ "error : " + errorData);
			
		}
		
	})
}
</script>

<c:import url="../common/nav.jsp" />
<div class="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="adminMain.do">Fitness Ground</a></li>
			<li class="breadcrumb-item active">메인으로 이동</li>
		</ol>
		<!-- Example DataTables Card-->
		<div class="card mb-3">
			<div class="card-header">

				<div class="buttons">

					<button class="btn btn-warning" onclick="adminMettingBoard();">Meeting</button>
					<button class="btn btn-warning" onclick="adminQNABoard();">Q&A</button>
					<button class="btn btn-warning" onclick="adminReviewBoard();">Review</button>
					<button class="btn btn-warning" onclick="registerView();" align="right" >공지사항 등록</button>


				</div>
			</div>

				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>							
									<th>번호</th>
									<th>작성자</th>
									<th>제목</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>관리</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="item" items="${list }" varStatus="status">
									<c:if test="${item.board_property == 0}">
									<tr>
										<%-- <td><input type="checkbox" class="deleteCheckBox"
											name="deleteCheckBox" value="${item.user_no} " /></td> --%>
										<td>${status.count }</td>
										<td>${item.name }</td>
										<td>
										<a  href="reviewDetail.do" data-target=".${item.cb_no}"
											data-toggle="modal">${item.title }</a></td>
										<div class="modal fade ${item.cb_no} ${item.board_property}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
												
													<!-- header -->
													<div class="modal-header" align="top">
														<!-- 닫기(x) 버튼 -->
														<button type="button" class="close" data-dismiss="modal">×</button>
														<!-- header title -->
														<h4 class="modal-title" align="center">${item.title}</h4>
													<div>
													
													<!-- body -->
													<div class="modal-body" align="center">${item.content}</div>
													<p align="center">${item.name}</p>
     											
													<!-- Footer -->
													<div class="modal-footer" >
														Footer
														<button type="button" class="btn btn-default"
															data-dismiss="modal">닫기</button>
													</div>
												</div>
											</div>
										</div>
										</div>
										</div>
										<td>${item.upload_date }</td>
										<td>${item.readcount }</td>
										<td><button class="btn btn-primary" onclick="reviewDelete(${item.cb_no});">삭제</button></td>

									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
										<!-- Modal -->
  <div class="modal fade" id="registerView" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" id="workout-dialog">
    
      <div class="modal-content" >
      
        <div class="modal-header">  
          <h2 class="modal-title" id="reviewBoard" color="red"style="color: black">Review 게시판 공지사항 등록하기 </h2>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">x</button>
        
        </div>
        	<div class="modal-body">
				<div id="insert_all_div" style="border: 1px solid;">
				<br>
					<form id="register_form" name='meeting' method="post" action="qnaInsert.do">
						<input name="user_no" type="hidden" value="${sessionScope.user.user_no }" />
							<div id="div_head">
								<p>
									제목
							<input name="title" type="text" placeholder="제목을 입력해주세요." />
								</p>				
							</div>
				<textarea name="content" id="editor1" placeholder="내용을 입력해주세요.."></textarea>
				<script>
					CKEDITOR.replace('editor1');
				</script>
				
					
				</div>
											
		  </div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" >Register</button>
					</form>
      				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      			</div>
	  </div>
			
     </div>
      	
  </div>
  
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			
		</div>
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		<c:import url="../common/footer.jsp" />
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fa fa-angle-up"></i>
		</a>
		
		</div>
		
	</div>
	<c:import url="../common/end.jsp" />
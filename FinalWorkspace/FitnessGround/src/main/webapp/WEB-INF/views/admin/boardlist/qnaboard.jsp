<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="../common/head.jsp" />

<style type="text/css">

</style>



<c:import url="../common/headend.jsp" />

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

function qnaDelete(cb_no){
	alert("버튼 클릭");
	
	$.ajax({
		url : "qnaBoardDelete.do",
		dataType : "json",
		type : "post",
		data : {"cb_no" : cb_no},
		success : function(result){
			alert("삭제 하였습니다.")
			location.href = "adminQNABoard.do";
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

					<button class="btn btn-primary" onclick="adminMettingBoard();">Meeting</button>
					<button class="btn btn-primary" onclick="adminQNABoard();">Q&A</button>
					<button class="btn btn-primary" onclick="adminReviewBoard();">Review</button>


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
								<c:if test="${item.board_property == 1}">
									<tr>
										<%-- <td><input type="checkbox" class="deleteCheckBox"
											name="deleteCheckBox" value="${item.user_no} " /></td> --%>
										<td>${status.count }</td>
										<td>${item.name }</td>
										<td>
										<a  href="qnaDetail.do" data-target=".${item.cb_no}"
											data-toggle="modal">${item.title }</a></td>
										<br />
										<div class="modal fade ${item.cb_no}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
										<td>${item.upload_date }</td>
										<td>${item.readcount }</td>
										<td><button class="btn btn-primary" onclick="qnaDelete(${item.cb_no});">삭제</button></td>

									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
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
		<!-- Logout Modal-->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="adminlogout.do">Logout</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../common/end.jsp" />
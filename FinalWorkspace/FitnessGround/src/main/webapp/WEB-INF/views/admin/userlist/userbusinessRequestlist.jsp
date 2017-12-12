<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="../common/head.jsp" />

<style type="text/css">

</style>

<link
	href="/fitnessground/resources/admin/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">


<c:import url="../common/headend.jsp" />

<script
	src="/fitnessground/resources/admin/vendor/datatables/jquery.dataTables.js"></script>
<script
	src="/fitnessground/resources/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
<script
	src="/fitnessground/resources/admin/js/sb-admin-datatables.min.js"></script>

<script type="text/javascript">
	function userlistPage(){
		location.href="adminuserlist.do"
	}
	function businesslistPage(){
		location.href="adminbusinesslist.do"
	}
	function businessRequestlistPage(){
		location.href="adminbusinessRequestlist.do"
	}
	
	function gymRequest(gym_no, user_state){
		alert("버튼클릭 : " +gym_no +" ,  유저 상태 : "+ user_state);
		
		if(user_state == 1){
			alert("해당 계정은 비활성 상태입니다. 헬스장을 등록할 수 없습니다.");
		}else{
		$.ajax({
			url : "gymRequest.do",
			dataType : "json",
			type : "post",
			data : {"gym_no" : gym_no},
			success : function(result) {
				alert("등록되었습니다.")
				location.href="adminbusinessRequestlist.do";
			},
			error : function(request, status, error) {
				alert("error code : " +request.status + "\n"
						+ "message : " +request.responseText + "\n"
						+ "error : " + errorData);
			}
			
		})
		}
		
		
		
	}
	
	function gymCancel(gym_no){
		alert("버튼클릭 : " +gym_no);
		
		$.ajax({
			url : "gymCancel.do",
			dataType : "json",
			type : "post",
			data : {"gym_no" : gym_no},
			success : function(result) {
				alert("등록이 취소 되었습니다.")
				location.href="adminbusinessRequestlist.do";
			},
			error : function(request, status, error) {
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

					<button class="btn btn-primary" onclick="userlistPage();">일반회원</button>
					<button class="btn btn-primary" onclick="businesslistPage();">사업자회원</button>
					<button class="btn btn-primary" onclick="businessRequestlistPage();">등록요청</button>


				</div>
			</div>
	
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
							<thead>
								<tr>
									<th>유저번호</th>
									<th>유저상태</th>
									<th>이메일</th>
									<th>이름</th>
									<th>헬스장번호</th>
									<th>헬스장이름</th>
									<th>지역</th>
									<th>승인여부</th>
								</tr>
							</thead>
							<!-- <tfoot>
                <tr>
                  <th>Name</th>
                  <th>Position</th>
                  <th>Office</th>
                  <th>Age</th>
                  <th>Start date</th>
                  <th>Salary</th>
                </tr>
              </tfoot> -->
							<tbody>
								<c:forEach var="item" items="${list }" varStatus="status">
									<tr>
										<td>${item.user_no }</td>
										<td>${item.user_state }</td>
										<td><a href="#">${item.email }</a></td>
										<td>${item.name }</td>
										<td>${item.gym_no }</td>
										<td><a href="#">${item.gym_name }</a></td>
										<td>${item.location }</td>
										<c:choose>
											<c:when test="${item.approval_state==0}">

												<td><button type="submit" class="btn btn-primary"
														onclick="gymRequest(${item.gym_no}, ${item.user_state});">등록하기</button></td>
											</c:when>
											<c:when test="${item.approval_state==1}">

												<td><button type="submit" class="btn btn-primary"
														onclick="gymCancel(${item.gym_no});">등록취소</button></td>
											</c:when>

										</c:choose>
									</tr>
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
		<!-- Bootstrap core JavaScript-->
		<script
			src="/fitnessground/resources/admin/vendor/jquery/jquery.min.js"></script>
		<script
			src="/fitnessground/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script
			src="/fitnessground/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Page level plugin JavaScript-->
		<script
			src="/fitnessground/resources/admin/vendor/datatables/jquery.dataTables.js"></script>
		<script
			src="/fitnessground/resources/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="/fitnessground/resources/admin/js/sb-admin.min.js"></script>
		<!-- Custom scripts for this page-->
		<script
			src="/fitnessground/resources/admin/js/sb-admin-datatables.min.js"></script>
	</div>
	<c:import url="../common/end.jsp" />
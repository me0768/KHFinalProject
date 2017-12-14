<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="../common/head.jsp" />

<style type="text/css">

</style>


<c:import url="../common/headend.jsp" />



<script type="text/javascript">
	function userlistPage() {
		location.href = "adminuserlist.do"
	}
	function businesslistPage() {
		location.href = "adminbusinesslist.do"
	}
	function businessRequestlistPage() {
		location.href = "adminbusinessRequestlist.do"
	}
	
	function userChange(user_no){
		alert("버튼클릭, ");
		
		
		$.ajax({
			url : "adminUserState.do",
			dataType : "json",
			type : "post",
			data : {"user_no" : user_no},
			success: function(result){
				alert(user_no + " 회원이 비활성화되었습니다.")
				location.href="adminuserlist.do";
			},
			error : function(request, status, error){
				alert("error code : " +request.status + "\n"
						+ "message : " +request.responseText + "\n"
						+ "error : " + errorData);
				
			}
				
			
		})
	}
	
	function userBack(user_no){
		alert("버튼클릭, ");
		
		
		$.ajax({
			url : "adminUserBack.do",
			dataType : "json",
			type : "post",
			data : {"user_no" : user_no},
			success: function(result){
				alert(user_no + " 회원이 활성화되었습니다.")
				location.href="adminuserlist.do";
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

					<button class="btn btn-primary" onclick="userlistPage();">일반회원</button>
					<button class="btn btn-primary" onclick="businesslistPage();">사업자회원</button>
					<button class="btn btn-primary" onclick="businessRequestlistPage();">등록요청</button>

				</div>

			</div>
				<div class="card-body">
					<div class="table-responsive">
						<form name="userForm">
							<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
								<thead>
									<tr>
										<th>Index</th>
										<th>Email</th>
										<th>Name</th>
										<th>NickName</th>
										<th>Phone</th>
										<th>Level</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="item" items="${list }" varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td>${item.email }</td>
											<td>${item.name }</td>
											<td>${item.nickname }</td>
											<td>${item.phone }</td>
											<td>${item.user_level }</td>
											<c:choose>
												<c:when test="${item.user_state==0}">

													<td><button type="submit" class="btn btn-primary"
															onclick="userChange(${item.user_no});">비활성화</button></td>
												</c:when>
												<c:when test="${item.user_state==1}">

													<td><button type="submit" class="btn btn-primary"
															onclick="userBack(${item.user_no});">활성화</button></td>
												</c:when>

											</c:choose>

										</tr>
									</c:forEach>

								</tbody>
							</table>
						</form>
						</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			
		</div>
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		<c:import url="../common/footer.jsp" />
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fa fa-angle-up"></i>
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
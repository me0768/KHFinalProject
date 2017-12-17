<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="../common/head.jsp" />

<style type="text/css">

</style>


<c:import url="../common/headend.jsp" />




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

					<button class="btn btn-warning" onclick="userlistPage();">일반회원</button>
					<button class="btn btn-warning" onclick="businesslistPage();">사업자회원</button>
					<button class="btn btn-warning" onclick="businessRequestlistPage();">등록요청</button>


				</div>
			</div>
	
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
							<thead>
								<tr align="center">
									<th>Index</th>
									<th>State</th>
									<th>Email</th>
									<th>Name</th>
									<th>Gym_No</th>
									<th>Gym_Name</th>
									<th>Location</th>
									<th>Date</th>
									<th>Permission</th>
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
									<tr align="center">
										<td>${status.count }</td>
										<td>${item.user_state }</td>
										<td>${item.email }</td>
										<td>${item.name }</td>
										<td>${item.gym_no }</td>
										<td><a href="/detailgym.do" data-target=".${item.gym_no}" data-toggle="modal">${item.gym_name }</a></td>
										<div class="modal fade ${item.gym_no }" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<!-- header -->
													<div class="modal-header" align="top">
														<h4 class="modal-title" align="center">헬스장이름 : ${item.gym_name}</h4>
														<button type="button" class="close" data-dismiss="modal" align="right">x</button>
													</div>
													
													<!-- body -->
													<div class="modal-body" align="left">
													<p>이메일 : ${item.email}</p>
													<p>이름 : ${item.name}</p>
													<p>지역 : ${item.location}</p>
													<p>등록일자 : ${item.register_date}</p>
													
													</div>
     											<!-- Footer -->
													<div class="modal-footer" >
														
														
													</div>
													
												</div>
												
											</div>
										
										</div>
										<td>${item.location }</td>
										<td>${item.register_date }</td>
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
		</div>
		
	</div>
	<c:import url="../common/end.jsp" />
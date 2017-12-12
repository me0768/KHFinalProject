<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="com.kh.fitnessground.workout.yoga.model.vo.Yoga, java.util.List"%>

<c:import url="common/head.jsp" />

<style type="text/css">
</style>

<c:import url="common/headend.jsp" />
<c:import url="common/nav.jsp" />

<!-- Body부분  -->
<div class="content-wrapper">
	<div class="container-fluid">
	<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item">동영상관리_요가 </li>
		</ol>
		<!-- Example DataTables Card-->
		<div class="card mb-3">
			<div class="card-header">
				<h4>동영상추가하기</h4>
				<label>youtube playlist id를 입력하세요 .</label>
				<div class="input-area">
				<span>카테고리:</span>
				<select id="select-ct">
					<option value="빈야사">빈야사</option>
					<option value="다이어트">다이어트</option>
					<option value="체형교정">체형교정</option>
					<option value="부위별">부위별</option>
					<option value="초보자">초보자</option>
				</select>
				<input type="text" placeholder="playlistId입력" id="playlistid">
				
				<button class="btn btn-success" onclick="javascript : insert()">추가</button>
				</div>
				
				
			</div>
			<div class="card-body">
					<div class="table-responsive">
						<form name="userForm">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Index</th>
										<th>Title</th>
										<th>category1</th>
										<th>category2</th>
										<th>url</th>
										<th>조회수</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="item" items="${list }" varStatus="status">
										<tr>
											<td>${item.v_no }</td>
											<td>${item.title }</td>
											<td>${item.category1 }</td>
											<td>${item.category2 }</td>
											<td>${item.url }</td>
											<td>${item.readcount }</td>
											<td><button type="submit" class="btn btn-primary"
															onclick="edit(${item.v_no})">수정</button></td>

										</tr>
									</c:forEach>

								</tbody>
							</table>
						</form>
						</div>
				</div>
		</div>
		
		<!-- YoutubeAPI, Ajax 관리자 INSERT  -->
		<script type="text/javascript">
		function insert(playlist){
			var category2 = $("#select-ct").val();
			var playlist; //관리자가 입력한playlistId//테스트성공하면 admin input태그 넣어 화면만들기
			var vTitle;
			var vDesc;
			var vId;
			var job = new Object();
			var jarr = [];
			/* job.title = "먕"; 
			job.url = "eraefjdklf";
			jarr.push(job); */
			/* var job = new Object();
			 */
			var j;
			function youtubeCall() {
				$.get("https://www.googleapis.com/youtube/v3/playlistItems", {
					part : 'snippet',
					maxResults : 50,
					playlistId : playlist,
					async: false,
					key : 'AIzaSyACiHNLQp0NoZLhAx6u2JbtMGjCp3STK3A'
				}, function(data) {
		
					$.each(data.items, function(i, item) {
						vTitle = item.snippet.title.replace(/&/gi, "+");
						vDesc = item.snippet.description.replace(/&/gi, "+");
						vId = item.snippet.resourceId.videoId;
						//하나가 아니라서 json array에 담고 그걸 다시 json객체에 담아서 컨트롤러에 보내야.....
						var job = new Object();
						job.title = vTitle;
						/* job.content = vDesc; */
						job.url = vId;
						job.category2 = category2;
						jarr.push(job);
		
					});
					console.log(JSON.stringify(jarr));
				});
		
			};
		
			function ajaxFunction() {
				/*Controller로 넘기기 */
				console.log("ajaxFunction실행");
				$
						.ajax({
							url : "yinsert.do",
							data : JSON.stringify(jarr),
							type : "post",
							contentType : "application/json; charset=utf-8",
							success : function(result) {
								console.log("전송성공:");
							},
							error : function(request, status, errorData) {
								alert("error code : " + request.status + "\n"
										+ "message : " + request.responseText + "\n"
										+ "error : " + errorData);
							}
						});
			}
		}
		</script>
		
		
<!-- admin common code  -->		
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		<c:import url="common/footer.jsp" />
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
	</div>
<c:import url="common/end.jsp" />

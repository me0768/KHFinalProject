<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="com.kh.fitnessground.workout.yoga.model.vo.Yoga, java.util.List"%>

<c:import url="common/head.jsp" />

<style type="text/css">
</style>
<link
	href="/fitnessground/resources/admin/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<c:import url="common/headend.jsp" />

<script
	src="/fitnessground/resources/admin/vendor/datatables/jquery.dataTables.js"></script>
<script
	src="/fitnessground/resources/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
<script
	src="/fitnessground/resources/admin/js/sb-admin-datatables.min.js"></script>

<c:import url="common/nav.jsp" />

<!-- Body부분  -->
<div class="content-wrapper">
	<div class="container-fluid">
	<h3>&nbsp;동영상관리</h3>
	<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item active"><a href="adminylist.do">ALL </a></li>
			<li class="breadcrumb-item"><a href="javascript: listing('헬스')">헬스</a> </li>
			<li class="breadcrumb-item"><a href="javascript: listing('요가')">요가 </a></li>
			<li class="breadcrumb-item"><a href="javascript: listing('필라테스')">필라테스</a></li>
			<li class="breadcrumb-item"><a href="javascript: listing('맨몸운동')">맨몸운동 </a></li>
		</ol>
		<!-- Example DataTables Card-->
		<div class="card mb-3">
			<div class="card-header">
				<h4>동영상추가하기</h4>
				<label>youtube playlist id를 입력하세요 .</label>
				<div class="input-area">
				<span>운동: </span>
				<select name="select-workout" id="select-workout" class="form-control">
					<option value="2">요가</option>
					<option value="3">필라테스</option>
					<option value="4">맨몸운동</option>
					
				</select>
				<span>카테고리: </span>
				<select name="select-ct" id="select-ct" class="form-control">
					<option value="2">빈야사</option>
					<option value="2">다이어트</option>
					<option value="2">체형교정</option>
					<option value="2">부위별</option>
					<option value="2">초보자</option>
					<option value="3">스트레칭</option>
					<option value="3">복근집중운동</option>
					<option value="3">전신운동</option>
					<option value="3">하체운동</option>
					<option value="4">맨몸운동1</option>
					<option value="4">맨몸운동2</option>
					<option value="4">맨몸운동3</option>
					<option value="4">맨몸운동4</option>
					
				</select>
				<input type="text" placeholder="playlist Id입력" id="playlist_id">
				
				<button class="btn btn-default" onclick="insert()">추가</button>
				</div>
				
				
			</div>
			<div id="card-result"></div>
			<div class="card-body">
					<div class="table-responsive">
						
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Index</th>
										<th>Title</th>
										<th>운동</th>
										<th>category</th>
										
										<th>조회수</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody id="rows">

									<c:forEach var="item" items="${list }" varStatus="status">
										<tr id="tr-${item.v_no }">
											<td>${item.v_no }</td>
											<td>${item.title }</td>
											<td>${item.category1 }</td>
											<td>${item.category2 }</td>
											<td>${item.readcount }</td>
											<td><a id="collapse-${item.v_no }" data-toggle="collapse" href="#collapse${item.v_no }">
                                 <button type="submit" class="btn btn-success btn-sm" onclick="edit(${item.v_no})">수정</button></a>
												<button type="submit" class="btn btn-danger btn-sm"
															onclick="deleteOne(${item.v_no})">삭제</button>
											</td>

										</tr>
										<%-- <tr id='collapse${item.v_no }' class='collapse in' data-parent='collapse-${item.v_no }'>
										<td colspan='6'></td></tr> --%>
									</c:forEach>

								</tbody>
							</table>
						
						</div>
				</div>
		</div>
		
		
		<script type="text/javascript">
		
		/*운동 선택 시 category 바뀌도록 */
		$(document).ready(function(){
			
			if($("#select-workout").data('options') === undefined){
				$("#select-workout").data('options', $('#select-ct option').clone());
			}
			var id = $("#select-workout").val();
			var options = $("#select-workout").data('options').filter('[value=' + id+ ']');
			$('#select-ct').html(options);
			
			$("#select-workout").change(function(){
				if($(this).data('options') === undefined){
					$(this).data('options', $('#select-ct option').clone());
				}
				var id = $(this).val();
				var options = $(this).data('options').filter('[value=' + id+ ']');
				$('#select-ct').html(options);
			});
		});
		
		/*운동종류별 목록 ajax로 select */
		function listing(category1){
			var category = category1;
			console.log(category);
			var queryString = { "category1": category };
			$.ajax({
				url: 'adminwlist.do',
				data : queryString,
				type : "post",
				dataType: "json",
				async: false,
		       success : function(result){
		          console.log("전송성공:"+result.clist[0].v_no+result.clist[0].title);
		          var v_no;
		          var title;
		          var category1;
		          var category2;
		          var url;
		          var readcount;
		          var content; //나중에 update할때 필요하면쓰기 
		  
         	for(var i=0;i<result.clist.length;i++){
        	  (function(v_no, title, category1, category2, vid, readcount, content){
		          v_no = result.clist[i].v_no;
		          title = result.clist[i].title;
		          category1 = result.clist[i].category1;
		          category2 = result.clist[i].category2;
		          vid = result.clist[i].url;
		          readcount = result.clist[i].readcount;
		          content = result.clist[i].content;
		          var value ="<tr><td>"+v_no+"</td>"+
						"<td>"+title+"</td>"+
						"<td>"+category1+"</td>"+
						"<td>"+category2+"</td>"+
					
						"<td>"+readcount+"</td>"+
						"<td><button type='submit' class='btn btn-primary btn-sm' onclick='edit("+v_no+")'>수정</button>"+
						"<button type='submit' class='btn btn-danger btn-sm' onclick='deleteOne("+v_no+")'>삭제</button></td></tr>";
		
					if(i==0){
						$('#rows').html(value);
					}else{
					  $('#rows').append(value);
		          	}
				
				}(i));//IIFE codes exit
          		};//for문종료  

          
	       },
	       error : function(request, status, errorData){
	          alert("error code : " + request.status + "\n"
	                + "message : " + request.responseText
	                + "\n" + "error : " + errorData);
	       }
		});//ajax code exit 
		} //listing() ends... 
		
		/*YoutubeAPI호출, Ajax 관리자 INSERT*/
		function insert(){
			console.log("insert() works!");
			var category1 = $("#select-workout").val(); //선택된 운동종류 
			var category2 = $("#select-ct").val(); //선택된 카테고리
			var playlist = $("#playlist_id").val(); //입력된 playlistId
			var vTitle;
			var vDesc;
			var vId;
			var job = new Object();
			var jarr = [];
			
			APICall();
			
			function APICall() { 
				 $.get("https://www.googleapis.com/youtube/v3/playlistItems", {
					part : 'snippet',
					maxResults : 50,
					playlistId : playlist,
					key : 'AIzaSyACiHNLQp0NoZLhAx6u2JbtMGjCp3STK3A'
				}, function(data) {
					console.log("API is called");
					$.each(data.items, function(i, item) {
						vTitle = item.snippet.title.replace(/&/gi, "+");
						vDesc = item.snippet.description.replace(/&/gi, "+");
						vId = item.snippet.resourceId.videoId;
						//하나가 아니라서 json array에 담고 그걸 다시 json객체에 담아서 컨트롤러에 보내야.....
						var job = new Object();
						job.title = vTitle;
						/* job.content = vDesc; */
						job.url = vId;
						job.category1 = category1;
						job.category2 = category2;
						jarr.push(job);
		
					});
					console.log(JSON.stringify(jarr));
					ajaxFunction();
				});
				
		
			}; 
		
				//Controller로 넘기기 
				function ajaxFunction() {
					console.log("ajaxFunction실행");
					$.ajax({
						url : "yinsert.do",
						data : JSON.stringify(jarr),
						type : "post",
						async: false,
						contentType : "application/json; charset=utf-8",
						success : function(result) {
							console.log("전송성공:");
							$('#card-result').append('<div class="alert alert-success" role="alert">playlist가 추가되었습니다!</div>');
						},
						error : function(request, status, errorData) {
							alert("error code : " + request.status + "\n"
									+ "message : " + request.responseText + "\n"
									+ "error : " + errorData);
						}
					})
						
				}
		}//Insert() ends... 
		
		
		/* Edit */
		function edit(v_no){
			var id = "#tr-"+v_no;
			var value = "<tr id='collapse"+v_no+"' class='collapse in' data-parent='collapse-"+v_no+"'><td colspan='6'>"+
			"<form><div class='form-group'><label for='title'>Title</label>"+
			"<input type='text' class='form-control' id='title' placeholder='제목을 입력하세요'></div></form>"+
			"<div class='form-group'><label for='url/video-id'>url/video-id</label>"+
			"<input type='text' class='form-control' id='url'></div>"+
			"<span>운동: </span><select name='select-w' id='select-w' class='form-control'>"+
			"<option value='2'>요가</option><option value='3'>필라테스</option><option value='4'>맨몸운동</option></select>"+
			"<span>카테고리: </span><select name='select-c' id='select-c' class='form-control'><option value='2'>빈야사</option>"+
			"<option value='2'>다이어트</option>"+
				"<option value='2'>체형교정</option>"+
				"<option value='2'>부위별</option>"+
				"<option value='2'>초보자</option>"+
				"<option value='3'>스트레칭</option>"+
				"<option value='3'>복근집중운동</option>"+
				"<option value='3'>전신운동</option>"+
				"<option value='3'>하체운동</option>"+
				"<option value='4'>맨몸운동1</option>"+
				"<option value='4'>맨몸운동2</option>"+
				"<option value='4'>맨몸운동3</option>"+
				"<option value='4'>맨몸운동4</option></select>"+"</td></tr>";
			
			$(value).insertAfter(id);
			if($("#select-w").data('options') === undefined){
				$("#select-w").data('options', $('#select-c option').clone());
			}
			var id = $("#select-w").val();
			var options = $("#select-w").data('options').filter('[value=' + id+ ']');
			$('#select-c').html(options);
			
			$("#select-w").change(function(){
				if($(this).data('options') === undefined){
					$(this).data('options', $('#select-c option').clone());
				}
				var id = $(this).val();
				var options = $(this).data('options').filter('[value=' + id+ ']');
				$('#select-c').html(options);
			});
			
			//on open collapse//수정 한번 더 누르면 밑에 더 계속 append되는 ㅠㅠㅠㅠ
			$('.collapse').on('shown.bs.collapse', function () {
			  var target = '#'+$(this).attr('data-parent');
			  console.log("open");
			  $(target).addClass('collapse-open');
			})

			//close collapse(제대로 작동안하는듯?;;)
			$('.collapse').off('shown.bs.collapse');

				
		}// edit(v_no) ends...
		
		/* Delete (하나씩) */
		function deleteOne(v_no){
			console.log("deleteOne() works! with"+ v_no);
			var v_no = v_no;
			var queryString = {"v_no": v_no };
			$.ajax({
				url : "deleteone.do",
				data : queryString,
				dataType: "json",
				type : "post",
				success : function(result) {
					console.log("전송성공:");
					$('#card-result').append('<div class="alert alert-success" role="alert">삭제되었습니다!</div>');
					setTimeout(function(){
						window.location.reload();
					}, 1500);
				},
				error : function(request, status, errorData) {
					alert("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
				}
			}) //ajax ends..
						
		}//deleteOne(v_no) ends...
		
	
		
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

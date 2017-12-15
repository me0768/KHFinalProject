<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="com.kh.fitnessground.workout.yoga.model.vo.Yoga, java.util.List"%>

<c:import url="common/head.jsp" />

<link href="/fitnessground/resources/admin/css/workout-admin.css" rel="stylesheet">

<c:import url="common/headend.jsp" />


<c:import url="common/nav.jsp" />

<!-- Body부분  -->
<div class="content-wrapper">
	<div class="container-fluid">
	<!-- Breadcrumbs-->
		
		<ol class="breadcrumb">
		<h3 id="page-title">&nbsp;동영상관리</h3>
			<li class="breadcrumb-item active ct"><a href="adminylist.do" id="active">ALL </a></li>
			<li class="breadcrumb-item ct"><a href="javascript: listing('헬스')" >헬스</a> </li>
			<li class="breadcrumb-item ct"><a href="javascript: listing('요가')">요가 </a></li>
			<li class="breadcrumb-item ct"><a href="javascript: listing('필라테스')">필라테스</a></li>
			<li class="breadcrumb-item ct"><a href="javascript: listing('맨몸운동')">맨몸운동 </a></li>
		</ol>

		<!-- Example DataTables Card-->
		<div class="card mb-3">
			<div class="card-header">
				<h4>동영상추가하기</h4>
				<p>youtube playlist id를 입력하세요 .</p>
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
					<option value="4">팔굽혀 펴기</option>
					<option value="4">하체 운동</option>
					<option value="4">철봉 운동</option>
					<option value="4">전신 프로그램</option>
					<option value="4">초보자를 위한 3개월 프로그램</option>
					
				</select>
				<input type="text" class="form-control" placeholder="playlist Id입력" id="playlist_id">
				
				<button class="btn btn-info" onclick="insert()">추가</button>
				</div>
				
				
			</div>
			<div id="card-result"></div>
			<div class="card-body">
					<div class="table-responsive">
							
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th id="ch"><input type="checkbox" id="selectall"/></th>
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
											<td><input type="checkbox" class="case" name="case" value="${item.v_no }"/></td>
											<td>${item.v_no }</td>
											<td>${item.title }</td>
											<td>${item.category1 }</td>
											<td>${item.category2 }</td>
											<td>${item.readcount }</td>
											<td><a class="cps" aria-expanded="false" data-target = "#collapse${item.v_no }" data-toggle="collapse" href="#collapse${item.v_no }">
                                 				<button type="submit" class="btn btn-primary btn-sm" onclick="editView(${item.v_no})">수정</button></a>
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
		
		/*template layout때문에 수정 */
		$(document).ready(function(){
			var value = '<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">';
			$('.dataTables_filter>label').html(value);//검색바 아이콘으로 바꿈 	
			
			var value2 = '<a href="javascript: deleteSelected()"><button class="btn btn-info"><i class="fa fa-trash-o" aria-hidden="true"></i></button></a>'+
			'<span>&nbsp;&nbsp;Show</span> <select name="dataTable_length" aria-controls="dataTable" class="form-control form-control-sm">'+
			'<option value="10">10</option><option value="25">25</option><option value="50">50</option>'+
			'<option value="100">100</option></select><span> entries</span>' ;
			$('.dataTables_length>label').html(value2); //삭제버튼 붙이기 
			
			$("#ch").removeClass("sorting_asc");//체크박스th에 필터표시 안뜨도록
			
			$("#selectall").click(function(){
			    $('input:checkbox').not(this).prop('checked', this.checked);
			}); ///이게무슨코드야........이해를하고쓰자...//ajax방식은 insert처럼하면될듯.insert랑다른점은얘는 v_no만다넘겨준다는것?..!
			
		});		
		
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
						"<td><button type='submit' class='btn btn-primary btn-sm' onclick='editView("+v_no+")'>수정</button>"+
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
		
	
		
		/* Edit 수정하기 화면 collapse */
		function editView(v_no){
			var id = "#tr-"+v_no;
			var value = "<tr id='collapse"+v_no+"' class='collapse in' data-toggle='collapse'><td colspan='5' id='edit-td'>"+
			"<label for='title'>Title</label>"+
			"<input type='text' class='form-control' id='v-title' placeholder='제목을 입력하세요'><br>"+
			"<label for='url/video-id'>url/video-id</label>"+
			"<input type='text' class='form-control' id='v-url'><br>"+
			"<label for='운동'>운동</label><select name='select-w' id='select-w' class='form-control'>"+
			"<option value='2'>요가</option><option value='3'>필라테스</option><option value='4'>맨몸운동</option></select>"+
			"<label for='카테고리'>카테고리</label><select name='select-c' id='select-c' class='form-control'><option value='2'>빈야사</option>"+
			"<option value='2'>다이어트</option>"+
				"<option value='2'>체형교정</option>"+
				"<option value='2'>부위별</option>"+
				"<option value='2'>초보자</option>"+
				"<option value='3'>스트레칭</option>"+
				"<option value='3'>복근집중운동</option>"+
				"<option value='3'>전신운동</option>"+
				"<option value='3'>하체운동</option>"+
				"<option value='4'>팔굽혀 펴기</option>"+
				"<option value='4'>하체 운동</option>"+
				"<option value='4'>철봉 운동</option>"+
				"<option value='4'>전신 프로그램</option>"+
				"<option value='4'>초보자를 위한 3개월 프로그램</option></select><br>"+
				"<label for='content'>내용</label>"+
				"<textarea class='form-control' id='v-content' rows='5'></textarea><br>"+
				"<a class='btn btn-primary' id='edit-btn' href='javascript: update("+v_no+")' role='button'>수정</a>"+"</td></tr>";
			
			$('#collapse'+v_no).toggle(inserttr(), removetr());	
			function inserttr(){
				$(value).insertAfter(id);
			}
			function removetr(){
				$('#collapse'+v_no).removeClass("show");
			}
			
			//category1 선택하면 자동으로 category2 바뀜
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
				
			//ajax로 원래 값 표시 
			var queryString = {"v_no": v_no};
			$.ajax({
				url : "editview.do",
				data: queryString,
				dataType: "json",
				type: "post",
				success: function(result){
					console.log("edit view 전송 성공");
					var title = result.yoga.title;
					var url = result.yoga.url;
					var category1 = result.yoga.category1;
					var category2 = result.yoga.category2;
					var content = result.yoga.content;
					$('#v-title').val(title);
					$('#v-url').val(url);
					$('#v-content').val(content);
					$("#select-w > option[value"+category1+"]").prop("selected", true);
					$("#select-c > option[value"+category2+"]").prop("selected", true);
				},
				error: function(request, status, errorData) {
					alert("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
				}
			})//ajax ends..
				
		}// edit(v_no) ends...
		
		/* Update 수정처리 */
		function update(v_no){
			console.log("update() is running..");
			var title = $('#v-title').val();
			var url = $('#v-url').val();
			var content = $('#v-content').val();
			var category1 = $('#select-w option:selected').text();
			var category2 = $('#select-c option:selected').text();
			
			var data = { 
						"v_no" : v_no,
						"title" : title, 
						"url" : url, 
						"content" : content, 
						"category1" : category1, 
						"category2": category2
					};
			$.ajax({
				url : "yupdate.do",
				data : data,
				dataType: "json",
				type: "post",
				success: function(result){
					alert("수정되었습니다.");
					var category1 = result.list[0].category1;
					listing(category1);
				},
				error: function(request, status, errorData) {
					alert("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
						}
			})//ajax ends..
		}//update(v_no) ends...
		
		
		/* Delete (하나씩) */
		function deleteOne(v_no){
			console.log("deleteOne() works with v_no:"+ v_no);
			
			var queryString = {"v_no": v_no };
			$.ajax({
				url : "deleteone.do",
				data : queryString,
				dataType: "json",
				type : "post",
				success : function(result) {
					console.log("전송성공:");
					alert("삭제되었습니다!");
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
		
		/*Delete 여러개 한꺼번에(체크박스선택된것) */
		function deleteSelected(){
			var selected = [];
			$('#selectall input:checked').each(function() {
			    selected.push($(this).attr('name'));
			});
			$.ajax({
				url : "deletel.do",
				data : queryString,
				dataType: "json",
				type : "post",
				success : function(result) {
					console.log("전송성공:");
					alert("삭제되었습니다!");
					setTimeout(function(){
						window.location.reload();
					}, 700);
				},
				error : function(request, status, errorData) {
					alert("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
				}
			}) //ajax ends..
			
			
		}//deleteSelected() ends...

		</script>
		
		
<!-- admin common code  -->		
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		<c:import url="common/footer.jsp" />
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fa fa-angle-up"></i>
		</a>
	</div>
	</div>
<c:import url="common/end.jsp" />

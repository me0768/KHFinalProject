<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade bs-example-modal-sm" id="login">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<img src="/fitnessground/resources/images/큰이미지로고.jpg">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div id="loginfield">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1"> 
								<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							</span>
							<input type="email" class="form-control" placeholder="abc@iei.co.kr" aria-describedby="basic-addon1" name="email">
						</div>
					</div>
					<div id="loginfield">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1"> 
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							</span>
							<input type="password" class="form-control"	placeholder="password" aria-describedby="basic-addon1" name="pwd">
						</div>
					</div>
					<div id="loginfield" class="btn-group btn-group-justified" role="group">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-primary">Login</button>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="fulldiv">
						<div id="loginfield" class="btn-group btn-group-justified" role="group">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-danger" onclick="return register();">회원가입</button>
						</div>
					</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="fulldiv" style="padding-top: 10px;">
						<h6>
							<a href="#" onclick="return detectid();">아이디 찾기</a>
						</h6>
						<h6>
							<a href="#" onclick="return detectpwd();">비밀번호 찾기</a>
						</h6>
					</div>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade bs-example-modal-md" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true" id="register">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="height: 200px;">회원가입</div>
	</div>
</div>

<div class="modal fade bs-example-modal-md" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true" id="detectid">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="height: 200px;">
			<h5>아이디찾기</h5>
		</div>
	</div>
</div>

<div class="modal fade bs-example-modal-md" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true" id="detectpwd">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="height: 200px;">
			<h5>비밀번호찾기</h5>
		</div>
	</div>
</div>

<script type="text/javascript">
	function login() {
		$("#login").show();
		$("#register").hide();
<<<<<<< HEAD
		$("#detectid").hide();
		$("#detectpwd").hide();
=======
		$("#detectidpwd").hide();
		$("#email").val('');
		$("#pwd").val('');
>>>>>>> master
		$("#login").modal();
	}

	function register() {
		$("#login").hide();
		$("#detectid").hide();
		$("#detectpwd").hide();
		$("#register").show();
		$("#register").modal();
	}
	
<<<<<<< HEAD
	function detectid(){
		$("#login").hide();
		$("#register").hide();
		$("#detectid").show();
		$("#detectpwd").hide();
		$("#detectid").modal();
=======
	function logincheck(){
		var email = $("#email").val();
		var pwd = $("#pwd").val();
		var queryString = { "email": email, "pwd": pwd };
		$.ajax({
			url : "login.do",
			dataType : "json",
			type : "get",
			data : queryString,
			success : function(responseData){
				var data = responseData.user;
				$("#ajax").remove();
				if(data == null){
					alert("아이디와 비밀번호를 확인해주세요.");
					return false;
				}
				$("#login").modal("hide");
				location.href = "main.do";
				/* 수정 - 비밀번호 변경 나오면 여기에 tmppwd_tf여부 확인하고 변경 페이지로 */
			},
			error : function(jqXHR, textStatus, errorThrown) {
		        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		    }
		});
>>>>>>> master
	}
	
	function detectpwd(){
		$("#login").hide();
		$("#register").hide();
		$("#detectid").hide();
		$("#detectpwd").show();
		$("#detectpwd").modal();
	}
</script>
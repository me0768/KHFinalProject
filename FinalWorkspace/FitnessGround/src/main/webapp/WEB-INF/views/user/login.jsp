<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade bs-example-modal-sm" id="login">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header" id="login_header">
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
							<input type="email" class="form-control" placeholder="abc@iei.co.kr" aria-describedby="basic-addon1" id="email" name="email" oninput="emptycheck(); ">
						</div>
					</div>
					<div id="loginfield">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1"> 
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							</span>
							<input type="password" class="form-control"	placeholder="password" aria-describedby="basic-addon1" id="pwd" name="pwd" oninput="emptycheck(); ">
						</div>
					</div>
					<div id="loginfield" class="btn-group btn-group-justified" role="group">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-primary" id="loginbtn" onclick="logincheck(); " disabled>Login</button>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="fulldiv">
						<div id="loginfield" class="btn-group btn-group-justified" role="group">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-danger" onclick="return register();">회원가입</button>
						</div>
					</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="fulldiv" style="margin-top: 10px; color: black; font-size: 7pt;">
						<div>
							<a href="#" onclick="return detectid();">아이디&nbsp;또는&nbsp;비밀번호를<br>잊어버리셨나요?</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript">
	// 로그인 모달창 열림
	function login() {
		$("#login").show();
		$("#register").hide();
		$("#detectidpwd").hide();
		$("#email").val('');
		$("#pwd").val('');
		$("#findidname").val('');
		$("#findidphone").val('');
		$("#login").modal();
	}

	// 이메일과 비번이 비었으면 로그인버튼 비활성화
	function emptycheck(){
		var email = $("#email").val();
		var pwd = $("#pwd").val();
		if(email == "" || pwd == ""){
			$("#loginbtn").prop("disabled",true);
		} else {
			$("#loginbtn").prop("disabled",false);
		}
	}
	
	// 로그인 체크 ajax
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
	}
	
	
	
</script>
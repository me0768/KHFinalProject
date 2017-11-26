<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<div class="modal fade bs-example-modal-md" id="register">
	<div class="modal-dialog modal-lg">
		<div class="modal-content col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
			<div class="modal-header" style="height: 600px;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<img src="/fitnessground/resources/images/로고.png">
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<h5>회원가입</h5>
				</div>
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="email" class="form-control" placeholder="이메일" id="email" name="email" oninput="emailcheck();">
				</div>
				<div id="emailfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<div style="color: red;">
					* 아이디를 입력하세요.
					</div>
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="password" class="form-control" placeholder="비밀번호" id="pwd" name="pwd">
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="password" class="form-control" placeholder="비밀번호 확인" id="pwd2" name="pwd2" oninput="pwdcheck(); ">
				</div>
				<div id="pwdfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<div style="color: red;">
					* 비밀번호가 서로 다릅니다.
					</div>
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="text" class="form-control" placeholder="이름" id="name" name="name">
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="text" class="form-control" placeholder="닉네임" id="nickname" name="nickname" oninput="nicknamecheck();">
				</div>
				<div id="namefield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<div style="color: red;">
					* 닉네임을 입력하세요.
					</div>
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="text" class="form-control" placeholder="전화번호" id="phone" name="phone" oninput="phonecheck(); ">
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<label class="form-control btn btn-danger">
						<input type="checkbox" autocomplete="off"> 사업자 회원가입
					</label>
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<button type="button" class="form-control btn btn-primary" id="registerbtn" onclick="registercheck();" disabled>회원가입</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function register() {
	$("#login").hide();
	$("#detectidpwd").hide();
	$("#register").show();
	$("#register").modal();
}

function emailcheck(){
	var email = $("#email").val();
	console.log(email);
	var queryString = { "email": email };
	$.ajax({
		url : "emailcheck.do",
		dataType : "json",
		type : "get",
		data : queryString, 
		success : function(responseData){
			var data = responserData.email;
			$("#ajax").remove();
			if(data == null){
				var value = '';
				values += "<div style='color: green;'> * 사용할 수 있는 이메일 입니다. </div>";
				$("#email").html(value);
			}
			else {
				var value = '';
				values += "<div style='color: red;'> * 이미 사용되고있는 이메일 입니다. </div>";
				$("#email").html(value);
			}
		}
	});
}

function pwdcheck(){
	//비번 같은지 체크
}

function nickamecheck(){
	// 닉네임 중복확인 ajax
}

function phonecheck(){
	// 전화번호 자동으로 뒤에 - 주가
}
</script>


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
					<input type="email" class="form-control" placeholder="이메일" id="registeremail" name="email" oninput="emailcheck();">
				</div>
				<div id="emailfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<div style="color: red;">
					* 아이디를 입력하세요.
					</div>
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="password" class="form-control" placeholder="비밀번호" id="registerpwd" name="pwd">
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="password" class="form-control" placeholder="비밀번호 확인" id="registerpwd2" name="pwd2" oninput="pwdcheck(); ">
				</div>
				<div id="pwdfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<div style="color: red;">
					* 비밀번호를 입력하세요.
					</div>
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="text" class="form-control" placeholder="이름" id="registername" name="name" oninput="namecheck();">
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="text" class="form-control" placeholder="닉네임" id="registernickname" name="nickname" oninput="nicknamecheck();">
				</div>
				<div id="nicknamefield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<div style="color: red;">
					* 닉네임을 입력하세요.
					</div>
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<input type="text" class="form-control" placeholder="전화번호" id="registerphone" name="phone" oninput="phonecheck(); ">
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<label class="form-control btn btn-danger">
						<input type="checkbox" autocomplete="off" id="registeruserlevel" value="2"> 사업자 회원가입
					</label>
				</div>
				<div id="loginfield" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<button type="button" class="form-control btn btn-primary" id="registerbtn" onclick="registerCheck();" disabled>회원가입</button>
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
	$("#registeremail").val('');
	$("#registerpwd").val('');
	$("#registername").val('');
	$("#registernickname").val('');
	$("#registerphone").val('');
	$("#register").modal();
}
var emailval = 0;
var pwdval = 0;
var nameval = 0;
var nicknameval = 0;
var phoneval = 0;

function emailcheck(){
	var email = $("#registeremail").val();
	var queryString = { "email": email };
	if(!email.includes("@") || ( !email.includes(".com") && !email.includes(".kr"))){
		$("#registeremail").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});		
	} else {
		$("#registeremail").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
	}
	$.ajax({
		url : "emailCheck.do",
		dataType : "json",
		type : "get",
		data : queryString, 
		success : function(responseData){
			var data = responseData.user;
			$("#ajax").remove();
			if(data == null){
				var value = '';
				value += "<div style='color: green;'> * 사용할 수 있는 이메일 입니다. </div>";
				$("#emailfield").html(value);
				emailval = 1;
				onregisterbtn();
			}
			else {
				var value = '';
				value += "<div style='color: red;'> * 이미 사용되고있는 이메일 입니다. </div>";
				$("#emailfield").html(value);
				$("#registeremail").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
			}
		}
	});
}

function pwdcheck(){
	var pwd1 = $("#registerpwd").val();
	var pwd2 = $("#registerpwd2").val();
	if(pwd1 != pwd2){
		$("#registerpwd").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
		$("#registerpwd2").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
		var value = '';
		value += "<div style='color: red;'> * 비밀번호가 서로 다릅니다. </div>";
		$("#pwdfield").html(value);
	} else if (pwd1 == pwd2){
		$("#registerpwd").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
		$("#registerpwd2").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
		var value = '';
		value += "<div style='color: green;'> * 비밀번호가 일치합니다. </div>";
		$("#pwdfield").html(value);
		pwdval = 1;
		onregisterbtn();
	}
}

function nicknamecheck(){
	var nickname = $("#registernickname").val();
	var queryString = { "nickname": nickname };
	$.ajax({
		url : "nicknameCheck.do",
		dataType : "json",
		type : "get",
		data : queryString, 
		success : function(responseData){
			var data = responseData.user;
			$("#ajax").remove();
			if(data == null){
				var value = '';
				value += "<div style='color: green;'> * 사용할 수 있는 닉네임 입니다. </div>";
				$("#nicknamefield").html(value);
				$("#registernickname").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
				nicknameval = 1;
				onregisterbtn();
			}
			else {
				var value = '';
				value += "<div style='color: red;'> * 이미 사용되고있는 닉네임 입니다. </div>";
				$("#nicknamefield").html(value);
				$("#registernickname").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
			}
		}
	});
}

function namecheck(){
	var name = $("#registername").val();
	if(name == ""){
		$("#registername").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
	} else  if(name != ""){
		$("#registername").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
		nameval = 1;
		onregisterbtn();
	}
}

function phonecheck(){
	var phone = $("#registerphone").val();
	if(phone.length == 3){
		phone += "-";
		$("#registerphone").val(phone);
	}else if(phone.length == 8){
		phone += "-";
		$("#registerphone").val(phone);
	} else if (phone.length == 12){
		phone = phone.replace(/\-/g, '');
		phone = phone.substr(0,3) + "-" + phone.substr(3,3) + "-" + phone.substr(6, 4);
		$("#registerphone").val(phone);
		$("#registerphone").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
		phoneval = 1;
		onregisterbtn();
	} else if (phone.length == 13){
		phone = phone.replace(/\-/g, '');
		phone = phone.substr(0,3) + "-" + phone.substr(3,4) + "-" + phone.substr(7, 4);
		$("#registerphone").val(phone);
		$("#registerphone").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
		phoneval = 1;
		onregisterbtn();
	} else {
		$("#registerphone").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
	}
}

function onregisterbtn(){
	var sum = emailval + pwdval + nameval + nicknameval + phoneval;
	if(sum == 5){
		$("#registerbtn").prop("disabled", false);
	} else {
		$("#registerbtn").prop("disabled", true);
	}
}

function registerCheck(){
	var email = $("#registeremail").val();
	var pwd = $("#registerpwd").val();
	var name = $("#registername").val();
	var nickname = $("#registernickname").val();
	var phone = $("#registerphone").val();
	var user_level = 0;
	if($("#registeruserlevel").is(":checked")){
		user_level = 1;
	}
	var queryString = { "email": email,
						"pwd": pwd, 
						"name": name, 
						"nickname": nickname, 
						"phone": phone, 
						"userlevel": user_level };
	$.ajax({
		url : "register.do",
		type : "get",
		data : queryString,
		success : function(responseDate){
			alert("성공");
		},
		error : function(jqXHR, textStatus, errorThrown) {
	        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	    }
	});
}
</script>


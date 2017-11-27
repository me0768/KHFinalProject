<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<div class="modal fade bs-example-modal-lg" id="detectidpwd">
	<div class="modal-dialog modal-lg">
		<div class="modal-content col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1 col-xs-12">
			<div class="modal-header" id="find_header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<img src="/fitnessground/resources/images/로고.png">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="findfield">
					<div role="tabpanel" style="color: black;">
						<ul class="nav nav-tabs" role="tablist">
	    					<li role="presentation" class="active col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;"><a href="#findid" aria-controls="findid" role="tab" data-toggle="tab" onclick="selecttab1(); " id="findliid">아이디 찾기</a></li>
	    					<li role="presentation" class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;"><a href="#findpwd" aria-controls="findpwd" role="tab" data-toggle="tab" onclick="selecttab2(); " id="findlipwd">비밀번호 찾기</a></li>
	    				</ul>
	    				
	    				<div class="tab-content">
						    <div role="tabpanel" class="tab-pane active" id="findid">
						    	<!-- 아이디 찾기 -->
						    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="findidfield">
						    		이메일을&nbsp;잊어버리셨나요??<br>
						    		가입할&nbsp;때&nbsp;입력한&nbsp;이름과&nbsp;전화번호를<br>
						    		입력하면&nbsp;이메일을&nbsp;확인할&nbsp;수&nbsp;있어요!
						    	</div>
						  		<div class="input-group" id="findinput">
									<span class="input-group-addon" id="basic-addon1"> 
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
									</span>
									<input type="text" class="form-control" placeholder="이름" aria-describedby="basic-addon1" id="findidname" name="name">
								</div>
								<div class="input-group" id="findinput">
									<span class="input-group-addon" id="basic-addon1"> 
										<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
									</span>
									<input type="text" class="form-control" placeholder="전화번호" aria-describedby="basic-addon1" id="findidphone" name="phone" oninput="findphonecheck(1);">
									
								</div>
								<div id="findidbtn" class="btn-group btn-group-justified" role="group">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-danger" onclick="return findid();">아이디 찾기</button>
									</div>
								</div>
								<div id="resultfindid" style="height: 100px; padding-top: 10px;">
									여기에 찾은 결과가 나옵니다!
								</div>
								<!-- /아이디 찾기 -->
						    </div>
						    <div role="tabpanel" class="tab-pane" id="findpwd">
						    	<!-- 비밀번호 찾기 -->
						    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="findpwdfield">
						    		비밀번호를&nbsp;잊어버리셨나요??<br>
						    		가입할&nbsp;때&nbsp;입력한&nbsp;이메일로&nbsp;임시<br>
						    		비밀번호를&nbsp;보내드립니다!
						    	</div>
						    	<div class="input-group" id="findinput">
									<span class="input-group-addon" id="basic-addon1"> 
										<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
									</span>
									<input type="email" class="form-control" placeholder="이메일" aria-describedby="basic-addon1" id="findpwdemail" name="email">
								</div>
						    	<div class="input-group" id="findinput">
									<span class="input-group-addon" id="basic-addon1"> 
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
									</span>
									<input type="text" class="form-control" placeholder="이름" aria-describedby="basic-addon1" id="findpwdname" name="name">
								</div>
								<div class="input-group" id="findinput">
									<span class="input-group-addon" id="basic-addon1"> 
										<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
									</span>
									<input type="text" class="form-control" placeholder="전화번호" aria-describedby="basic-addon1" id="findpwdphone" name="phone" oninput="findphonecheck(2);">
									
								</div>
								<div id="findpwdbtn" class="btn-group btn-group-justified" role="group">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-danger" onclick="return findpwd();">비밀번호 찾기</button>
									</div>
								</div>
						    	<!-- /비밀번호 찾기 -->
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$("#findliid").css({"background-color":"#337ab7", "color":"white"});
});

$( window ).resize(function open_chatroom(){
	var windowWidth = $( window ).width();
	if(windowWidth < 375) {
		$("#findidfield").css("font-size","60%");
		$("#findpwdfield").css("font-size","60%");
		$("#findliid").css("font-size", "80%");
		$("#findlipwd").css("font-size", "80%");
	} else if (windowWidth < 425){
		$("#findidfield").css("font-size","90%");
		$("#findpwdfield").css("font-size","90%");
	} else if (windowWidth < 720){
		$("#findidfield").css("font-size","110%");
		$("#findpwdfield").css("font-size","110%");
	} else {
		$("#findidfield").css("font-size","110%");
		$("#findpwdfield").css("font-size","110%");
	}
});

function detectid(){
	$("#login").hide();
	$("#register").hide();
	$("#detectidpwd").show();
	$("#detectidpwd").modal();
}

function selecttab1(){
	$("#findliid").css({"background-color":"#337ab7", "color":"white"});
	$("#findlipwd").css({"background-color":"#fff", "color":"black"});
	$("#find_header").css({ "display": "inline-block", "height": "500px"});
}

function selecttab2(){
	$("#findlipwd").css({"background-color":"#337ab7", "color":"white"});
	$("#findliid").css({"background-color":"#fff", "color":"black"});
	$("#find_header").css({ "display": "inline-block", "height": "470px"});
}

function findid(){
	// ajax로 아이디찾기
	var name = $("#findidname").val();
	var phone = $("#findidphone").val();
	var queryString = { "name": name, "phone": phone };
	$.ajax({
		url : "findid.do",
		data : queryString,
		dataType : "json",
		type : "get",
		success: function(responseData){
			var data = responseData.user.email;
			var value = '';
			console.log(data);
			$("#ajax").remove();
			if(data == null){
				value += "일치하는 이메일이 없습니다.."
				$("#resultfindid").html(value);
				return false;
			} else {
				var substr = data.split('@');
				var sub1 = substr[0];
				var sub2 = substr[1];
				value += "회원님의 이메일은 <br>" + substr[0].substr(0,sub1) + "**@**" + substr[1].substr(2,sub2) + "<br>입니다."; 
				$("#resultfindid").html(value);
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
	        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	    }
	});
}

function findpwd(){
	// 이메일로 보낼거
}

function findphonecheck(data){
	if(data == 1){
		var phone = $("#findidphone").val();	
	} else {
		var phone = $("#findpwdphone").val();
	}
	if(phone.length == 3){
		phone += "-";
		if(data == 1)
			$("#findidphone").val(phone);
		else
			$("#findpwdphone").val(phone);
	}else if(phone.length == 8){
		phone += "-";
		if(data == 1)
			$("#findidphone").val(phone);
		else
			$("#findpwdphone").val(phone);
	} else if (phone.length == 12){
		phone = phone.replace(/\-/g, '');
		phone = phone.substr(0,3) + "-" + phone.substr(3,3) + "-" + phone.substr(6, 4);
		if(data == 1)
			$("#findidphone").val(phone);
		else
			$("#findpwdphone").val(phone);
	} else if (phone.length == 13){
		phone = phone.replace(/\-/g, '');
		phone = phone.substr(0,3) + "-" + phone.substr(3,4) + "-" + phone.substr(7, 4);
		if(data == 1)
			$("#findidphone").val(phone);
		else
			$("#findpwdphone").val(phone);
	}
}
</script>
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
					<form id="formid" style="relative">
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
						<div id="capslockdiv" style="position:fixed; display:none; color: red; z-index: 10;">
							<button style="color: white; background-color: #000; padding-top: 0px; padding-bottom: 0px; font-size: 8pt; height: 24px; width: 115%; margin: 0 auto;" disabled>CapsLock 이(가) 켜져 있습니다.</button>
						</div>
					</form>
					<div id="loginfield" class="btn-group btn-group-justified" role="group">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-primary" id="loginbtn" onclick="logincheck();" disabled>Login</button>
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
							<a href="#" onclick="return detectid();" id="finda">아이디&nbsp;또는&nbsp;비밀번호를<br>잊어버리셨나요?</a>
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
<script type="text/javascript" src="/fitnessground/resources/js/user/login.js"></script>
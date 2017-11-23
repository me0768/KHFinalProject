<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="login">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<img src="/fitnessground/resources/images/큰이미지로고.jpg">
				<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1"> 
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						</span>
						<input type="email" class="form-control" placeholder="abc@iei.co.kr" aria-describedby="basic-addon1" name="email">
					</div>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1"> 
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						</span>
						<input type="password" class="form-control"	placeholder="password" aria-describedby="basic-addon1" name="pwd">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
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

<script type="text/javascript">
	function login() {
		$("#login").show();
		$("#register").hide();
		$("#login").modal();
	}

	function register() {
		$("#login").hide();
		$("#register").show();
		$("#register").modal();
	}
</script>
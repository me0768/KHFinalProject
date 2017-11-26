<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<div class="modal fade bs-example-modal-md" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true" id="detectidpwd">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="height: 200px;">
			<h5>아이디찾기</h5>
		</div>
	</div>
</div>

<script type="text/javascript">
function detectid(){
	$("#login").hide();
	$("#register").hide();
	$("#detectidpwd").show();
	$("#detectidpwd").modal();
}
</script>
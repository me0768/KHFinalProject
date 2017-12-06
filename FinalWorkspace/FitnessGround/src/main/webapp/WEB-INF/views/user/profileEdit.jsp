<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <script type="text/javascript">
	$(function() {
		$('#hiddenFileInput').hide();
		
		$("#hiddenFileInput").on('change', function(){
            readURL(this);
        });
	});
	function inputFile() {
		$('#hiddenFileInput').trigger("click");
		return false;
	}
	function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
                $('#profileEditImg').attr('src', e.target.result);
            }

          reader.readAsDataURL(input.files[0]);
        }
    }
 </script>

<div class="modal fade bs-example-modal-sm" id="profileEdit">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header" id="login_header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>	
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
				<form id="profileImgForm" action="profileImgModify.do" method="post" enctype="multipart/form-data">
					<img id="profileEditImg" src="/fitnessground/resources/images/myimages/nullicon.png" class="img-circle" style="background:#87798f; width:150px; height:150px; margin-top:20px;">
					<div class="modal-body" style="margin-top:20px;">
						<div style="color:black; font-weight:bold; font-size:12pt;"><p style="text-align:center;">프로필 사진 수정</p></div>
	      				<button class="btn btn-default" onclick="return inputFile();">파일업로드</button>
						<input type="file" id="hiddenFileInput" name="original_image">
						<input type="hidden" value="${sessionScope.user.user_no}" name="user_no">
						<input type="hidden" value="${sessionScope.user.email}" name="email">
					</div>
      				<div align="center">
				        <button type="submit" class="btn btn-primary">Save changes</button>
				    </div>
				</form>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	function profileEdit() {
		$("#profileEdit").show();
		$("#login").hide();
		$("#register").hide();
		$("#detectidpwd").hide();
		$("#findidname").val('');
		$("#findidphone").val('');
		$("#profileEdit").modal();
	}
</script>
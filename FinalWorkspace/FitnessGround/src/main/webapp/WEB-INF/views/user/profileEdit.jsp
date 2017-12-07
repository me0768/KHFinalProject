<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	function changeImg(mode) {
		if(mode=="1") {
			$("#profileImgForm").attr("action", "profileImgModify.do").submit();
		}
		else if(mode=="2") {
			$("#profileImgForm").attr("action", "profileImgRemove.do").submit();
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
				<c:if test="${null eq sessionScope.user.rename_image}">
				<img id="profileEditImg" src="/fitnessground/resources/images/myimages/nullicon.png" class="img-circle" style="background:#DAECF3; width:150px; height:150px; margin-top:20px;">
				</c:if>
				<c:if test="${null ne sessionScope.user.rename_image}">
				<img id="profileEditImg" src="/fitnessground/resources/images/myimages/${ sessionScope.user.rename_image }" class="img-circle" style="background:#DAECF3; width:150px; height:150px; margin-top:20px;">
				</c:if>
				<form id="profileImgForm" method="post" enctype="multipart/form-data">
					<div class="modal-body" style="margin-top:30px;">
	      				<button class="btn btn-default" onclick="return inputFile();" style="font-weight:bold; box-shadow: 2px 2px 2px rgba(194, 194, 194, 0.5); width:80%">프로필 사진 선택</button>
						<input type="file" id="hiddenFileInput" name="file">
						<input type="hidden" value="${sessionScope.user.user_no}" name="user_no">
						<input type="hidden" value="${sessionScope.user.email}" name="email">
					</div>
      				<div align="center" style="margin-top:30px;">
      					<button class="btn btn-primary" onclick="changeImg('1');">프로필 사진 변경</button>
      					<button class="btn btn-danger" onclick="changeImg('2');">삭제</button>
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
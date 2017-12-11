<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Modal -->
  <div class="modal fade" id="detailView" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="video_title"></h4>
        </div>
        <div class="modal-body row">
        	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="video_detail"></div>
        	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="video_explain" style="color: black; font-size:13px"></div>      	
        </div>
                
        <div class="modal-footer">
				<div id="replay">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1"> 
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						</span> <input type="email" class="form-control"
							placeholder="내용을 입력해 주세요" aria-describedby="basic-addon1"
							id="reply_content" name="replt_content">
							<button type="button" class="btn btn-default">댓글 달기</button>
					</div>
				</div>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

<script type="text/javascript">
		
	function detailView(v_no){
		$("#detailView").show();
		$("#detailView").modal();
		
		viewVideo(v_no);			
	}
	
	function viewVideo(v_no){
		$.ajax({
			url:"detail.do",
			dataType:"json",
			type:"get",
			data : {"v_no" : v_no},
			success:function(data){
			
			var responseData = data.health;
			var values = "";
			console.log(responseData.content);
			
			values="<iframe width='400' height='400' src="+ responseData.url.replace(/\^/g,"&")
			+"frameborder='0' gesture='media' allow='encrypted-media' allowfullscreen name='iframe'></iframe>"
			
			
			$("#video_title").html(responseData.title.replace(/\+/g," "));
			$("#video_explain").html(responseData.content);
			$("#video_detail").html(values);
				
				
			},
			error: function(request, status, errorData){
				alert("error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
			}
				
		})
	}
</script>

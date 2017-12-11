<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Modal -->
  <div class="modal fade" id="detailView" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">×</span>
          </button>
          <h4 class="modal-title" id="video_title"> </h4>
         
        </div>
           <div class="modal-body">
            <div class="modal-play" id="video_detail"></div>
            <div class="modal-desc">
               <div id="video_explain" style="color: black; font-size:13px">
                  <span id="span-content"></span>
               </div>
               <hr>
               <div id="read_count" style="color:black; font-size:13px"></div>
               
            
               <c:if test="${sessionScope.user !=null }">
                  
                  <div id="video-reply" style="color:black;">
                     <input type="text" id="reply-input" placeholder="댓글을 입력하세요">
                     <button type="submit" id="reply-btn" onsubmit="reply();">댓글달기</button>
                  </div>
               </c:if>
               
               <div id="reply_content"></div>
               
               
            </div>
         </div>
      </div>
    </div>
  </div>
<script type="text/javascript">
      
   function detailView(v_no){   //모달창 띄우는 메서드
      $("#detailView").show();
      $("#detailView").modal();
      
      viewVideo(v_no);         
   }
   
   function viewVideo(v_no){ //클릭한 객체 가져오는 메서드
      $.ajax({
         url:"detail.do",
         dataType:"json",
         type:"get",
         data : {"v_no" : v_no},
         success:function(data){
         
         var responseData = data.health;
         var src= "";
         console.log(responseData.content);
         
         src="<iframe width='600' height='400' src="+ responseData.url.replace(/\^/g,"&")
         +"frameborder='0' gesture='media' allow='encrypted-media' allowfullscreen name='iframe'></iframe>"
         
         
         $("#read_count").html("조회수  : " + responseData.readcount);
         $("#video_title").html(responseData.title.replace(/\+/g," "));
         $("#video_explain").html(responseData.content);
         $("#video_detail").html(src);
            
            
         },
         error: function(request, status, errorData){
            alert("error code : " + request.status + "\n"
                  + "message : " + request.responseText + "\n"
                  + "error : " + errorData);
         }
            
      })
   }   
 
</script>
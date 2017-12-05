<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="common/head.jsp" />

<style type="text/css">
</style>

<c:import url="common/headend.jsp" />
<c:import url="common/nav.jsp" />

<!-- Body부분  -->

<input type="text" placeholder="playlistId입력">


 <!-- YoutubeAPI, Ajax 관리자 INSERT  -->
   <script type="text/javascript">
       var playlist1; //관리자가 입력한playlistId//테스트성공하면 admin input태그 넣어 화면만들기
       var vTitle;
       var vDesc;
       var vId;
      var job = new Object();
       var jarr = [];   
       /* job.title = "먕"; 
       job.url = "eraefjdklf";
       jarr.push(job); */
       /* var job = new Object();
         */
       var j;
        $(document).ready(function(){
           $.get(
                  "https://www.googleapis.com/youtube/v3/playlistItems", {
                      part: 'snippet',
                      maxResults: 50,
                      playlistId: playlist1,
                      key: 'AIzaSyACiHNLQp0NoZLhAx6u2JbtMGjCp3STK3A'},
                      function(data){
                          
                          $.each(data.items, function(i, item){
                             vTitle = item.snippet.title.replace(/&/gi, "+");
                              vDesc = item.snippet.description.replace(/&/gi, "+");
                              vId = item.snippet.resourceId.videoId;
                              //하나가 아니라서 json array에 담고 그걸 다시 json객체에 담아서 컨트롤러에 보내야.....
                               var job = new Object(); 
                               job.title = vTitle;
                               /* job.content = vDesc; */
                               job.url = vId;
                               jarr.push(job);
                            
                           });
                          console.log(JSON.stringify(jarr));
                      }
                      );
       
        });
        
       window.onload = function ajaxFunction(){
        /*Controller로 넘기기 */
        console.log("ajaxFunction실행");
        $.ajax({
           url : "yinsert.do",
           data: JSON.stringify(jarr),
           type: "post",
           contentType : "application/json; charset=utf-8",
           success : function(result){
              console.log("전송성공:");
           },
           error : function(request, status, errorData){
              alert("error code : " + request.status + "\n"
                    + "message : " + request.responseText
                    + "\n" + "error : " + errorData);
           }
        });
        }
    
    
    </script>



 <!-- Bootstrap core JavaScript-->
    <script src="/fitnessground/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="/fitnessground/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/fitnessground/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="/fitnessground/resources/admin/vendor/chart.js/Chart.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/fitnessground/resources/admin/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="/fitnessground/resources/admin/js/sb-admin-charts.min.js"></script>
  </div>
</body>
</html>
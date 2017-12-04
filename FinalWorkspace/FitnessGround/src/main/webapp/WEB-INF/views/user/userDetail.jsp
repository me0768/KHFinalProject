<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />
    <c:import url="../include/common/headend.jsp" />
    
  <!--   <script type="text/javascript">
	    $(function (){
	    	$( window ).resize(function open_chatroom(){
	    		var windowWidth = $( window ).width();
	    		if(windowWidth < 1200) {
	    	        $('#userInfoModify').css("margin-top","10px");
	    	        /* $('#userDetailContent span').removeClass('btn-lg'); */
	    		} else {
	    			$('#userInfoModify').css("margin-top","50px;");
	    	        /* $('#userDetailContent span').addClass('btn-lg'); */
	    		}
	    	});
	    });
	</script> -->
	<script type="text/javascript">
		function pwdCk(){
			var result = false;
			var pwd = $('input[name="userpwd"]').val();
			var user_no = $('input[name="user_no"]').val();
			$.ajax({
				url : "pwdCk.do",
				dataType : "json",
				type : "post",
				data : {"pwd":pwd, "user_no":user_no}, 
				success : function(data){
					if(data.result == 1){
						 if(confirm("회원 정보를 수정하시겠습니까?")){
							 $.ajax({async : true, 
								 	type : "post",
								 	url : "uupdate.do",
								 	dataType : "json",
								 	data: $("#userDetailContentForm").serialize(),
								 	success : function(result){
								 		location.href="mypage.do?userno="+user_no;
								 	},
								 	error: function(request,status,error){
								 		alert("error code : " + request.status + "\n"
												+ "message : " + request.responseText + "\n"
												+ "error : " + errorData);
								 	}
							});
						 }
					}
					else {
						alert("비밀번호를 확인해주세요.");
						result = false;
					}
				}
			});
			return result;
		}
	</script>

    <c:if test="${ sessionScope.user == null }">
		<script type="text/javascript">
			$(function (){
				alert("로그인이 필요합니다.");
				location.href="main.do";
			});
		</script>
	</c:if>
	
    <c:if test="${ sessionScope.user != null }">    
	<div id="page-wrapper">
		<!-- Header -->
		<div id="mypage_header">
            <!-- Nav -->
			<c:import url="../include/main/nav.jsp" />			
			<c:import url="login.jsp"/>
			<c:import url="findidpwd.jsp"/>
			<c:import url="register.jsp"/>
		</div>
    </div>
    
    <div id="myPageBar">
		<c:import url="../include/user/myPageBar.jsp"/>
	</div>
	
    <div class="col-md-6 col-md-offset-3 col-sm-12 hidden-xs hidden-sm hidden-md visible-lg" id="userDetailTitle">
    	<div class="col-md-1"><img src="/fitnessground/resources/images/myimages/nullicon.png" class="img-rounded"></div>
    	<div class="col-md-9 col-md-offset-1" id="userDetailTitleInfo"><h1>${sessionScope.user.name}님의 회원정보</h1>정보 변경 시, 비밀번호를 입력하신 후 하단의 수정 버튼을 눌러주세요.</div>
    </div>
    <div class="col-md-6 col-md-offset-3 col-sm-12 visible-xs visible-sm visible-md hidden-lg" id="userDetailTitle">
    	<h1 id="smallH">${sessionScope.user.name}님의 회원정보</h1>
    	<p id="smallP">비밀번호를 입력하신 후 하단의 수정 버튼을 눌러주세요.</p>
    </div>
    
    <form id="userDetailContentForm" action="" method="post" class="hidden-xs hidden-sm hidden-md visible-lg"><div class="col-md-6 col-md-offset-3 col-sm-12">
    	<input type="hidden" value="${sessionScope.user.user_no}" name="user_no">
    	<div  id="userDetailContent"><table>
    		<tr>
    			<td><span class="btn-lg glyphicon glyphicon-envelope" aria-hidden="true"> E-mail</span></td>
    			<td><input type="email" value="${sessionScope.user.email}" name="email" class="form-control" readonly></td>
    		</tr>
    		<tr>
    			<td><span class="btn-lg glyphicon glyphicon-pencil" aria-hidden="true"> 비밀번호</span></td>
    			<td><input type="password" name="userpwd" value="" class="form-control"></td>
    		</tr>
    		<tr>
    			<td><span class="btn-lg glyphicon glyphicon-user" aria-hidden="true"> 이름</span></td>
    			<td><input type="text" value="${sessionScope.user.name}" name="name" class="form-control"></td>
    		</tr>
    		<tr>
    			<td><span class="btn-lg glyphicon glyphicon-star" aria-hidden="true"> 닉네임</span></td>
    			<td><input type="text" value="${sessionScope.user.nickname}" name="nickname" class="form-control"></td>
    		</tr>
    		<tr>
    			<td><span class="btn-lg glyphicon glyphicon-phone" aria-hidden="true"> 전화번호</span></td>
    			<td><input type="tel" value="${sessionScope.user.phone}" name="phone" class="form-control"></td>
    		</tr>
    	</table></div>
    	<div align="right" id="userInfoModify"><button type="submit" class="btn btn-default" onclick="return pwdCk();">수정</button></div>
    </div></form>
    <form id="userDetailContentForm" action="" method="post" class="visible-xs visible-sm visible-md hidden-lg"><div class="col-md-6 col-md-offset-3 col-sm-12">
    	<input type="hidden" value="${sessionScope.user.user_no}" name="user_no">
    	<div  id="userDetailContentSmall"><table>
    		<tr><td><span class="btn-lg glyphicon glyphicon-envelope" aria-hidden="true"> E-mail</span></td></tr>
    		<tr><td><input type="email" value="${sessionScope.user.email}" name="email" class="form-control"></td></tr>
    		<tr><td><span class="btn-lg glyphicon glyphicon-pencil" aria-hidden="true"> 비밀번호</span></td></tr>
    		<tr><td><input type="password" name="userpwd" value="" class="form-control"></td></tr>
    		<tr><td><span class="btn-lg glyphicon glyphicon-user" aria-hidden="true"> 이름</span></td></tr>
    		<tr><td><input type="text" value="${sessionScope.user.name}" name="name" class="form-control"></td></tr>
    		<tr><td><span class="btn-lg glyphicon glyphicon-star" aria-hidden="true"> 닉네임</span></td>
    		<tr><td><input type="text" value="${sessionScope.user.nickname}" name="nickname" class="form-control"></td></tr>
    		<tr><td><span class="btn-lg glyphicon glyphicon-phone" aria-hidden="true"> 전화번호</span></td></tr>
    		<tr><td><input type="tel" value="${sessionScope.user.phone}" name="phone" class="form-control"></td></tr>
    	</table></div>
    	<div align="right" id="userInfoModifySmall"><button type="submit" class="btn btn-default" onclick="return pwdCk();">수정</button></div>
    </div></form>    
    </c:if>
    
    <c:import url="../include/main/footer.jsp" />
    <c:import url="../include/common/end.jsp" />
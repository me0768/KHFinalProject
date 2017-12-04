<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />
    <c:import url="../include/common/headend.jsp" />
	<script type="text/javascript">
		function pwdCheck(){
			var pwd1 = $("input[name='userpwd']").val();
			var pwd2 = $("input[name='userpwdck']").val();
			var value = '';
			 if(pwd1 != pwd2){
				 $("input[name='userpwd']").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
				 $("input[name='userpwdck']").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
				value = "<div style='color:red; text-align:right; font-size:10pt;'> * 비밀번호가 서로 다릅니다. </div>";
				$("#userpwdfield").html(value);
			}
			else if ( pwd1 == '' && pwd2 == ''){
				 $("input[name='userpwd']").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
				 $("input[name='userpwdck']").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
				value = "<div style='color:red; text-align:right; font-size:10pt;'> * 새 비밀번호를 입력하세요. </div>";
				$("#userpwdfield").html(value);
			}  else {
				 $("input[name='userpwd']").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
				 $("input[name='userpwdck']").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
				value = "<div style='color:green; text-align:right; font-size:10pt;'> * 비밀번호가 일치합니다. </div>";
				$("#userpwdfield").html(value);
				pwdval = 1;
				onregisterbtn();
			}
		}
		function pwdCk(){
			var result = false;
			var pwd = $('input[name="userpwd"]').val();
			var pwd2 = $("input[name='userpwdck']").val();
			var user_no = $('input[name="user_no"]').val();
			if(pwd!=pwd2) {
				pwdCheck();
			} else {
			$.ajax({
				url : "pwdCk.do",
				dataType : "json",
				type : "post",
				data : {"pwd":pwd, "user_no":user_no}, 
				success : function(data){
					if(data.result == 1){
						 if(confirm("탈퇴 하시겠습니까?")){
							 $.ajax({
								 	type : "post",
								 	url : "userdelete.do",
								 	dataType : "json",
								 	data: {"user_no":user_no},
								 	success : function(result){
								 		alert("탈퇴되었습니다.")
								 		location.href="main.do";
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
			}
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
    	<div class="col-md-9 col-md-offset-1" id="userDetailTitleInfo"><h1>회원 탈퇴</h1>탈퇴하시려면 비밀번호를 입력하신 후, 탈퇴 버튼을 눌러주세요.</div>
    </div>
    <div class="col-md-6 col-md-offset-3 col-sm-12 visible-xs visible-sm visible-md hidden-lg" id="userDetailTitle">
    	<h1 id="smallH">회원 탈퇴</h1>
    	<p id="smallP">탈퇴하시려면 비밀번호를 입력하신 후, 탈퇴 버튼을 눌러주세요.</p>
    </div>
   
   <form id="userPwdContentForm" action="" method="post" class="hidden-xs hidden-sm hidden-md visible-lg"><div class="col-md-6 col-md-offset-3 col-sm-12">
    	<input type="hidden" value="${sessionScope.user.user_no}" name="user_no">
    	<div  id="userPwdContent"><table>
    		<tr>
    			<td colspan="2">
    				<div id="deleteInfo">
    					<h1>탈퇴시 유의사항</h1>
    					<p>
    					회원 탈퇴시, 회원 정보 및 이용 기록이 모두 삭제되며 삭제된 데이터는 복구할 수 없습니다.<br>
    					또한 탈퇴 후, 7일 동안 재가입이 불가합니다.<br>
    					작성하신 게시글은 자동으로 삭제되지않으며 삭제를 원할 시,<br>회원 탈퇴를 하기 전에 모든 게시글을 삭제해주시기바랍니다.
    					</p>
    				</div>
    			</td>
    		</tr>
    		<tr>
    			<td>비밀번호</td>
    			<td><input type="password" name="userpwd" class="form-control" oninput="pwdCheck();"></td>
    		</tr>
    		<tr>
    			<td>비밀번호 확인</td>
    			<td><input type="password" name="userpwdck" class="form-control" oninput="pwdCheck();"></td>
    		</tr>
    		<tr>
    			<td colspan="2" id="userpwdfield">
    				<div style="color:red; text-align:right; font-size:10pt;">
					* 비밀번호를 입력하세요.
					</div>
    			</td>
    		</tr>
    	</table></div>
    	<div align="right" id="userPwdModify"><button type="submit" class="btn btn-default"  onclick="return pwdCk();">탈퇴</button></div>
    </div></form>
    <form id="usePwdContentForm" action="" method="post" class="visible-xs visible-sm visible-md hidden-lg"><div class="col-md-6 col-md-offset-3 col-sm-12">
    	<input type="hidden" value="${sessionScope.user.user_no}" name="user_no">
    	<div  id="userPwdContentSmall">
    	<div class="col-sm-12" id="deleteInfoSm">
    		<h1>탈퇴시 유의사항</h1>
   			<p>
   			회원 탈퇴시, 회원 정보 및 이용 기록이 모두 삭제되며 삭제된 데이터는 복구할 수 없습니다.<br>
    		또한 탈퇴 후, 7일 동안 재가입이 불가합니다.<br>
   			작성하신 게시글은 자동으로 삭제되지않으며 삭제를 원할 시, 회원 탈퇴를 하기 전에 모든 게시글을 삭제해주시기바랍니다.
   			</p>
   		</div>
    	<table>
    		<tr>
    			<td>비밀번호</td>
    			<td align="right"><input type="password" name="userpwd" class="form-control" oninput="pwdCheck();"></td>
    		</tr>
    		<tr>
    			<td>비밀번호 확인</td>
    			<td align="right"><input type="password" name="userpwdck" class="form-control" oninput="pwdCheck();"></td>
    		</tr>
    		<tr>
    			<td colspan="2" id="userpwdfield">
    				<div style="color:red; text-align:right; font-size:10pt;">
					* 비밀번호를 입력하세요.
					</div>
    			</td>
    		</tr>
    	</table></div>
    	<div align="right" id="userPwdSmall"><button type="submit" class="btn btn-default"  onclick="return pwdCk();">탈퇴</button></div>
    </div></form>	
    </c:if>
    
    <c:import url="../include/main/footer.jsp" />
    <c:import url="../include/common/end.jsp" />
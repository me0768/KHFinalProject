<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />
    <c:import url="../include/common/headend.jsp" />
	<script type="text/javascript">
		$(function(){
			$('#myPageBar nav ul #uPwd').addClass('activeMenu');	
		});
	
		function newPwdCheck(){
			var pwd1 = $("input[name='newpwd']").val();
			var pwd2 = $("input[name='newpwdck']").val();
			var value = '';
			 if(pwd1 != pwd2){
				 $("input[name='newpwd']").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
				 $("input[name='newpwdck']").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
				value = "<div style='color:red; text-align:right; font-size:10pt;'> * 비밀번호가 서로 다릅니다. </div>";
				$("#newPwdfield").html(value);
			}
			else if ( pwd1 == '' && pwd2 == ''){
				 $("input[name='newpwd']").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
				 $("input[name='newpwdck']").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
				value = "<div style='color:red; text-align:right; font-size:10pt;'> * 새 비밀번호를 입력하세요. </div>";
				$("#newPwdfield").html(value);
			}  else {
				 $("input[name='newpwd']").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
				 $("input[name='newpwdck']").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
				value = "<div style='color:green; text-align:right; font-size:10pt;'> * 비밀번호가 일치합니다. </div>";
				$("#newPwdfield").html(value);
				pwdval = 1;
			}
		}
		function pwdCk(){
			var result = false;
			var pwd = $('input[name="originpwd"]').val();
			var user_no = $('input[name="user_no"]').val();
			var newpwd = $('input[name="newpwd"]').val();
			var newpwd2 = $("input[name='newpwdck']").val();
			if(newpwd!=newpwd2) {
				newPwdCheck();
			} else {
			$.ajax({
				url : "pwdCk.do",
				dataType : "json",
				type : "post",
				data : {"pwd":pwd, "user_no":user_no}, 
				success : function(data){
					if(data.result == 1){
						 if(confirm("비밀번호를 수정하시겠습니까?")){
							 $.ajax({
								 	type : "post",
								 	url : "upwdupdate.do",
								 	dataType : "json",
								 	data: {"pwd":newpwd, "user_no":user_no},
								 	success : function(result){
								 		alert("비밀번호가 수정되었습니다.\n다시 로그인해주세요.")
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
						alert("기존 비밀번호를 확인해주세요.");
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
    
    <div class="col-md-6 col-md-offset-3 col-sm-12 hidden-xs hidden-sm hidden-md visible-lg" id="userPwdMTitle">
    	<div class="col-md-1"><img src="/fitnessground/resources/images/myimages/passwordicon.png" class="img-rounded"></div>
    	<div class="col-md-9 col-md-offset-1" id="userPwdTitleInfo"><h1>비밀번호 변경</h1>현재 비밀번호와 변경할 비밀번호를 입력하신 후, 확인 버튼을 눌러주세요.</div>
    </div>
    <div class="col-md-6 col-md-offset-3 col-sm-12 visible-xs visible-sm visible-md hidden-lg" id="userPwdMTitle">
    	<h1 id="smallH">비밀번호 변경</h1>
    	<p id="smallP">현재 비밀번호와 변경할 비밀번호를 입력하신 후,<br>확인 버튼을 눌러주세요.</p>
    </div>
    
    <form id="userPwdContentForm" action="" method="post" class="hidden-xs hidden-sm hidden-md visible-lg"><div class="col-md-6 col-md-offset-3 col-sm-12">
    	<input type="hidden" value="${sessionScope.user.user_no}" name="user_no">
    	<div  id="userPwdContent"><table>
    		<tr>
    			<td>현재 비밀번호</td>
    			<td><input type="password" name="originpwd" class="form-control"></td>
    		</tr>
    		<tr><td></td></tr>
    		<tr>
    			<td>새 비밀번호</td>
    			<td><input type="password" name="newpwd" class="form-control" oninput="newPwdCheck();"></td>
    		</tr>
    		<tr>
    			<td>새 비밀번호 확인</td>
    			<td><input type="password" name="newpwdck" class="form-control" oninput="newPwdCheck();"></td>
    		</tr>
    		<tr>
    			<td colspan="2" id="newPwdfield">
    				<div style="color:red; text-align:right; font-size:10pt;">
					* 새 비밀번호를 입력하세요.
					</div>
    			</td>
    		</tr>
    	</table></div>
    	<div align="right" id="userPwdModify"><button type="submit" class="btn btn-default" onclick="return pwdCk();">수정</button></div>
    </div></form>
    <form id="usePwdContentForm" action="" method="post" class="visible-xs visible-sm visible-md hidden-lg"><div class="col-md-6 col-md-offset-3 col-sm-12">
    	<input type="hidden" value="${sessionScope.user.user_no}" name="user_no">
    	<div  id="userPwdContentSmall"><table>
    		<tr>
    			<td>현재 비밀번호</td>
    			<td align="right"><input type="password" name="originpwd" class="form-control"></td>
    		</tr>
    		<tr><td>&nbsp;</td></tr>
    		<tr>
    			<td>새 비밀번호</td>
    			<td align="right"><input type="password" name="newpwd" class="form-control" oninput="newPwdCheck();"></td>
    		</tr>
    		<tr>
    			<td>새 비밀번호 확인</td>
    			<td align="right"><input type="password" name="newpwdck" class="form-control" oninput="newPwdCheck();"></td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<div style="color:red; text-align:right; font-size:10pt;">
					* 새 비밀번호를 입력하세요.
					</div>
    			</td>
    		</tr>
    	</table></div>
    	<div align="right" id="userPwdSmall"><button type="submit" class="btn btn-default" onclick="return pwdCk();">수정</button></div>
    </div></form>    
    </c:if>
    
    <c:import url="../include/main/footer.jsp" />
    <c:import url="../include/common/end.jsp" />
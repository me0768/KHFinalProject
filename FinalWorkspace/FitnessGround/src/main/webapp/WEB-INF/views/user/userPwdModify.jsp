<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />
    <c:import url="../include/common/headend.jsp" />

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
    	<div  id="userPwdContent"><table>
    		<tr>
    			<td>현재 비밀번호</td>
    			<td><input type="password" name="pwd" class="form-control"></td>
    		</tr>
    		<tr>
    			<td>새 비밀번호</td>
    			<td><input type="password" name="newpwd" class="form-control"></td>
    		</tr>
    		<tr>
    			<td>새 비밀번호 확인</td>
    			<td><input type="password" name="newpwdck" class="form-control"></td>
    		</tr>
    	</table></div>
    	<div align="right" id="userPwdModify"><button type="submit" class="btn btn-default" onclick="location.href=''">수정</button></div>
    </div></form>
    <form id="usePwdContentForm" action="" method="post" class="visible-xs visible-sm visible-md hidden-lg"><div class="col-md-6 col-md-offset-3 col-sm-12">
    	<div  id="userPwdContentSmall"><table>
    		<tr>
    			<td>현재 비밀번호</td>
    			<td align="right"><input type="password" name="pwd" class="form-control"></td>
    		</tr>
    		<tr>
    			<td>새 비밀번호</td>
    			<td align="right"><input type="password" name="newpwd" class="form-control"></td>
    		</tr>
    		<tr>
    			<td>새 비밀번호 확인</td>
    			<td align="right"><input type="password" name="newpwdck" class="form-control"></td>
    		</tr>
    	</table></div>
    	<div align="right" id="userPwdSmall"><button type="submit" class="btn btn-default" onclick="location.href=''">확인</button></div>
    </div></form>    
    </c:if>
    
    <c:import url="../include/main/footer.jsp" />
    <c:import url="../include/common/end.jsp" />
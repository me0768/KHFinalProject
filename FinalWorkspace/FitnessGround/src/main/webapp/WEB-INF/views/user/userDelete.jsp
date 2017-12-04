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
    
   <div class="col-md-6 col-md-offset-3 col-sm-12 hidden-xs hidden-sm hidden-md visible-lg" id="userDetailTitle">
    	<div class="col-md-1"><img src="/fitnessground/resources/images/myimages/nullicon.png" class="img-rounded"></div>
    	<div class="col-md-9 col-md-offset-1" id="userDetailTitleInfo"><h1>회원 탈퇴</h1>탈퇴하시려면 비밀번호를 입력하신 후, 탈퇴 버튼을 눌러주세요.</div>
    </div>
    <div class="col-md-6 col-md-offset-3 col-sm-12 visible-xs visible-sm visible-md hidden-lg" id="userDetailTitle">
    	<h1 id="smallH">회원 탈퇴</h1>
    	<p id="smallP">탈퇴하시려면 비밀번호를 입력하신 후, 탈퇴 버튼을 눌러주세요.</p>
    </div>
   
   <form id="userPwdContentForm" action="" method="post" class="hidden-xs hidden-sm hidden-md visible-lg"><div class="col-md-6 col-md-offset-3 col-sm-12">
    	<div  id="userPwdContent"><table>
    		<tr>
    			<td colspan="2">
    				<div id="deleteInfo">
    					<h1>탈퇴시 유의사항</h1>
    					<p>
    					회원 탈퇴시, 회원 정보 및 이용 기록이 모두 삭제되며<br>삭제된 데이터는 복구할 수 없습니다.<br>
    					커뮤니티 게시글은 자동으로 삭제되지않으며 삭제를 원할 시,<br>회원 탈퇴를 하기 전에 모든 게시글을 삭제해주시기바랍니다.
    					</p>
    				</div>
    			</td>
    		</tr>
    		<tr>
    			<td>비밀번호</td>
    			<td><input type="password" name="pwd" class="form-control"></td>
    		</tr>
    		<tr>
    			<td>비밀번호 확인</td>
    			<td><input type="password" name="pwdck" class="form-control"></td>
    		</tr>
    	</table></div>
    	<div align="right" id="userPwdModify"><button type="submit" class="btn btn-default" onclick="location.href=''">탈퇴</button></div>
    </div></form>
    <form id="usePwdContentForm" action="" method="post" class="visible-xs visible-sm visible-md hidden-lg"><div class="col-md-6 col-md-offset-3 col-sm-12">
    	<div  id="userPwdContentSmall">
    	<div class="col-sm-12" id="deleteInfoSm">
    		<h1>탈퇴시 유의사항</h1>
   			<p>
   			회원 탈퇴시, 회원 정보 및 이용 기록이 모두 삭제되며 삭제된 데이터는 복구할 수 없습니다.<br>
   			커뮤니티 게시글은 자동으로 삭제되지않으며 삭제를 원할 시, 회원 탈퇴를 하기 전에 모든 게시글을 삭제해주시기바랍니다.
   			</p>
   		</div>
    	<table>
    		<tr>
    			<td>비밀번호</td>
    			<td align="right"><input type="password" name="pwd" class="form-control"></td>
    		</tr>
    		<tr>
    			<td>비밀번호 확인</td>
    			<td align="right"><input type="password" name="pwdck" class="form-control"></td>
    		</tr>
    	</table></div>
    	<div align="right" id="userPwdSmall"><button type="submit" class="btn btn-default" onclick="location.href=''">탈퇴</button></div>
    </div></form>	
    </c:if>
    
    <c:import url="../include/main/footer.jsp" />
    <c:import url="../include/common/end.jsp" />
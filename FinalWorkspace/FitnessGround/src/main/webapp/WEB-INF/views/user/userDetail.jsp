<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />
	
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />
	
    <c:import url="../include/common/headend.jsp" />
    
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
    
    <div class="col-md-6 col-md-offset-3 col-sm-12" id="userDetailTitle">
    	<h1>${sessionScope.user.name}님의 회원정보</h1>
    	<p>정보 변경 시, 비밀번호를 입력하신 후 하단의 수정 버튼을 눌러주세요.</p>
    </div>
    
    <div class="col-md-6 col-md-offset-3 col-sm-12" id="userDetailContent">
    	<form>
    	<div><table>
    		<tr>
    			<td><span class="btn-lg glyphicon glyphicon-envelope" aria-hidden="true"> E-mail</span></td>
    			<td><input type="email" value="${sessionScope.user.email}" name="email" class="form-control"></td>
    		</tr>
    		<tr>
    			<td><span class="btn-lg glyphicon glyphicon-pencil" aria-hidden="true"> 비밀번호</span></td>
    			<td><input type="password" name="email" class="form-control"></td>
    		</tr>
    		<tr>
    			<td><span class="btn-lg glyphicon glyphicon-user" aria-hidden="true"> 이름</span></td>
    			<td><input type="text" value="${sessionScope.user.name}" name="email" class="form-control"></td>
    		</tr>
    		<tr>
    			<td><span class="btn-lg glyphicon glyphicon-star" aria-hidden="true"> 닉네임</span></td>
    			<td><input type="text" value="${sessionScope.user.nickname}" name="email" class="form-control"></td>
    		</tr>
    		<tr>
    			<td><span class="btn-lg glyphicon glyphicon-phone" aria-hidden="true"> 전화번호</span></td>
    			<td><input type="tel" value="${sessionScope.user.phone}" name="email" class="form-control"></td>
    		</tr>
    	</table></div>
    	<div align="right"><button class="btn btn-default" onclick="location.href=''">수정</button></div>
    	</form>
    </div>
    
    <c:import url="../include/main/footer.jsp" />

    <c:import url="../include/common/end.jsp" />
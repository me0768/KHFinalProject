<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="../include/common/head.jsp" />
<link rel="stylesheet" href="/fitnessground/resources/css/gym/gymQnA.css" />	
<c:import url="../include/common/headend.jsp" />
<!-- <script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script> -->

<c:if test="${ sessionScope.user == null }">
	<script type="text/javascript">
			$(function (){
				alert("로그인이 필요합니다.");
				location.href="main.do";
			});
		</script>
</c:if>

<div id="page-wrapper">
	<!-- Header -->
	<div id="mypage_header">
        <!-- Nav -->
		<c:import url="../include/main/nav.jsp" />
	<c:import url="../user/login.jsp"/>
	<c:import url="../user/findidpwd.jsp"/>
	<c:import url="../user/register.jsp"/>
	</div>
</div>

<div class="col-md-offset-2 col-md-8 hidden-xs hidden-sm hidden-md visible-lg" id="gymQTitle">
	<c:if test="${gymName eq null}">
	관리자에 문의
	</c:if>
	<c:if test="${gymName ne null}">
	${gymName}에 문의
	</c:if>
</div>
<div class="col-md-offset-2 col-md-8 hidden-xs hidden-sm hidden-md visible-lg" id="gymQContent">
	<form action="gymQnAInsert.do" id="gymQnAForm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="sender" value="${sessionScope.user.user_no}">
	<c:if test="${gymNo ne null}">
	<input type="hidden" name="receiver" value="${gymNo}">
	</c:if>
	<c:if test="${gymNo eq null}">
	<input type="hidden" name="receiver" value="1">
	<input type="hidden" name="mode" value="1">
	</c:if>
	<table>
		<tr>
			<th>제목</th>
			<td colspan="2" style="padding-bottom:60px;"><input class="form-control" name="title"></td>
		</tr>
		<tr>
			<th></th>
			<td colspan="2"><textarea rows="15" class="form-control" id="editor1" name="content" onkeyup="ckWordLen(this, 1500)"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" id="textCount" style="padding-bottom:40px;">0/1500</td>
		</tr>
	</table>
	<!-- <script>
		CKEDITOR.replace('editor1');
	</script> -->
	<table id="fileDiv">
		<tr>
			<th>첨부파일</th>
			<td><input type="file" class="form-control" id="file" name="file_0" style='width:100%'></td>
			<td align='right'></td>
		</tr>
	</table>
	<table>
		<tr>
			<th></th>
			<td colspan="2" style="padding-bottom:70px;"><a href="#this" class="btn btn-default" id="addFile">파일 추가</a></td>
		</tr>
		<tr><td id="insertBt" colspan="3" align="right"><button class="btn btn-primary" onclick="gymQnAInsert();">등록</button></td></tr>
	</table>
	</form>
</div>

<!-- 모바일 -->
<div class="col-sm-12 visible-xs visible-sm visible-md hidden-lg" id="gymQTitleSm">${gymName}에 문의</div>
<div class="col-sm-12 visible-xs visible-sm visible-md hidden-lg" id="gymQContentSm">
	<form action="gymQnAInsert.do" id="gymQnAForm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="sender" value="${sessionScope.user.user_no}">
	<input type="hidden" name="receiver" value="${gymNo}">
	<table>
		<tr><th colspan="2" >제목</th></tr>
		<tr><td colspan="2" style="padding-bottom:25px;"><input class="form-control" name="title"></td></tr>
		<tr><th colspan="2" >내용</th></tr>
		<tr><td colspan="2" ><textarea rows="15" class="form-control" name="content" onkeyup="ckWordLen(this, 1500)"></textarea></td></tr>
		<tr><td colspan="2" id="textCount" style="padding-bottom:20px;">0/1500</td></tr>
		<tr><th colspan="2" >첨부파일</th></tr>
	</table>
	<table id="fileDivSm">
		<tr>
			<td><input type="file" class="form-control" id="file" name="file_0" style='width:100%'></td>
			<td align='right'></td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="2" style="padding-bottom:50px;"><a href="#this" class="btn btn-default" id="addFileSm">파일 추가</a></td>
		</tr>
		<tr><td id="insertBt" colspan="2"><button class="btn btn-primary" style="width:100%;" onclick="gymQnAInsert();">등록</button></td></tr>
	</table>
	</form>
</div>

<script type="text/javascript" src="/fitnessground/resources/js/gym/gymQnA.js"></script>
<c:import url="../include/main/footer.jsp" />
<c:import url="../include/common/end.jsp" />
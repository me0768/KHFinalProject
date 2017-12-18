<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="../include/common/head.jsp" />
<link rel="stylesheet" href="/fitnessground/resources/css/gym/gymQnA.css" />	
<c:import url="../include/common/headend.jsp" />

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

<div class="col-md-offset-2 col-md-8 hidden-xs hidden-sm hidden-md visible-lg" id="gymQDetailTitle">${board.title}</div>
<div class="col-md-offset-2 col-md-8 hidden-xs hidden-sm hidden-md visible-lg" id="gymQDetailContent">
	<c:if test="${board.gym_name eq null}">
		<div>문의자 &nbsp; ${board.name} &nbsp; · &nbsp; 관리자 &nbsp; · &nbsp; ${board.write_date}</div>
	</c:if>
	<c:if test="${board.gym_name ne null}">
		<div>문의자 &nbsp; ${board.name} &nbsp; · &nbsp; 헬스장 &nbsp; ${board.gym_name} &nbsp; · &nbsp; ${board.write_date}</div>
	</c:if>
	<div id="boardContent">${board.content}</div>
	<table>
		<tr id="file"><th style="width:100px; font-weight:bold;">첨부파일</th>
		<c:choose>
		<c:when test="${!empty originalFileNames}">
				<td>
				<c:forEach var="originalFileName" items="${originalFileNames}" varStatus="st">
					<a href="gymQnAFDown.do?bnum=${board.q_no}&filename=${originalFileName}" name="file">${originalFileName}</a>
					<c:if test="${st.index ne no-1}">,&nbsp; &nbsp; &nbsp;</c:if>
				</c:forEach>
				</td>
		</c:when>
		<c:otherwise>
				<td>없음</td>
		</c:otherwise>
		</c:choose>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<c:if test="${sessionScope.user.user_no eq board.sender}">
				<button class="btn btn-danger" onclick="location.href='gymQnADel.do?q_no=${board.q_no}&userno=${sessionScope.user.user_no}'">삭제</button>
				<button class="btn btn-primary" onclick="location.href='gymQnAUpAndAnswerView.do?q_no=${board.q_no}&mode=1'">수정</button>
			</c:if>
			<c:if test="${sessionScope.user.user_no eq board.receiver}">
			<c:if test="${board.response_state eq 0}">
				<button class="btn btn-default" onclick="location.href='gymQnAUpAndAnswerView.do?q_no=${board.q_no}&mode=2'">답변</button>
			</c:if></c:if>
			</td>
		</tr>
	</table>
</div>

<!-- 모바일 -->
<div class="col-sm-12 visible-xs visible-sm visible-md hidden-lg" id="gymQDetailTitleSm">${board.title}</div>
<div class="col-sm-12 visible-xs visible-sm visible-md hidden-lg" id="gymQDetailContentSm">
	<c:if test="${board.gym_name eq null}">
		<div>문의자 &nbsp; ${board.name} &nbsp; · &nbsp; 관리자 </div>
		<div>작성일 &nbsp; ${board.write_date}</div>
	</c:if>
	<c:if test="${board.gym_name ne null}">
		<div>문의자 &nbsp; ${board.name} &nbsp; · &nbsp; 헬스장 &nbsp; ${board.gym_name}</div>
		<div>작성일 &nbsp; ${board.write_date}</div>
	</c:if>
	<div id="boardContent">${board.content}</div>
	<table>
		<tr id="file"><th style="width:100px; font-weight:bold;">첨부파일</th>
		<c:choose>
		<c:when test="${!empty originalFileNames}">
				<td>
				<c:forEach var="originalFileName" items="${originalFileNames}" varStatus="st">
					<a href="gymQnAFDown.do?bnum=${board.q_no}&filename=${originalFileName}" name="file">${originalFileName}</a>
					<c:if test="${st.index ne no-1}">,&nbsp; &nbsp; &nbsp;</c:if>
				</c:forEach>
				</td>
		</c:when>
		<c:otherwise>
				<td>없음</td>
		</c:otherwise>
		</c:choose>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<c:if test="${sessionScope.user.user_no eq board.sender}">
				<button class="btn btn-danger" onclick="location.href='gymQnADel.do?q_no=${board.q_no}&userno=${sessionScope.user.user_no}'">삭제</button>
				<button class="btn btn-primary" onclick="location.href='gymQnAUpAndAnswerView.do?q_no=${board.q_no}&mode=1'">수정</button>
			</c:if>
			<c:if test="${sessionScope.user.user_no eq board.receiver}">
			<c:if test="${board.response_state eq 0}">
				<button class="btn btn-default" onclick="location.href='gymQnAUpAndAnswerView.do?q_no=${board.q_no}&mode=2'">답변</button>
			</c:if></c:if>
			</td>
		</tr>
	</table>
</div>


<c:import url="../include/main/footer.jsp" />
<c:import url="../include/common/end.jsp" />
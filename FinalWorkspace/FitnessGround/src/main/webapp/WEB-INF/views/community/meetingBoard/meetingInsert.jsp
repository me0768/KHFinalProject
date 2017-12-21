<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="../../include/common/head.jsp" />

<style type="text/css">
h1 {
	font-size: 30pt;
}

div#all_div {
	padding-left: 9%;
	padding-right: 9%;
}

div#insert_all_div {
	border: 1px solid gray;
}

div#div_head {
	padding-left: 10%;
}

form#editor_form {
	padding-left: 10%;
	padding-right: 10%;
}

button#write {
	color:black;
	width: 60pt;
	height: 30pt;
	font-size: 10pt;
}


input#title{
height:30pt;
width:250pt;
font-size:10pt;
}

textarea#editor1 {
	cols: 80;
	rows: 40;
}
</style>

<c:import url="../../include/common/headend.jsp" />

<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>

<div id="page-wrapper">
	<!-- Header -->
	<div id="mypage_header">
		<!-- Nav -->
		<c:import url="../../include/main/nav.jsp" />

		<c:import url="../../user/login.jsp" />
		<c:import url="../../user/findidpwd.jsp" />
		<c:import url="../../user/register.jsp" />
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#list").on("click", function(e) { //목록으로
			e.preventDefault();
			MeetingList();
		});
	});
	function MeetingList() {
		location.href = "meeting.do";
	}
</script>

<br>
<h1 align="center">운동같이해요</h1>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<form id="editor_form" name='meeting' method="post" action="meetingInsert.do">
			<input name="user_no" type="hidden" value="${sessionScope.user.user_no }" />
			<div class="form-group">
				<p>제목<input class="input-group input-group-lg" id="title" name="title" type="text" placeholder="제목" /></p>
				<p>모임날짜 &nbsp;<input style="width:100pt;"id="title" name="meeting_date" type="date" /></p>
			</div>
			<div class="form-group">
				<textarea name="content" id="editor2" placeholder="내용을 입력해주세요.."></textarea>
				<script>
					CKEDITOR.replace('editor2');
				</script>
				<br>
				<button type="submit" class="btn btn_primary btn-lg pull-right" name="업로드" id="write">작성</button>
				<a href="#this" class="btn" id="list">목록</a>
			</div>
		</form>
		</div>
	</div>
</div>
<br>
<br>
<br>
<c:import url="../../include/main/footer.jsp" />
<c:import url="../../include/common/end.jsp" />
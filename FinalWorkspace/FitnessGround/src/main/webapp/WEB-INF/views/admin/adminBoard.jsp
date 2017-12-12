<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="common/head.jsp" />

<style type="text/css">
</style>

<link
	href="/fitnessground/resources/admin/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<c:import url="common/headend.jsp" />

<script
	src="/fitnessground/resources/admin/vendor/datatables/jquery.dataTables.js"></script>
<script
	src="/fitnessground/resources/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
<script
	src="/fitnessground/resources/admin/js/sb-admin-datatables.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<c:import url="common/nav.jsp" />

<div class="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="adminMain.do">Fitness
					Ground</a></li>
			<li class="breadcrumb-item active">메인으로 이동</li>
		</ol>

		<div role="tabpanel" class="userBoardNav col-md-8 col-md-offset-2 col-sm-12">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active col-md-6 col-sm-6"><a href="#" aria-controls="test1" role="tab" data-toggle="tab">문의함</a></li>
				<li role="presentation" class="col-md-6 col-sm-6"><a href="#" aria-controls="test2" role="tab" data-toggle="tab">게시글</a></li>
			</ul>
		
		<!-- Tab panes -->
		<div class="tab-content" style="margin-top:0px;">
			<div role="tabpanel"  class="tab-pane fade in active" id="test1"></div>
		
		<table class="w3-table-all" style="background:white; border-style:1px;border-top:0px;" id="qnaT">
			<tr>
				<th colspan="2" align="left">
					<div id="searchInfo" style="text-align:left;">검색</div>
				</th>
				
				<th>
					<div class="input-group" id="qnaF">
					<input type="text" class="form-control" placeholder="제목으로 검색..." name="searchQKeyword" onkeydown="javascript: if (event.keyCode == 13) {qSearch();}">
							  <span class="input-group-addon" id="searchBt">
							  	<a onclick="qSearch();" class="glyphicon glyphicon-search"></a>
							  </span>
					</div>
				</th>
			</tr>
		</table>
		
		</div>

	</div>

</div>

<c:import url="common/footer.jsp" />
<c:import url="common/end.jsp" />
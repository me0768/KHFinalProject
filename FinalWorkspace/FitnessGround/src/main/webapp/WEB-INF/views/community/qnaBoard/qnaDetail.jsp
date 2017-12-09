<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:import url="../../include/common/head.jsp" />
	
	<style type="text/css">
    h1{
    font-size: 30pt;
    }
    div#detail_all_div{
    padding: 5%;
    }
    div#detail_div{
    border: 1px solid;
    }
    </style>
	
	
	<c:import url="../../include/common/headend.jsp" />
  
<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
  
	<div id="page-wrapper">
		<!-- Header -->
		<div id="mypage_header">
            <!-- Nav -->
			<c:import url="../../include/main/nav.jsp" />
			
			<c:import url="../../user/login.jsp"/>
			<c:import url="../../user/findidpwd.jsp"/>
			<c:import url="../../user/register.jsp"/>
		</div>
    </div>
    
    
      
    
    <br>
    <h1 align="center">${community.title}</h1>
   <div id="detail_ail_div"> 
    <div id="detail_div">
    	<div>

    	</div>
     	<p align="center">${community.name}</p>
     	<p>${community.content}</p>
        </div>
    <div>
   </div> 
   <a href="#" class="btn">수정</a>
   <a href="qnaDelete.do?no=${community.cb_no}" class="btn">삭제</a>
   <a href="qna.do" class="btn">목록</a>
    댓글 쓰는곳..   zz 
    
    </div>
       
    <c:import url="../../include/main/footer.jsp" />
    <c:import url="../../include/common/end.jsp" />
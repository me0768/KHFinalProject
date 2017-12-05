<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:import url="../../include/common/head.jsp" />
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
    
    <style type="text/css">
    	h1{
    		font-size:30pt;
    	}
    	div#all_div{
    	padding-left:9%;
    	padding-right:9%;
    	}
    	div#insert_all_div{
    	border: 1px solid;
  		
    	}
    	div#div_head{
    	padding-left:10%;
    	}
    	form#editor_form{
    	padding-left:10%;
    	padding-right:10%;
    	}
    	input#ok_btn{
    	left:47%;
    	width:30pt;
		height:30pt;
		font-size:12pt;
    	}	
    	textarea#editor1{
		cols: 80;
		rows: 40;
    	}
    </style>
    
    <br>
   	<h1 align="center">커뮤니티</h1>
   	<br>
  <div id="all_div"> 
   <div id="insert_all_div">
   	<br>
   	<div id="div_head">
 	  <p>게시판    </p>
	  <p>제목     <input type="text" placeholder="제목을 입력해주세요."/></p>
	  <p>파일첨부   </p>
   	</div>
    <div>
    	<form id="editor_form">
            <textarea name="editor1" id="editor1" placeholder="내용을 입력해주세요.."></textarea>
            <script>
                 CKEDITOR.replace( 'editor1' );
            </script>
        </form>
    </div>
  <br>
  </div>
</div>  
  <br><br>
  <input align="center" type="button" id="ok_btn" value="확인">
  <br><br><br>
    
    
    
    
    
    
    <c:import url="../../include/main/footer.jsp" />
    <c:import url="../../include/common/end.jsp" />
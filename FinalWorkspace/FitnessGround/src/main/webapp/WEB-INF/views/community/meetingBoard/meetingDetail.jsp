<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:import url="../../include/common/head.jsp" />
	<c:import url="../../include/common/headend.jsp" />
  
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
    font-size: 30pt;
    }
    div#detail_all_div{
    padding: 5%;
    }
    div#detail_div{
    border: 1px solid;
    }
    </style>
      
    
    <br>
    <h1 align="center">운동같이해요</h1>
   <div id="detail_ail_div"> 
    <div id="detail_div">
    	<div>
    		등산하러 가실분 구합니다.		날짜 조지고..    	
    	</div>
     	<p>작성자</p>
     	요즘 등산안한지 오래됨 .. ㅠㅠ
        </div>
    <div>
   </div> 
    댓글 쓰는곳..    
    
    </div>
       
    <c:import url="../../include/main/footer.jsp" />
    <c:import url="../../include/common/end.jsp" />
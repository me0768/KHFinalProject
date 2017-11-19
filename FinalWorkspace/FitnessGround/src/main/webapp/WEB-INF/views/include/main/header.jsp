<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>

	<header id="header">
		<h1 id="logo">
			<a href="main.jsp">Fitness Ground</a>
		</h1>
		<nav id="nav">
			<ul>
				<li><a href="main.jsp">Home</a></li>
				<li><a href="#">Layouts</a>
					<ul>
						<li><a href="left-sidebar.html">Left Sidebar</a></li>
						<li><a href="right-sidebar.html">Right Sidebar</a></li>
						<li><a href="no-sidebar.html">No Sidebar</a></li>
						<li><a href="#">Submenu</a>
							<ul>
								<li><a href="#">Option 1</a></li>
								<li><a href="#">Option 2</a></li>
								<li><a href="#">Option 3</a></li>
								<li><a href="#">Option 4</a></li>
							</ul></li>
					</ul></li>
				<li><a href="elements.html">Elements</a></li>
				<c:if test="${ sessionScope.user == null}">
					<li><button type="button" class="button special" data-toggle="modal" data-target="#loginmodal" style="height: 50px;">Sign Up</button></li>
				</c:if>
				
				<c:if test="${ sessionScope.user != null}">
					<li><button type="button" class="button special" data-toggle="modal" data-target="#logoutmodal" style="height: 50px;">Sign Out</button></li>
				</c:if>
			</ul>
		</nav>
	</header>
</div>
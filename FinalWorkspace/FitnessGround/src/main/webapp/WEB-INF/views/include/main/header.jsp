<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div>
	
	<c:if test="${ sessionScope == null}">
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#loginModal">
			로그인
		</button>
	</c:if>
	
	<c:if test="${ sessionScope != null }">
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#logoutModal">
			로그아웃
		</button>
	</c:if>

</div>
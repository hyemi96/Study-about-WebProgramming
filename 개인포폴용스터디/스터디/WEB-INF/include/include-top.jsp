<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="menu-logo-first">Spring <br>Community</div>
	<div class="menu-home">HOME</div>
	<c:choose>
		<c:when test="${sessionScope.authority == null}">
			<div class="menu-login"><a href="/yj/login/login.do">로그인</a></div>
			<div class="menu-signup"><a href="/yj/userCratePage.do">회원가입</a></div>
		</c:when>
		<c:otherwise>
			<div class="menu-logout">
				<a href="javascript:void(0);" onclick="logOut();">로그아웃</a>
			</div>
			<div class="menu-userId">${sessionScope.userId}</div>
		</c:otherwise>
	</c:choose>
</header>
<script>
function logOut() {
	var goUrl = "/nm/main/nmMainPage.do";
	if(confirm("로그아웃 하시겠습니까??")) {
		$.ajax({
			type : "post",
			url : "/nm/login/logOut.do",
			beforeSend: function() {
				lodingBarStart();
			},
			success : function() {
				location.href = goUrl;
			},
			error: function(xhs, status, error) {
				alert("통신 에러");
			},
			complete: function() {
				lodingBarEnd();
			}
		});
	} else {
		return false;
	}
}
</script>
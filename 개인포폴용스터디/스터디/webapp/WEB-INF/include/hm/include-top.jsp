<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="menu-logo-first"><img class="logoImg" src="/images/hm/그림1.png" />Home</div>
	<c:choose>
		<c:when test="${sessionScope.authority == null}">
			<div class="menu-login"><a href="/hm/login/login.do">로그인</a></div>
			<div class="menu-signup"><a href="/hm/userCratePage.do">회원가입</a></div>
		</c:when>
		<c:otherwise>
			<div class="menu-logout">
				<a href="javascript:void(0);" onclick="logOut();">로그아웃</a>
			</div>
			<div class="menu-userId">${sessionScope.userId}</div>
		</c:otherwise>
	</c:choose>
</header>
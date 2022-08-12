<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="inner-first">
	<div class="left-menu-top">
		<ul class="left-menu-up">
			<c:forEach var="menuVo" items="${leftMenuList }" varStatus="idx">
				<c:if test="${menuVo.authority == 'USER' }">
					<li>
						<a class="" href="${menuVo.menuUrl }">${menuVo.menuNm }</a>
					</li>
				</c:if>
				<c:if test="${menuVo.menuLevel == '2'}">
					<ul class="left-menu-down">
						<li>${menuVo.menuNm }</li>
					</ul>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<div class="left-menu-bottom">
		<ul class="left-menu-up">
			<c:forEach var="menuVo" items="${leftMenuList }" varStatus="idx">
				<c:if test="${menuVo.authority == 'ADMIN' }">
					<li>
						<a class="" href="${menuVo.menuUrl }">${menuVo.menuNm }</a>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</section>
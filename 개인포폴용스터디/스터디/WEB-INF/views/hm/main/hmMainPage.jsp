<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/hm/include-header.jsp" %>
<script>
function logOut() {
	var goUrl = "/hm/main/hmMainPage.do";
	if(confirm("로그아웃 하시겠습니까??")) {
		$.ajax({
			type : "post",
			url : "/hm/login/logOut.do",
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
	<div class="container">
		<%@ include file="/WEB-INF/include/hm/include-top.jsp" %>
		<div class="inner">
		<%-- <%@ include file="/WEB-INF/views/common/include-left.jsp" %> --%>
			<jsp:include page="/left.do" />
		</div>
		<section class="inner-second">
			<div class="content-box">
				<div class="content-title"><a href="/hm/noticeListPage.do">
					 공 지 사 항
				</div>
				<div class="content-more"><a href="/hm/noticeListPage.do">
					more
				</div>
				<div class="content-sign">
					▶
				</div>
				<hr>
			</div>
			<div class="content-box">
				<div class="content-title">
						자유게시판
				</div>
				<div class="content-more">
					more
				</div>
				<div class="content-sign">
					▶
				</div>
				<hr>
			</div>
			<div class="content-box">
				<div class="content-title">
					개발 TALK
				</div>
				<div class="content-more">
					more
				</div>
				<div class="content-sign">
					▶
				</div>
				<hr>
			</div>
		</section>
		<%@ include file="/WEB-INF/include/hm/include-footer.jsp" %>
	</div>
</body>
</html>
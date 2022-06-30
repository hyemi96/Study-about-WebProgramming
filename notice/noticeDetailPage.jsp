<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<link href="/css/hm/noticedetail.css" rel="stylesheet" />
<script>
function logOut() {
	var goUrl = "/sb/main/sbMainPage.do";
	if(confirm("로그아웃 하시겠습니까??")) {
		$.ajax({
			type : "post",
			url : "/sb/login/logOut.do",
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
		<%@ include file="/WEB-INF/include/include-top.jsp" %>
		<div class="inner">
			<jsp:include page="/left.do" />
		</div>
		<section class="inner-second">
			<div class="content-box scroll-bar">
				<div class="content-title">
					 공 지 사 항
				</div>
				<br>
				<div class="listbox">
					<table id="notice-detail">
						<tr>
							<th class="category" colspan="2" style="background-color: #20B2AA;">
								<selected class="noticeTopPixSelect">
									<option value="1">공지</option>
									<!-- <option value="2">NEW</option>
									<option value="3">HOT</option> -->
								</selected>
							</th>
						</tr>
						<tr>
							<th class="Subject-Title" colspan="2">글 제목</th>
						</tr>
						<tr>
							<td>글 작성 날짜</td>
							<td>2021-06-26</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>namdda</td>
						</tr>
						<tr>
							<td>조회수</td>
							<td>123</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td>1, 2, 3</td>
						</tr>
						<tr>
							<td colspan="2">
							Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham
							</td>
						</tr>
					</table>
				</div>
				<br>
				<br>
				<!-- 해시태그 -->
				<a class="hash-tag" href="#">#LoremIpsum</a>
				<div class="share-section">
					<a href="#"><img src="/images/hm/KakaoIcon.png" class="share-tag"/></a>
					<a href="#"> <img src="/images/hm/InstagramIcon.png" class="share-tag"/></a>
					<a href="#"> <img src="/images/hm/FacebookIcon.png"  class="share-tag"/></a>
				</div>
				<hr>
				<a class="direction-tag" href="#">이전글</a>
				<hr>
				<a class="direction-tag current-page" href="#">현재글</a>
				<hr>
				<a class="direction-tag" href="#">다음글</a>
				<hr>
				<div class="list-button">
					<button type="button" id="notice-list" class="bottom-button">목록으로</button>
				</div>
				<div class="order-button">
					<button type="button" id="notice-edit" class="bottom-button" >글 수정</button>
					<button type="button" id="notice-delete" class="bottom-button" >글 삭제</button>
				</div>
			</div>
		</section>
		<%@ include file="/WEB-INF/include/include-footer.jsp" %>
	</div>
</body>
</html>
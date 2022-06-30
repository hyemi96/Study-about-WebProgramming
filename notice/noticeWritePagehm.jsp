<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<link href="/css/hm/noticelist.css" rel="stylesheet" />

<div class="container">
	<%@ include file="/WEB-INF/include/include-top.jsp" %>
	<div class="inner">
		<jsp:include page="/left.do" />
	</div>
		<section class="inner-second">
		<div class="content-box" style="background-color: beige;">
			<div class="content-title2">글 쓰 기</div>
			<br>
			<form name="nWriteForm" onsubmit="return false">
			<div class="">
				<div class="order-button">카테고리 선택
					<select name="category" id="category">
						<option value="new" selected>날짜순</option>
						<option value="ord">조회순</option>
						<option value="subjectCategory">제목순</option>
						<option value="전체수업관련">전체수업관련</option>
						<option value="숙제공지관련">숙제공지관련</option>
						<option value="채용관련">채용관련</option>
						<option value="IT현황및이슈">IT현황 및 이슈</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<div class="nName">글제목<input type="text" name="nwriteSubject" id="nwriteSubject" placeholder="글제목을 입력해주세요." style="width: 600px;"/>
					글쓴이ID<input type="hidden" name="nwriter" id="nwriter" value="세션아디"/>
				</div>
			</div>
			<div class="에디터퍼블캡처">
			<img class="에디터퍼블캡처img" src="/images/hm/글쓰기에디터캡처.PNG" style="width: 900px;"/>
			</div>
				<!--
				크다		a gt b		a > b
				작다		a lt b 		a < b
				크거나 같다	a ge b		a >= b
				작거나 같다 a le b		a <= b
				같다		a eq b		a == b
				같지 않다	a ne b		a != b
				 -->
				<div class="listbox scroll-bar" style="overflow: auto; height: 300px;" >
					<textarea  wrap="off" row="100" cols="300" placeholder="글 내용을 입력하세요." name="nwContent" id="nwContent" style="color: wite; height: 500px;" >
					</textarea>
				</div>
				<br>   <!--  커밋확인-->
				<div class="nwrioefooter" style="text-align: center;">
					<div style="float: left;">
						첨부파일<input type="text" name="cumbu" id="cumbu" placeholder="사진이나 동영상을 등록하세요."/>
					</div>
					<!-- <div style="float: center;">
						글 비밀번호 <input type="text" name="nwritePw" id="nwritePw" placeholder="글 비밀번호를 등록하세요."/>
					</div> -->
					<div style="float: right; padding-right: 20px">
						<!-- <button class="btn" type="button" style="background-color:#009688; color: #FFC2B4;" onclick="">임시저장</button> -->
						<button class="btn" style="background-color:#1c5f8f; color: #FFC2B4;" type="button" onclick="">등록</button> <!--임시저장후에는 버튼의 텍스트가 저장으로 바뀜 -->
						<button class="btn" type="reset" style="background-color:#8f2323; color: #FFC2B4;" >삭제</button>
						<button class="btn" style="background-color: #267c7c; color: #FFC2B4;" type="button" onclick="href="/hm/noticeListPage.do">글목록</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<%@ include file="/WEB-INF/include/include-footer.jsp" %>
</div>
</body>
</html>
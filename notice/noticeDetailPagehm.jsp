<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<link href="/css/hm/noticelist.css" rel="stylesheet" />
<style>
 .block {
	display: inline-block;
	/*  float: left; */
}
</style>

<div class="container">
	<%@ include file="/WEB-INF/include/include-top.jsp"%>
	<div class="inner">
		<jsp:include page="/left.do" />
	</div>
		<section class="inner-second">
		<div class="content-box" style="background-color: beige; height="700px">
			<div class="content-title2">글  상 세 보 기</div>
			<br>
			<form name="nDetailForm" onsubmit="return false">
			<div class="">
				<div class="order-button">카테고리
					<select name="category" id="category">
						<option value="new" >최신순</option>
						<option value="ord">조회순</option>
						<option value="subjectCategory">제목순</option>
						<option value="전체수업관련" selected>전체수업관련</option>
						<option value="숙제공지관련">숙제공지관련</option>
						<option value="채용관련">채용관련</option>
						<option value="IT현황및이슈">IT현황 및 이슈</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<div class="nsName">글제목<input type="text" name="nwriteSubject" id="nwriteSubject" value="10주차네요 화이팅" style="width: 600px;"/>
					글쓴이ID<input type="hidden" name="nwriter" id="nwriter" value="세션아디"/>
				</div>
			</div>
			<div>
				<div clssa="block frist">
					글 번호
				</div>
				<div clssa="block second">
					조회수
				</div>
				<div clssa="block thrid">
					등록일자
				</div>
			</div>
				<div class="listbox scroll-bar" style="overflow: auto; height: 400px;" >
					<div class="유튜브퍼블캡처">
						<img class="유투브캡처img" src="/images/hm/유투브캡처.jpg" style="width: 900px;"/>
					</div>
					<textarea  wrap="off" row="100" cols="300" value="" name="nwContent" id="nwContent" style="background-color: beige; height: 500px;" >
					차장님 삼겹살 먹고싶어요. 숙제가 많아요.

					10기 스터디 화이팅~!</textarea>
				</div>
				<br>
				<div class="nwrioefooter" style="text-align: center;">
					<div style="float: right; padding-right: 20px">
						<button class="btn" style="background-color:#1c5f8f; color: #FFC2B4;" type="button" onclick="">저장</button>
						<button class="btn" type="button" style="background-color:#8f2323; color: #FFC2B4;" onclick="" >글삭제</button>
						<button class="btn" style="background-color: #267c7c; color: #FFC2B4;" type="button" onclick="href="/hm/noticeListPage.do">글목록</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</div>
</body>
</html> <!-- 내꺼커밋확인                  -->
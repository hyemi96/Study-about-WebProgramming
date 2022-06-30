<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="currTime" class="java.util.Date" />
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<link href="/css/hm/noticeWrite.css" rel="stylesheet" />
<link href="/css/hm/summernote-lite.css" rel="stylesheet" />
<script src="/js/hm/summernote-ko-KR.js"></script>
<script src="/js/hm/summernote-lite.js"></script>

<div class="container">
	<%@ include file="/WEB-INF/include/include-top.jsp"%>
	<div class="inner">
		<jsp:include page="/left.do" />
	</div>
		<section class="inner-second">
			<div class="content-box">
				<div class="content-title">
					 공지사항 글쓰기
				</div>
				<br>
				<div class="listbox">
					<table class="notice-write">
						<tr>
							<th>상단고정</th>
							<td>
								<select class="noticeTopPixSelect">
									<option value="1">공지</option> <!-- 1 type일시 확성기 이미지로 테이블 해당 seq 넘버대신 올라간다. -->
									<option value="2">NEW</option><!-- 2 type일시 NEW 이미지로 테이블 seq 넘버대신 올라간다. -->
									<option value="3">HOT</option><!-- 3 type일시 HOT 이미지로 테이블 seq 넘버대신 올라간다. -->
								</select>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" class="subject" id="subjectId" name="subjectId"/>
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${sessionScope.userId}</td>
						</tr>
						<tr>
							<th>작성날짜</th>
							<td>
								<fmt:formatDate value="${currTime}" pattern="yyyy-MM-dd" />
							</td>
						</tr>
						<tr>
							<th>글 내용</th>
							<td>
								<textarea class="summernote" name="editordata"></textarea>
							</td>
						</tr>
						<tr>
							<th>해시태그</th>
							<td>
								<input class="hashTagBox" type="text" name="hashTag" placeholder="#태그"/>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<input type="file" name="file">
							</td>
						</tr>
				</table>
				</div>
				<div class="order-button">
					<button type="button" id="notice_list" class="bottom-button">목록</button>
					<button type="button" id="notice_delete" class="bottom-button">삭제</button>
					<button type="button" id="notice_create" class="bottom-button">등록</button>
				</div>
			</div>
		</section>
	<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</div>
<script>
$('.summernote').summernote({
	// 에디터 높이
	height: 150,
	// 에디터 한글 설정
	lang: "ko-KR",
	// 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	focus : true,
	toolbar: [
		// 글꼴 설정
		['fontname', ['fontname']],
		// 글자 크기 설정
		['fontsize', ['fontsize']],
		// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		// 글자색
		['color', ['forecolor','color']],
		// 표만들기
		['table', ['table']],
		// 글머리 기호, 번호매기기, 문단정렬
		['para', ['ul', 'ol', 'paragraph']],
		// 줄간격
		['height', ['height']],
		// 그림첨부, 링크만들기, 동영상첨부
		['insert',['picture','link','video']],
		// 코드보기, 확대해서보기, 도움말
		['view', ['codeview','fullscreen', 'help']]
		],
		// 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		// 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
});
</script>
</body>
</html>
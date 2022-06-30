<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<link href="/css/hm/noticelist.css" rel="stylesheet" />
<script>
	$(function() {
		var obj = document.frm;
		obj.action = "<c:url value='/hm/noticeListPage.do' />";//동적으로 태그를 감싸면서 로그인세션유지를 해준다 = 보안상강점
		obj.method = "post";

		$("search").on("change", function() {
			obj.submit();
		});
		$("pageCnt").on("change", function() {
			//var pageCnt = $(this).val(); //내 자기자신것을 갖고온다.
			obj.submit();
		});
	});
</script>
<div class="container">
	<%@ include file="/WEB-INF/include/include-top.jsp"%>
	<div class="inner">
		<jsp:include page="/left.do" />
	</div>
	<section class="inner-second">
		<div class="content-box">
			<div class="content-title2">공 지 사 항</div>
			<br>
			<form name="frm">
				<div class="search-form">
					<input type="text" class="select-box" name="search" id="search" placeholder="검색어 입력" value="${search }"/>
					<button type="button" class="search-button">검색</button>
				</div>
				<br>
				<div class="contents-count">${noticeListCnt }/${noticeTotalCnt }
				</div>
				<div class="order-button">
					<button type="button" id="date-order"
						class="choose-button changeBtn">날짜순</button>
					<button type="button" id="title-order" class="choose-button">제목순</button>
					<button type="button" id="view-order" class="choose-button">조회순</button>
				</div>
				<div class="space1"></div>
				<!--
				크다		a gt b		a > b
				작다		a lt b 		a < b
				크거나 같다	a ge b		a >= b
				작거나 같다 a le b		a <= b
				같다		a eq b		a == b
				같지 않다	a ne b		a != b
				 -->
				<div class="contents-onepageval">
					<select name="pageCnt" id="pageCnt">
						<option value="5" <c:if test="${pageCnt eq '5' }">selected="selected"</c:if>>5개</option>
						<option value="10" <c:if test="${pageCnt == '10' }">selected="selected"</c:if>>10개</option>
						<option value="15" <c:if test="${pageCnt eq '15' }">selected="selected"</c:if>>15개</option>
						<option value="20" <c:if test="${pageCnt == '20' }">selected="selected"</c:if>>20개</option>
						<option value="50" <c:if test="${pageCnt eq '50' }">selected="selected"</c:if>>50개</option>
					</select>
				</div>
				<div class="listbox scroll-bar">
					<table id="tmTable" style="overflow:scroll;">
						<tr>
							<th>상단고정</th>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<c:forEach var="noticeVo" items="${noticeList }" varStatus="idx">
							<tr>
								<td><input type="checkbox" name="noticeTopPixCheckbox" value="" checked="checked" /></td>
								<td>${noticeVo.noticeSeq }</td>
								<td>${noticeVo.noticeSubject }</td>
								<td>${noticeVo.noticeWriterId }</td>
								<td>${noticeVo.noticeRegDt }</td>
								<td>${noticeVo.noticeViews }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="paging-box">
					<ul>
						<c:if test="${pageVo.pageNo != 0 }">
							<c:if test="${pageVo.pageNo > pageVo.pageBlock }">
								<li>
									<a href="javascript:void(0);" onclick="fn_movePage(${pageVo.firstPageNo });" style="text-decoration: none;"> << </a>
								</li>
							</c:if>
							<c:if test="${pageVo.pageNo != 1 }">
								<a href="javascript:void(0);" onclick="fn_movePage(${pageVo.prevPageNo });" style="text-decoration: none;"> < </a>
							</c:if>
							<c:forEach var="i" begin="${pageVo.startPageNo }" end="${pageVo.endPageNo }" step="1">
								<li>
									<c:choose>
										<c:when test="${i eq pageVo.pageNo }">
											<a href="javascript:void(0);" onclick="fn_movePage(${i });" style="text-decoration: none; color: blue;">${i }</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0);" onclick="fn_movePage(${i });" style="text-decoration: none;">${i }</a>
										</c:otherwise>
									</c:choose>
								</li>
							</c:forEach>
							<c:if test="${pageVo.pageNo != pageVo.finalPageNo }">
								<a href="javascript:void(0);" onclick="fn_movePage(${pageVo.nextPageNo });" style="text-decoration: none;"> > </a>
							</c:if>
							<c:if test="${pageVo.pageNo < pageVo.finalPageNo }">
								<a href="javascript:void(0);" onclick="fn_movePage(${pageVo.finalPageNo });" style="text-decoration: none;"> >> </a>
							</c:if>
						</c:if>
					</ul>
				</div>
				<input type="hidden" name="pageNo" value="${pageVo.pageNo }" />
				<input type="hidden" name="orderType" value="${pageVo.orderType }" />
				<input type="hidden" name="noticeSeq" value="1" />
			</form>
			<c:if test="${sessionScope.authority == 'admin123' }">
				<div class="write-div">
					<button type="button" id="notice-write" onclick="location.href='/hm/noticeWritePage.do'">글쓰기</button>
				</div>
			</c:if>
		</div>
	</section>
	<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</div>
</body>
</html>
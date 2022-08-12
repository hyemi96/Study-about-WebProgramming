<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인 페이지</title>
	<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/css/common.css' />" />
	<link type="text/css" href="/css/yj/login.css" rel="stylesheet" />
	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="<c:url value='/js/cmm/common.js'/>"></script>
</head>
<script>
$(function(){
	var param = "${param.LOGIN_ERR}";
	if(param === "serverError") {
		alert("서버 에러");
	} else if (param === "IDNE") {					// 비밀번호 불일치
		alert("아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해주세요.")
	} else if (param === "resetPw") {				// 계정 비활성화
		alert("패스워드 초기화를 해주세요.");
	} else if (param === "validity") {				// 비밀번호 유효기간 만료
		alert("비밀번호 유효기간이 90일 경과하였습니다.");
	} else if (param === "accountLock") {			// 계정 잠김
		alert("계정이 잠겼습니다.\n관리자에게 문의하세요");
	} else if (param === "fivePwFail") {			// 계정 만료
		alert("패스워드를 5번 틀렸습니다.\n관리자에게 문의하세요");
	} else if (param == "IDDUP") {					// 중복 로그인
		alert("다른곳에서 로그인이 되었습니다.");
	} else if (param == "logOut") {					// 세션 완료 자동 로그아웃
		alert("세션이 만료되어 자동 로그아웃 되셨습니다.");
	}

	$('#userId').on("keydown", function(e){
		if(e.keyCode == 13) {
			if($('#userPw').val().trim() == '') {
				$('#userPw').focus();
			} /* else if($('#otpCode').val().trim() == '') {
				$('#otpCode').focus();
			} */ else {
				// $("#btn").trigger("click");
				login();
			}
		}
	});

	$('#userPw').on("keydown", function(e){
		if(e.keyCode == 13) {
			if($('#userId').val().trim() == '') {
				$('#userId').focus();
			} /* else if($('#otpCode').val().trim() == '') {
				$('#otpCode').focus();
			} */ else {
				// $("#btn").trigger("click");
				login();
			}
		}
	});
});

function login() {
	var userId = $('#userId').val();
	var userPw = $('#userPw').val();
	// var otpCode = $('#otpCode').val();

	if(userId === undefined || userId === "" || userId.length === 0 || $.trim(userId) === "") {
		alert("아이디를 입력해주세요.");
		$('#userId').focus();
		return false;
	}

	if(userPw === undefined || userPw === "" || userPw.length === 0 || $.trim(userPw) === "") {
		alert("비밀번호를 입력해주세요.");
		$('#userPw').focus();
		return false;
	}

	/* if(otpCode === undefined || otpCode === "" || otpCode.length === 0 || $.trim(otpCode) === "") {
		alert("otp 코드를 입력해주세요.");
		$('#otpCode').focus();
		return false;
	} */

	lodingBarStart();

	var obj = document.frm;
	obj.method="post";
	obj.action="/hm/login/loginChek.do";
	obj.submit();
}
</script>
<body>
<div>
	<div>
		<h1>L O G I N</h1>
	</div>
	<form name="frm">
		<div>
			<span>아 이 디 : </span><input type="text" class="inputTexe" id="userId" name="userId" placeholder="아이디" />
		</div>
		<br>
		<div>
			<span>패스워드 : </span><input type="password" class="inputTexe" id="userPw" name="userPw" placeholder="비밀번호" />
		</div>
	</form>
	<br>
	<div>
		<button class="btn" type="button" onclick="login();">로 그 인</button>
	</div>
	<div>
		<a href="/hm/user/userRegister.do">회원가입</a>
		<span>|</span>
		<a href="javascript:void(0);">아이디 찾기</a>
		<span>|</span>
		<a href="javascript:void(0);">비밀번호 찾기</a>
	</div>
</div>
</body>
</html>
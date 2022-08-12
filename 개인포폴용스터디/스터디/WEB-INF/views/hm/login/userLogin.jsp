<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인 페이지</title>
	<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/css/hm/common.css' />" />
	<script src="/js/hm/jquery-3.6.0.min.js"></script>
	<script src="<c:url value='/js/cmm/common.js'/>"></script>
</head>
<script>
function login() {

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
	var userId = $('#userId').val();
	var userPw = $('#userPw').val();

	lodingBarStart();

	var obj = document.frm;
	obj.method="post";
	obj.action="/hm/login/loginChek.do";
	obj.submit();
}
</script>
<style>
.findIdPw {
	color: #9e9e9e;
	text-decoration: none;
	font-size: 12px;
	text-align: right;
}

.kakaoImg {
	width : 310px;
	margin-top: 10px;
	text-align: center;
}
.coffeImg {
	width : 50px;
	margin-top: 20px;
	text-align: center;
	margin-left: 125px;
}
.cafeImg {
width: 325px;
padding-left: 400px;
margin-top: 40px;
}

.login-btn {
	margin-top: 13px;
	width: 310px;
	text-align: center;
	height: 38px;
	color: #eaf3f2;
	background-color: #ec5707;
	font-size: x-large;
	font-weight: bold;
	border: 0;
	outline: 0;
	font-family: 'Brush Script MT';
}

.login_text {
	color: white;
	width: 310px;
	text-align: center;
	font-size: xxx-large;
	font-family: 'Brush Script MT';
}

.or-login {
	font-size: small;
	text-align: center;
}

.group-input {
	margin-top: 5px;
}

#userId {
	margin-top: 5px;
    width: 300px;
    height: 25px;
}

#userPw {
	margin-top: 5px;
	width: 300px;
	height: 25px;
}

.group-input-check {
	text-align: right;
}

.switch-login {
	text-align: center;
}

.group-login {
	font-size: xx-small;
}

.txt_copyright {
	position: absolute;
	text-align: center;
	bottom: 10;
	width: 100%;
}

.service_info {
	text-align: center;
	padding: 20px 0 60px;
	border-top: 1px solid #e5e5e5;
	font-size: 16px;
    line-height: 1.5;
    font-family: NotoSans-Regular,AppleSDGothicNeo-Regular,"맑은 고딕",Malgun Gothic,"돋움",dotum,sans-serif;
    color: #7c7c7c;
    letter-spacing: -0.03em;
    word-wrap: break-word;
}


</style>

</head>


<script>
function userRegister() {
	/* document.frm.action = "/hm/mberRegister.do";
	document.frm.method = "post";
	document.frm.submit(); */

	var obj = document.frm;
	obj.action = "/hm/user/userRegister.do";
	obj.method = "post";
	obj.submit();

}
</script>

<!-- 탑에 로고랑  include or tiles 탑메뉴 추후 게획-->

<body style="background-color: #0d0101">
<div class="float">
<div  style="float: left; width: 33%; padding:10px;"><img class="cafeImg" src="/images/hm/cafe.jpg" /></div>
 <tr>
	<td colspan="7">
		<table>
			<tr>
				<td>
					<div class="register-login-section spad">
						<div class="container">
							<div class="login-form" style="margin-left: 280px; float: left; width: 50%; padding:10px;">
								<h2 class="login_text"><b>Login<b></h2>
								<form name="frm" id="frm" action="userLogin.do" method="post" onsubmit="return false">
									<div class="group-input">
										<label for="userId" style="color: white;">User ID *</label><br>
										<input type="text" id="userId" placeholder="아이디를 입력해주세요." valid="req,max15" />
									</div><!-- 짝태그 -->
									<div class="group-input">
										<label for="userPw" style="color: white;">Password *</label><br>
										<input type="password" id="userPw" value="패스워드" valid="req,max20" /> <!--홀태그 -->
									</div>
									<div class="group-input-check">
										<a href="hm/user/findIdPw.do" class="forget-id/passwd findIdPw">Forget your ID/Password</a><br><br>
									</div>
									<div class="group-login">
									<br><font color="red">TIP</font><font color="white"> 카카오메일이 있다면 카카오로 간편 로그인해보세요.</font><br>
									<%-- <%int myPort = request.getServerPort(); %> --%>
									<button type="button" class="login-btn" onclick="login();">Sign In</button><br>
									<%--  <a href="https://kauth.kakao.com/oauth/authorize?client_id=<오픈에이피아이에서받은번호>&redirect_uri=http://localhost:<%=myPort %>/ex/kakaologin.do&response_type=code"> --%>
									<img class="kakaoImg" src="/images/hm/kakaologin.PNG" />
									</div>
								</form>
								<br>
								<div class="switch-login">
									<a href="hm/user/userResister.do" class="or-login" onclick="userRegister();">OR CREATE AN ACOUNT</a>
								</div>
								<div><img class="coffeImg" src="/images/hm/그림1.png" /></div>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</td>
</tr>
</div>


<!-- include or tiles(?) 바텀 추후 계획-->
 <br><br>
	<div class="service_info">
			<a href="https://www.kakao.com/policy/terms?lang=ko" class="link_info">이용약관</a><span class="txt_bar"></span>
			<a href="https://www.kakao.com/policy/privacy?lang=ko" class="link_info link_policy">개인정보 처리방침</a><span class="txt_bar"></span>
			<a href="https://www.kakao.com/policy/oppolicy?lang=ko" class="link_info">운영정책</a><span class="txt_bar"></span>
			<a href="https://cs.kakao.com/" class="link_info">고객센터</a>
			<a href="https://www.kakao.com/notices?lang=ko" class="link_info">공지사항</a><span class="txt_bar"></span>
		 	<br><br>
		<div class="txt_copyright">
			<small>Copyright @ <a>SongHyrmi and Kakao Corp </a>All rights reserved.
			</small>
		</div>
	</div>
<!-- include or tiles(?) 바텀 추후 계획 : 회사 연관로고가 움직이면서 차례로 넘어감-->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/css/hm/result.css">
	<script src="<c:url value='/js/hm/jquery-3.4.0.min.js'/>"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<script>
//인증여부 체크시 사용 변수
var certification = false;

$(function(){
	$("#phoneChked").on("click", function(){
		var popWidth = 450, popHeight = 280;				// 팝업 창 사이즈
		var mtWidth = document.body.clientWidth; 			// 현재 브라우저가 있는 모니터의 화면 폭 사이즈
		var mtHeight = document.body.clientHeight;			// 현재 브라우저가 있는 모니터의 화면 높이 사이즈
		var scX = window.screenLeft;						// 현재 브라우저의 x 좌표(모니터 두 대를 합한 총 위치 기준)
		var scY = window.screenTop;							// 현재 브라우저의 y 좌표(모니터 두 대를 합한 총 위치 기준)

		var popX = scX + (mtWidth - popWidth) / 2 - 50;		// 팝업 창을 띄울 x 위치 지정(모니터 두 대를 합한 총 위치 기준)
		var popY = scY + (mtHeight - popHeight) / 2 - 50;	// 팝업 창을 띄울 y 위치 지정(모니터 두 대를 합한 총 위치 기준)
		var url = "<c:url value='/hm/send/phoneSendPop.do' />";
		var option = "width=" + popWidth + ", height=" + popHeight + ", left=" + popX + ", top=" + popY + ",scrollbars=yes, resizeable=no, menubar=no, status=no, toolbar=no";
		var win = window.open(url, "windowPop", option);
		win.focus();
	});

	$("#create").click(function(){
		var validate = ValidationCheck();
		if(validate === false) return false;
		if(confirm("회원가입을 하시겠습니까?") == true) {
			//lodingBarStart();
			$.ajax({
				type:"post",
				url : "<c:url value='/hm/createIdAndEmailCheck.do' />",
				/* encodeURIComponent
				예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer 중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
				그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
				data: "userId="+encodeURIComponent($('#userId').val())+"&userEmail="+encodeURIComponent($('#userEmail').val()),
				success : function(data) {
					if(data == "ok") {
						if(validate === true) {
							var obj = document.frm;
							obj.method = "post";
							obj.action = "<c:url value='/hm/userCreateSuccess.do' />";
							obj.submit();
						}
					}
					if(data === "fal") {
						alert("중복된 ID 또는 Email이 있습니다.");
					}
				},
				error : function(data) {
					alert('에러가 발생하였습니다.');
					return false;
				},
				complete: function() {
					//lodingBarEnd();
				}
			});
		} else {
			return false;
		}
	});
});

function checkedId(obj) {
	var str = obj.value;
	var len = str.length;
	var ch = str.charAt(0);
	for(i=0; i<len; i++) {
		ch = str.charAt(i);
		if((ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')) {
			continue;
		} else {
			alert("영문/숫자만 입력이 가능합니다.");
			obj.value="";
			obj.focus();
			return false;
		}
	}
	return true;
}

function onblur_passwordCheck() {
	if($("#passwordCheck").val() != "") {
		if($("#userPw").val() != "") {
			if($("#userPw").val() != $("#passwordCheck").val()) {
				$("#passwordCheck").val("");
				$("#passwordCheck").focus();
				alert("비밀번호가 일치하지 않습니다.");
				$("#createPasswordSpan").remove();
			} else {
				$(".passwordCheck").append('<br><span class="createPasswordSpan" id="createPasswordSpan"></span>');
				$("#createPasswordSpan").css("color", "blue").css("font-size", "10px");
				/* $("#createPasswordSpan").text("비밀번호가 일치 합니다."); */
				document.getElementById("createPasswordSpan").innerText = "비밀번호가 일치 합니다.";
			}
		}
	}
}

function onblur_emailCheck() {
	if($("#userEmail").val() != "") {
		var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;	// email 유효성검사
		$(".createEmailSpan").remove();
		$(".emailCheck").append('<br class="createEmailSpan"><span class="createEmailSpan" id="createEmailSpan"></span>');
		if(!regExp.test($("#userEmail").val())) {
			$("#createEmailSpan").css("color", "red").css("font-size", "10px");
			document.getElementById("createEmailSpan").innerText = "잘못된 Email 형식입니다.";
			return false;
		} else {
			$("#createEmailSpan").css("color", "blue").css("font-size", "10px");
			$("#createEmailSpan").text("사용 할 수 있는 Email입니다.");
			return false;
		}
	}
}

function setParentInput(param1) {
	document.getElementById("userPhone").value = param1;
	$("#userPhone").val(param1);
	certification = true;
	$("#phoneChked").prop("disabled", true);
}
function ValidationCheck() {
	var validate = true;
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;		// email 유효성검사
	var hanChecked = /^[가-힝a-zA-Z]{2,15}$/;																				// 한글 유효성검사(2자리 이상 15자리 이하)
	var idChecked = /^[0-9a-zA-Z]{5,15}$/;																					// 아이디 유효성검사(5자리 이상 15자리 이하)
	var phoneChecked = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-([0-9]{3,4})-([0-9]{4})$/;

	if($("#userEmail").val()) {
		if(!regExp.test($("#userEmail").val())) {
			alert("이메일 주소가 유효하지 않습니다");
			$("#userEmail").focus();
			return false;
		}
	}
	if($("#userPhone").val()) {
		if(!phoneChecked.test($("#userPhone").val())) {
			alert("전화번호가 잘못 되었습니다.");
			$("#userPhone").focus();
			return false;
		}
	}
	if(!$("#userId").val()) {
		alert("아이디를 입력 하세요.");
		$("#userId").focus();
		validate = false;
	} else if(!idChecked.test($("#userId").val())) {
		alert("아이디는 5자 ~ 15자리 사이로 만들어주세요.");
		return false;
	} else if(!$("#userNm").val()) {
		alert("이름을 입력 하세요.");
		$("#userNm").focus();
		return false;
	} else if(!hanChecked.test($("#userNm").val())) {
		alert("이름이 잘못 되었습니다.");
		$(" #userNm").focus();
		return false;
	} else if(!$("#userEmail").val()) {
		alert("이메일을 입력하세요.");
		$(" #userEmail").focus();
		return false;
	} else if(!$("#userPw").val()) {
		alert("비밀번호를 입력하세요.");
		$("#userPw").focus();
		return false;
	} else if($("#userPw").val().length > 16 || $("#userPw").val().length < 8) {
		alert("비밀번호는  8 ~ 16 자리로 입력해주세요.");
		return false;
	} else if(!$("#passwordCheck").val()) {
		alert("비밀번호 확인을 입력하세요.");
		$("#passwordCheck").focus();
		return false;
	} else if($("#userPw").val() != $("#passwordCheck").val()) {
		alert("비밀번호가 일치 하지 않습니다.");
		$(" #passwordCheck").focus();
		return false;
/* 	} else if(!$("#userPhone").val() || certification == false) {
		alert("본인 인증을 해주세요");
		$(" #phoneChked").focus();
		return false; */
	} else if(!$("#address1").val()) {
		alert("주소를 클릭하여 선택해 주세요");
		$(" #addressNum").focus();
		return false;
	} else if(!$("#address2").val()) {
		alert("나머지 주소를 입력 해 주세요");
		$("#address2").focus();
		return false;
	} else {
		return true;
	}
	return validate;
}
</script>
<body>
<div id="con">
	<div id="login">
		<div id="login_form">
			<h2 class="sub_tit_txt">회원가입 페이지</h2>
			<form name="frm">
				<hr>
				<label>
					<p class="inputFormP">ID</p>
					<input type="text" placeholder="아이디" class="size" id="userId" name="userId" onKeyup="checkedId(this);" maxlength="30" />
					<br>
				</label>
				<label>
					<p class="inputFormP">사용자 이름</p>
					<input type="text" placeholder="사용자 이름" class="size" id="userNm" name="userNm" maxlength="20" />
					<br>
				</label>
				<label>
					<p class="inputFormP">비밀번호</p>
					<input type="password" placeholder="비밀번호" class="size" id="userPw" name="userPw" maxlength="8" />
				</label>
				<label class="passwordCheck">
					<p class="inputFormP"></p>
					<input type="password" placeholder="비밀번호 확인" class="size" id="passwordCheck" maxlength="8" onblur="onblur_passwordCheck();" />
				</label>
				<label>
					<p class="inputFormP">이동전화</p>
					<select class="size num1">
						<option value="skt">SKT</option>
						<option value="kt">KT</option>
						<option value="lg">LG</option>
					</select>
					<input placeholder="- 빼고 숫자만 입력" class="size num2" id="userPhone" name="userPhone" />
					<button type="button" class="btn1">인증</button>
				</label>
				<label>
					<p class="inputFormP">주소</p>
					<input type="text" placeholder="클릭하세요!!" class="size" id="addressNum" name="addressNum" style="width:100px; float:left; margin-left: 25px;" readonly="readonly" onclick="openDaumPostcode('addressNum','address1','address2'); return false;" /><br><br>
					<input type="text" placeholder="기본 주소" class="size" id="address1" name="address1" readonly="readonly" /><br><br>
					<input type="text" placeholder="상세 주소" class="size" id="address2" name="address2" /><br><br>
				</label>
				<label class="emailCheck">
					<p class="inputFormP">이메일</p>
					<input type="text" placeholder="이메일" class="size" id="userEmail" name="userEmail" onblur="onblur_emailCheck();" maxlength="30"  value=""/>
				</label>
				<br>
				<input type="hidden" name="ipAddr" value="${clientIP }" />
			</form>
			<p><button type="button" class="btn2" id="create">확인</button></p>
			<hr>
		</div>
	</div>
</div>
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode(); return false;" alt="닫기 버튼">
</div>



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


</body>
<script>
//우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	element_layer.style.display = 'none';
}

function openDaumPostcode(userZipCode, userFirstAddr, userSecondAddr) {
	new daum.Postcode({
		oncomplete : function (data) {
			document.getElementById(userZipCode).value = data.zonecode;
			document.getElementById(userFirstAddr).value = data.address;
			document.getElementById(userSecondAddr).focus();
			element_layer.style.display = 'none';
		},
		width : '100%',
		height : '100%'
	}).embed(element_layer);
		element_layer.style.display = 'block';
		initLayerPosition();
}

function initLayerPosition() {
	var width = 300;			//우편번호서비스가 들어갈 element의 width
	var height = 460;			//우편번호서비스가 들어갈 element의 height
	var borderWidth = 5;		//샘플에서 사용하는 border의 두께

	// 위에서 선언한 값들을 실제 element에 넣는다.
	element_layer.style.width = width + 'px';
	element_layer.style.height = height + 'px';
	element_layer.style.border = borderWidth + 'px solid';
	// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}
</script>



</html>
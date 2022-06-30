<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/css/common.css' />" />
	<script src="<c:url value='/js/jquery-3.4.0.min.js'/>"></script>
	<script src="<c:url value='/js/cmm/common.js'/>"></script>
</head>
<script>
$(function(){
	$("#phoneSend").on("click", function(){
		//var phoneChecked = /^[0-9-]{1,16}$/;
		var trans_num = $("#param1").val().replace(/-/gi,''); // 010-1234-5678 = > 01012345678
		var phoneChecked = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
		$("#param1").focus();
		if($('#param1').val() === undefined || $('#param1').val() === "" || $('#param1').val().length === 0 || $.trim($('#param1').val()) === "") {
			alert("전화번호를 입력 하세요.");
			return false;
		}
		if(trans_num.length < 10) {
			alert("정확한 전화번호를 입력하세요");
			return false;
		}
		if(!phoneChecked.test(trans_num)) {
			alert("잘못된 휴대폰 번호입니다.");
			return false;
		}

		// 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
		trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");
		$("#param1").val(trans_num);

		/* var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		if (!regExp.test($('#param1').val())) {
			alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
			return false
		} */

		$.ajax({
			type : "post",
			url:"/hm/send/phoneSend.do?userPhone=" + trans_num,
			beforeSend: function() {
				lodingBarStart();
			},
			success : function(data) {
				if(data === "ok") {
					$("#phoneSend").remove();
					var str = "<div class='joinDiv'><input type='text' class='smallInput' name='joinCode' id='joinCode' style='margin-left: 30px;' />&nbsp;<span class='joinSpan'>남은 시간 :</span><span class='joinTime'><em id='joinEmTime'></em></span>";
					str += "<button type='button' class='btn' id='joinCheck'>확인</button></div>";
					$('.joinCodeinsert').append(str);
					joinClearTime();
					joinTimer();
				} else {
					alert("인증이 실패 하였습니다.");
					return false;
				}
			},
			error: function(xhs, status, error) {
				alert("통신 에러");
			},
			complete: function() {
				lodingBarEnd();
			}
		});

		/* $("#joinCheck").click(function(){
			alert(111)
		});
		#
		$("#joinCheck").on("click", function(){
			alert(2222)
		});

		$(".joinCodeinsert").on("click", "button", function() {
			alert(333)
		}); */

		// 인증코드 일치 여부
		$(document).on('click','#joinCheck',function() {
			var phoneNumber = $('#param1').val();
			$.ajax({
				url : "<c:url value='/hm/send/phoneJoinCodeCheck.do' />",
				type : "post",
				data : {joinCode : $("#joinCode").val(), phone : phoneNumber},
				dataType : "text",
				success : function(result) {
					if(result === "error") {
						alert("인증과정에서 문제가 발생하였습니다.");
						return false;
					}
					if(result === "ok") {
						alert("정상 인증 되셨습니다.");
						sendChildValue();
					} else {
						$(".falseSapn").remove();
						var str = "<span class='falseSapn'>인증코드를 다시 확인하여 주십시요.</span>";
						$('.joinCodeinsert').append(str);
					}
				}
			});
		});
	});
});

function sendChildValue() {
	var param1 = $("#param1").val();
	opener.setParentInput(param1);
	window.close();
}
</script>
<body>
<div>
	<h4>전화번호 본인 인증입니다.<br><br>총 3회만 가능합니다.</h4>
	<br>
	&nbsp;&nbsp;&nbsp;<span>
		전화번호 : <input type="text" class="popUpInput" name="param1" id="param1" maxlength="11" onkeypress="return $.onKeyPressFilter('[0-9]', event);" />
		<button class="btn btnType1 a2" type="button" id="phoneSend">인증번호 발송</button>
	</span><br><br>
	<!-- 인증번호 입력란  -->
	<div class="joinCodeinsert" style="float: left;"></div>
	<!-- &nbsp;&nbsp;&nbsp;<button class="btn btn-success btnType1 a2" type="button" onclick="sendChildValue();">전송</button> -->
</div>
</body>
</html>
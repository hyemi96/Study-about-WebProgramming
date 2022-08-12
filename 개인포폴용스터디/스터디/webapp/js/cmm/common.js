function lodingBarStart() {
	var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="/images/lodingBar/viewLoading.gif" />').appendTo(document.body).hide();
	loading.show();
}

function lodingBarEnd() {
	$("#loading").remove();		// 로딩바 종료
	$("#loading_img").remove();	// 로딩바 종료
}

/*세션 시간 체크*/
Lpad = function(str, len) {
	str = str + "";
	while (str.length < len) {
		str = "0" + str;
	}
	return str;
}

var joinSecond; //초단위로 환산
var timerchecker = null;

function joinClearTime() {
	joinSecond = 180;			// 3분(180)
}

joinTimer = function() {			// 인증 코드 시간체크
	var timer = document.getElementById("joinEmTime");
	rHour = parseInt(joinSecond / 3600);
	rHour = rHour % 60;
	rMinute = parseInt(joinSecond / 60);
	rMinute = rMinute % 60;
	rSecond = joinSecond % 60;

	if(joinSecond > 0) {
		timer.innerHTML = Lpad(rMinute, 2) + "분 " + Lpad(rSecond, 2) + "초 ";
		joinSecond--;
		timerchecker = setTimeout("joinTimer()", 1000); // 1초 간격으로 체크
	} else {
		/** 재인증을 받게 한다.**/
		/*$("#joinCode").remove();
		$(".joinSpan").remove();
		$(".joinTime").remove();
		$("#joinCheck").remove();*/
		$(".joinDiv").remove();
		$(".falseSapn").remove();
		var str = "<span class='falseSapn'>인증시간이 초과하였습니다.<br> 인증코드를 다시 발급 받아 재 인증 해주세요.</span>";
		$('.joinCodeinsert').append(str);
		return false;
	}
}


/**
 * 입력받을 수 있는 값을 필터링한다.
 * ex : <input type="text" ..... onkeypress="filterKey('[0-9]', event)"> ; 숫자만 키입력이 가능한 text filed
 * ex : <input type="text" ..... onkeypress="filterKey('[0-9a-zA-Z]', event)"> ; 영문,숫자만 키입력이 가능한 text filed
 * ex : <input type="text" ..... onkeypress="filterKey('[\u3130-\u318f\uac00-\ud7af]', event)"> ; 한글만 키입력이 가능한 text filed
 * ex : <input type="text" ..... onkeypress="filterKey('[0-9\u3130-\u318f\uac00-\ud7af]', event)"> ; 숫자,한글만 키입력이 가능한 text filed
 * @param filter 필터링할 정규표현식 ex) '[0-9]':0~9의 값만 허용, '[a-zA-Z]':알파벳만 허용
 * @param e
 * @return
 */
$.onKeyPressFilter = function(filter, e) {
	var key;
	var keychar;

	if (window.event) {
		// IE에서 이벤트를 확인하기 위한 설정
		key = window.event.keyCode;
	} else if (e) {
	  // FireFox에서 이벤트를 확인하기 위한 설정
		key = e.which;
	} else {
		return true;
	}

	if ((key == null) || (key == 0) || (key == 8) || (key == 9) || (key == 13) || (key == 27)) {
		return true;
	}

	keychar = String.fromCharCode(key);

	var re = new RegExp(filter);
	if (re.test(keychar)) return true;
	else return false;

}
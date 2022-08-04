<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
<style type="text/css">

#img1 {
	border-width: 0px;
	/* position: absolute; */
    left: 0px;
    top: 0px;
    width: 195px;
    height: 54px;
}
#img2 {
	border-width: 0px;
    /* position: absolute; */
    left: 0px;
    top: 0px;
    width: 194px;
    height: 378px;
}
</style>
 
 
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" language="javascript">
  
	/* 	$(document).ready(function(){
	alert('READY');
	}) */

/* 1번 스크립트 */
 
$(document).ready(function(){
	
	$("#btnLogin").click(function(){
		console.log("버튼클릭");
		loginCheck(); //버튼 클릭시 로그인체크 함수 부름
	});
	
	$("#userId").keyup( function( key ) {
		if (key.keyCode == 13) {
		loginCheck();
		}
	});				
});

function loginCheck(){ //로그인 체크함수
	
	console.log("loginCheck : 시작");
	
	var userId = $("#userId").val();
	var password = $("#password").val();
	
	var len = userId.length;
	var ch = userId.charAt(0);

	if( userId == "" ){
		alert('아이디를 입력하세요!');
		$("#userId").focus();
		return;
	}

	var password = $("#password").val();
	var pwCheck =  /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,14}$/;
	
	if( password == "" ) {
		alert('비밀번호를 입력하세요.');
		return;
 	}else if(password.length < 8 || 15 < password.length) {
		alert("비밀번호는 8자리 이상 15자리 미만만 입력 가능합니다.");
		$('#password').focus();
		return;  	
	}else if( !pwCheck.test(password)){
		alert('비밀번호는 영문 대문자, 소문자 특수문자로 조합해주세요.');

		$("#password").val( "" );
		$("#password").focus();
		return;		
	
	}

	console.log("loginCheck : 종료");
	
}

function userIdCheck() {
	var userId = $("#userId").val();
	
	var len = userId.length;
	var ch = userId.charAt(0);
	
	if( userId != "" ){
		for(i=0; i<len; i++) {
			ch = userId.charAt(i);
			if((ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'z')) {
				continue;
			} else {
				//$("#userIdStr").text( "영문 소문자/숫자만 입력이 가능합니다." );
				alert("영문 소문자/숫자만 입력이 가능합니다.");
				$("#userId").val( "" );
				$("#userId").focus();
				return;
			}
		}//for
	}else{
		alert("아이디를 입력하세요.");
		return;
	}
}

/* 2번 스크립트 */
function selectInsert(){

}
function selectDelete(){
	
	
	
}

/* 4번 스크립트 */
function calculation() {
	var num1 = document.getElementById('num1');
	var num2 = document.getElementById('num2');
	var num3 = document.getElementById('num3');
	var result= document.getElementById('result');
	
	var result = eval(num1.value + num2.value - num3.value);
	$("#result").html("<b><font color='red'>"+result+"</font></b>");
	result.innerHTML = "<b><font color='red'>"+result+"</font></b>";
	console.log(result);
	
	
	$("#result").val( result );
	document.getElementById('result').value = result;
}	

/* 5번 */
function fcalculation() {	
	var fnum1 = document.getElementById('fnum1').value;
	var fnum2 = document.getElementById('fnum2').value;
	var fnum3 = document.getElementById('fnum3').value;
	var fnum4 = document.getElementById('fnum4').value;
	var fresult= document.getElementById('fresult').value;
	
	var fresult = eval(fnum1 + fnum2 - fnum3 / fnum4 );
	console.log(fresult);
	
	$("#fresult").val( fresult );
	document.getElementById('fresult').value = fresult;
}

/* 6번 스크립트 */
	var cnt = 1; //전역변수 
function imgToggle() {
	console.log("imgToggle : 시작");
	var img1 = document.getElementById('img1');
	var img2 = document.getElementById('img2');
	var src1 = "resources/images/자바스크립트테스팅/u74.png"
	var src2 = "resources/images/자바스크립트테스팅/u75.png"
	if(cnt%2==1){
		img1.setAttribute('src', src2);
		img2.setAttribute('src', src1);

	} else {
		img1.setAttribute('src', src1);
		img2.setAttribute('src', src2);
	}
	cnt++;//cnt 변수 1씩 증가 시키기
	console.log(cnt);
	console.log("imgToggle : 종료");
}

/* 7번 스크립트 */	

	$(document).ready(function() { //페이지 시작시
		console.log("페이지 시작시 변경전 화면 : 7번textbefore");
	
		$('.7번before').show(); //페이지를 로드할 때 표시할 요소
		$('.7번after').hide(); //페이지를 로드할 때 숨길 요소
		
		$('#textChangeBtn').click(function(){
		$ ('.7번before').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.7번after').show(); //클릭 시 두 번째 요소 표시
		
		console.log("7번textChange : 종료");
		return false;
		});
		
		});



</script>
</head>
<body>

<div style="border: 100%" class="javascripttest">

<div class="1번-text">
!!! 주의 양식태그 form관련 input, select, textarea, checkbox, radio<br />

1. 아이디는 <strong>영문</strong> 소문자와 특수문자 @만 들어가게 체크<br />
비밍번호는 영문 대문자, 소문자 특수문자 8자리 이상 15자리 미만만 입력하게 체크<br />
아이디와 비밀번호를 입력하지 않으면 alert이 뜨게 체크!!!
</div >
<div class="1번">
<form:form commandName="userVo" method="post" action="login.mem" onsubmit="return false">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" id="userId" name="userId" value="" onkeyup="javascript: userIdCheck(); " /></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="text" id="password" name="password" value="" maxlength="14" /><span id="passwordStr"></span></td>
	</tr>
	<tr>
	<td><button type="button" id="btnLogin" name="btnLogin" style="cursor: pointer;">로그인</button></td>
	</tr>
</table>
</form:form>
</div><br><br>

<div class="2번-text">
2. 회원목록의 내용을 추가하고 목록을 삭제하는 기능 구현
"정병훈,최인회,이수진" => "정병훈,최인회" 2개로 줄어들게
"정병훈,최인회,이수진" => "정병훈,최인회,이수진,김민정" 4개로 늘어나게
</div>
<div class="2번">
회원목록<select id="selectMember">
	<option value="정병훈">정병훈</option>
	<option value="최인희">최인희</option>
	<option value="이수진" selected>이수진</option>
</select>
<input type="text" id="list" name="list" style="width: 250px;" placeholder='추가 할 회원이름을 입력해주세요.'/>
<button type="button" id="insert" name="insert" onclick="selectInsert();" >추가</button>
<button type="button" id="delete" name="delete" onclick="selectDelete();" >삭제</button>
</div><br><br> 


<div class="4번-text">
4. 계산된 값들을 합계에 설정하기
</div>
<div id="4-input" class="4-input">
<input id="num1" type="number" value="1"/>+<input id="num2" type="number" value="1233"/>-<input id="num3" type="number" value="13"/>
<!-- <input id="result" type="number" value=""/> -->
=<span id="result">결과값표시</span>
<button type="button" id="4calculation" name="4calculation" onclick="calculation();" >계산</button>
</div><br><br> 

<div class="5번-text">
5. 계산된 값들을 합계에 설정하기
</div>
<div id="5-input" class="5-input">
<input id="fnum1" type="number" value="1"/>+<input id="fnum2" type="number" value="1233"/>-<input id="fnum3" type="number" value="13"/>/<input id="fnum4" type="number" value="100"/>
=<input id="fresult" type="number" value=""/>%
<button type="button" id="fcalculation" name="fcalculation" onclick="fcalculation();" >계산</button>
</div><br><br>


<div class="6번-text">
6. 이미지 변경하기<br>
1)번 이미지가 2)번 이미지로 변경<br>
1) http://hygera.kr/images/logo-hygera.png<br>
2) http://hygera.kr/images/logo_onlyimg.png<br>
</div>
<div class="6번">
<img src="resources/images/자바스크립트테스팅/u74.png" id="img1">
<img src="resources/images/자바스크립트테스팅/u75.png" id="img2">
<input type="button" class="imgChangeBtn" id="imgChangeBtn" value="이미지 변경" onclick="imgToggle()" />
</div>



<div class="7번-text">
7, 텍스트 내용을 변경<br>
    첫번째 텍스트 에어리어에 있는 내용을 두번째 텍스트에어리어의 내용으로 변경<br>
</div>
<div class="7번">
<div id="7번before" class="7번before">
		<textarea id="7text-before" style="width: 500px; height: 300px; ">3년여 동안 돌봄 현장에서 실제 배설 상황을 측정하여 완성된 배뇨, 배변 분석 알고리즘을 기반으로 다양한 서비스를 제공 할 수 있는 글로벌 최고 수준의 원천 기술을 보유하고 있습니다.</textarea>
	</div>
<div id="7번after" class="7번after">
		<textarea id="7text-after" style="width: 500px; height: 300px;">소비재 위생 용품과 IT 융합 기술 기반의 배설 분야 돌봄 관리 시스템으로 디지털 배뇨일지부터 인공지능 배뇨훈련과 탈 기저귀까지 일상생활동작(ADL:Activities of Daily Living)을 향상시킬 수 있는 글로벌 최고의 서비스를 제공합니다. 하이제라 스마트 돌봄시스템은 디지털돌봄 서비스를 확대하기 위한 스마트 요양 시설 구축에 최적화된 시스템입니다.
돌봄 제공자에게 효과적인 업무 경감을 줄 수 있는 배뇨 자동처리 돌봄로봇을 비롯하여 배뇨장애 진단, 성인용 요실금 관리, 여성 위생용품 등에 폭넓게 사용될 수 있는 첨단 원천기술이 융합된 서비스이며, 인공지능과 사물인터넷을 적용하여 4차 산업혁명을 선도하는 디지털돌봄 시스템으로 발전될 것입니다.</textarea>
	</div>	
<input type="button" class="textChangeBtn" id="textChangeBtn" value="텍스트 변경" />
</div><br><br>



</div><!-- 전체 div영역 끝-->
</body>
</html>


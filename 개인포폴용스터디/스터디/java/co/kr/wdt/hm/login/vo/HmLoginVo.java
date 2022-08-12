package co.kr.wdt.hm.login.vo;

import java.io.Serializable;

import co.kr.wdt.common.config.annotation.Comment;
import lombok.Data;

@Data
public class HmLoginVo implements Serializable {

	private static final long serialVersionUID = -8889612207460009786L;

	@Comment("사용자 등록 번호")
	private int registNo;
	@Comment("사용자 아이디")
	private String userId;
	@Comment("사용자 비밀번호")
	private String userPw;
	@Comment("임시비밀번호")
	private String tmprPwNo;
	@Comment("사용자 이름")
	private String userNm;
	@Comment("사용자 이메일")
	private String userEmail;
	@Comment("사용자 전화번호")
	private String userPhone;
	@Comment("사용자 등급")
	private String userLevel;
	@Comment("사용자 탈퇴 여부")
	private String userDelYn;
	@Comment("사용자 탈퇴 날짜")
	private String userDelDe;
	@Comment("가입 날짜")
	private String regDe;
	@Comment("패스워드 마지막 변경일")
	private String passwordLastChangeDe;
	@Comment("패스워드 틀린 횟 수")
	private int failCnt;
	@Comment("아이피 주소")
	private String ipAddr;
	@Comment("주소 코드")
	private int addressNum;
	@Comment("첫번째 주소")
	private String address1;
	@Comment("두번째 주소")
	private String address2;
	@Comment("마지막 접속일")
	private String lastContactFmtDt;
	@Comment("otp인증키")
	private String otpKey;
	@Comment("qrUrl")
	private String otpUrl;
	@Comment("authority")
	private String authority;
}

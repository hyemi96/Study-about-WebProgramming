package co.kr.wdt.yj.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class YjVo implements Serializable {

	private static final long serialVersionUID = -8578990112588988661L;

	private String userId;
	private String userPw;
	private String userNm;
	private String userEmail;
	private String userPhone;
	private String pwChgYn;
	private String pwChgDt;
	private String pwFailCnt;
	private String idBlockYn;
	private String idBlockReason;
	private String useYn;
	private String otpYn;
	private String regDt;
}
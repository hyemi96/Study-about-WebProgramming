package co.kr.wdt.hm.login.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class HmUserAuthVo implements Serializable {

	private static final long serialVersionUID = 5070122726102587385L;

	private String userId;
	private int userSeq;
	private String userAuthCd;
	private String useYn;

	private String divGb;
	private String firstMenu;
	private String firstUrl;
	private String pgmId;
	private String userLevel;
}

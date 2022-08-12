package co.kr.wdt.common.menu.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class MenuVo implements Serializable {

	private static final long serialVersionUID = -8770736344232959037L;

	private String userId;
	private String menuId;
	private String menuNm;
	private int menuLevel;
	private String menuOrd;
	private String menuUrl;
	private String upMenuId;
	private String topYn;
	private String useYn;
	private String regId;
	private String regDt;
	private String modId;
	private String modDt;
	private String authority;

}

package co.kr.wdt.hm.user.service;

import co.kr.wdt.hm.user.vo.HmUserVo;

public interface HmUserService {

	public HmUserVo createIdCheck(HmUserVo hmUserVo);

	public HmUserVo createEmailCheck(HmUserVo hmUserVo);

	public void userCreateSuccess(HmUserVo hmUserVo);

}//서비스커밋확인

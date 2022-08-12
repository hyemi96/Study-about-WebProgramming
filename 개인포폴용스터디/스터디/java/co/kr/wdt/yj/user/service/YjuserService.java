package co.kr.wdt.yj.user.service;

import co.kr.wdt.yj.user.vo.YjUserVo;

public interface YjuserService {

	public YjUserVo createIdCheck(YjUserVo yjUserVo);

	public YjUserVo createEmailCheck(YjUserVo yjUserVo);

	public void userCreateSuccess(YjUserVo yjUserVo);

}

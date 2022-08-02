package co.kr.wdt.hm.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.hm.user.dao.HmUserDao;
import co.kr.wdt.hm.user.service.HmUserService;
import co.kr.wdt.hm.user.vo.HmUserVo;

@Service
public class HmUserServiceImpl implements HmUserService {

	@Autowired
	private HmUserDao hmUserDao;

	@Override
	public HmUserVo createIdCheck(HmUserVo hmUserVo) {
		return hmUserDao.createIdCheck(hmUserVo);
	}

	@Override
	public HmUserVo createEmailCheck(HmUserVo hmUserVo) {
		return hmUserDao.createEmailCheck(hmUserVo);
	}

	@Override
	public void userCreateSuccess(HmUserVo hmUserVo) {
		hmUserDao.userCreateSuccess(hmUserVo);
	}

}//서비스커밋확인

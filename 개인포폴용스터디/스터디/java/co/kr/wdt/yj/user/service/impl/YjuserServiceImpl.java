package co.kr.wdt.yj.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.yj.user.dao.YjuserDao;
import co.kr.wdt.yj.user.service.YjuserService;
import co.kr.wdt.yj.user.vo.YjUserVo;

@Service
public class YjuserServiceImpl implements YjuserService {

	@Autowired
	private YjuserDao yjuserDao;

	@Override
	public YjUserVo createIdCheck(YjUserVo yjUserVo) {
		return yjuserDao.createIdCheck(yjUserVo);
	}

	@Override
	public YjUserVo createEmailCheck(YjUserVo yjUserVo) {
		return yjuserDao.createEmailCheck(yjUserVo);
	}

	@Override
	public void userCreateSuccess(YjUserVo yjUserVo) {
		yjuserDao.userCreateSuccess(yjUserVo);
	}

}

package co.kr.wdt.yj.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.yj.login.dao.YjLoginDao;
import co.kr.wdt.yj.login.service.YjLoginService;
import co.kr.wdt.yj.login.vo.YjLoginVo;

@Service
public class YjLoginServiceImpl implements YjLoginService {

	@Autowired
	private YjLoginDao yjLoginDao;

	@Override
	public YjLoginVo selectUserLoginCheck(YjLoginVo yjLoginVo) {
		return yjLoginDao.selectUserLoginCheck(yjLoginVo);
	}

}

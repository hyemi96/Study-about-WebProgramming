package co.kr.wdt.hm.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.hm.login.dao.HmLoginDao;
import co.kr.wdt.hm.login.service.HmLoginService;
import co.kr.wdt.hm.login.vo.HmLoginVo;

@Service
public class HmLoginServiceImpl implements HmLoginService {

	@Autowired
	private HmLoginDao hmLoginDao;

	@Override
	public HmLoginVo selectUserLoginCheck(HmLoginVo hmLoginVo) {
		return hmLoginDao.selectUserLoginCheck(hmLoginVo);
	}

} //이건 자동임폴트 :컨트롤 +쉬프트+ o

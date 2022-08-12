package co.kr.wdt.yj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.yj.dao.YjDao;
import co.kr.wdt.yj.service.YjService;
import co.kr.wdt.yj.vo.YjVo;

@Service
public class YjServiceImpl implements YjService {

	@Autowired
	private YjDao yjDao;

	@Override
	public void mberSbscrb(YjVo vo) {
		yjDao.mberSbscrb(vo);
		yjDao.mberSbscrb2(vo);
	}

}

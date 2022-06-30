package co.kr.wdt.hm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.hm.dao.HmDao;
import co.kr.wdt.hm.service.HmService;
import co.kr.wdt.hm.vo.HmVo;

@Service
public class HmServiceImpl implements HmService {

	@Autowired
	private HmDao hmDao;

}
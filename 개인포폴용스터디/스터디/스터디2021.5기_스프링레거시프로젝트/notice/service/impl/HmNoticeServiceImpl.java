package co.kr.wdt.hm.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.hm.notice.dao.HmNoticeDao;
import co.kr.wdt.hm.notice.service.HmNoticeService;
import co.kr.wdt.hm.notice.vo.HmNoticeVo;

@Service
public class HmNoticeServiceImpl implements HmNoticeService {

	@Autowired
	private HmNoticeDao noticeDao;

	@Override
	public List<HmNoticeVo> selectNoticeList(HmNoticeVo hmNoticeVo) {
		return noticeDao.selectNoticeList(hmNoticeVo);
	}

	@Override
	public int selectNoticeTotalCnt(HmNoticeVo hmNoticeVo) {
		return noticeDao.selectNoticeTotalCnt(hmNoticeVo);
	}

/*	public List<HmNoticeVo> hminsertNoticeList(HmNoticeVo noticeVo) {
		return noticeDao.hminsertNoticeList(noticeVo); //? Object
	}*/
}

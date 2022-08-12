package co.kr.wdt.yj.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.yj.notice.dao.YjNoticeDao;
import co.kr.wdt.yj.notice.service.YjNoticeService;
import co.kr.wdt.yj.notice.vo.YjNoticeVo;

@Service
public class YjNoticeServiceImpl implements YjNoticeService {

	@Autowired
	private YjNoticeDao noticeDao;

	@Override
	public List<YjNoticeVo> selectNoticeList(YjNoticeVo noticeVo) {
		return noticeDao.selectNoticeList(noticeVo);
	}

	@Override
	public int selectNoticeTotalCnt(YjNoticeVo noticeVo) {
		return noticeDao.selectNoticeTotalCnt(noticeVo);
	}
}

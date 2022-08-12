package co.kr.wdt.hm.notice.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import co.kr.wdt.common.dao.CommonSqlDao;
import co.kr.wdt.hm.notice.vo.HmNoticeVo;

@Repository
public class HmNoticeDao extends CommonSqlDao {

	@Autowired
	private HmNoticeDao noticeDao;

	public List<HmNoticeVo> selectNoticeList(HmNoticeVo hmNoticeVo) {
		return noticeDao.selectNoticeList(hmNoticeVo);
	}

	public int selectNoticeTotalCnt(HmNoticeVo hmNoticeVo) {
		return noticeDao.selectNoticeTotalCnt(hmNoticeVo);
	}

}

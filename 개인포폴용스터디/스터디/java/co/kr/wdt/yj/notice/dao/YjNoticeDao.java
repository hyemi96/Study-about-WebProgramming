package co.kr.wdt.yj.notice.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao;
import co.kr.wdt.yj.notice.vo.YjNoticeVo;

@Repository
public class YjNoticeDao extends CommonSqlDao {

	private static String PREFIX = "YjNoticeMapper.";

	public List<YjNoticeVo> selectNoticeList(YjNoticeVo noticeVo) {
		return selectList(PREFIX + "selectNoticeList", noticeVo);
	}

	public int selectNoticeTotalCnt(YjNoticeVo noticeVo) {
		return (int) selectOne(PREFIX + "selectNoticeTotalCnt", noticeVo);
	}

}

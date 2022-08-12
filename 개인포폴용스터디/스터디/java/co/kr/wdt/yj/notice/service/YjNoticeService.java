package co.kr.wdt.yj.notice.service;

import java.util.List;

import co.kr.wdt.yj.notice.vo.YjNoticeVo;

public interface YjNoticeService {

	public List<YjNoticeVo> selectNoticeList(YjNoticeVo noticeVo);

	public int selectNoticeTotalCnt(YjNoticeVo noticeVo);

}

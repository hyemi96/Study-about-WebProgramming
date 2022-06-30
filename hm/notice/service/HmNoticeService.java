package co.kr.wdt.hm.notice.service;

import java.util.List;


import co.kr.wdt.hm.notice.vo.HmNoticeVo;

public interface HmNoticeService {

	public List<HmNoticeVo> selectNoticeList(HmNoticeVo hmNoticeVo);

	public int selectNoticeTotalCnt(HmNoticeVo hmNoticeVo);


}

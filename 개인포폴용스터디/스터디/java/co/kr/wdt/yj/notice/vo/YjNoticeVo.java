package co.kr.wdt.yj.notice.vo;

import co.kr.wdt.common.page.vo.PageVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class YjNoticeVo extends PageVo {

	private static final long serialVersionUID = -5276834341473188536L;

	private int noticeSeq;
	private String noticeWriterId;
	private String noticeSubject;
	private String noticeContents;
	private String noticeRegId;
	private String noticeRegDt;
	private String noticeModId;
	private String noticeModDt;
	private String noticeDelId;
	private String noticeDelDt;
	private int noticeViews;
	private String useYn;
	private String pageCnt;
	private String search;
	private String orderType;
}

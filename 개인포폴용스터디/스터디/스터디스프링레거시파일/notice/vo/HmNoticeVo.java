package co.kr.wdt.hm.notice.vo;

import java.io.Serializable;

import co.kr.wdt.common.page.vo.PageVo;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HmNoticeVo extends PageVo {


	private static final long serialVersionUID = -8678600819895353730L;

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
}

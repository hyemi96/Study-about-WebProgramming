package co.kr.wdt.yj.notice.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.wdt.yj.notice.service.YjNoticeService;
import co.kr.wdt.yj.notice.vo.YjNoticeVo;

/**
 * 공지사항 Controller
 *
 * @author 정영진
 * @since 2021. 06. 26.
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일		      수정자		                         수정내용
 *  -------    	 --------    ---------------------------
 * 2021. 06. 26.   정영진                                     최초생성
 *
 *
 * </pre>
 */

@Controller
@RequestMapping(value="/yj")
public class YjNoticeController {

	private Log log = LogFactory.getLog(YjNoticeController.class);

	@Autowired
	private YjNoticeService noticeService;

	/**
	 * @Method noticeListPage
	 * @Date 2021. 06. 26.
	 * @Writter sky(정영진)
	 * @Param NoticeVo
	 * @Param Model
	 * @EditHistory
	 * @Discript 공지사항 페이지.
	 * @Return String
	 */

	@RequestMapping(value="/noticeListPage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeListPage(@ModelAttribute("pageVo") YjNoticeVo noticeVo, Model model) throws Exception {
		if("".equals(noticeVo.getOrderType()) || noticeVo.getOrderType() == null) noticeVo.setOrderType("date");
		if("".equals(noticeVo.getPageCnt()) || noticeVo.getPageCnt() == null) noticeVo.setPageSize(10);
		else noticeVo.setPageSize(Integer.parseInt(noticeVo.getPageCnt()));
		int noticeTotalCnt = 0;

		try {
			noticeTotalCnt = noticeService.selectNoticeTotalCnt(noticeVo);
		} catch (Exception e) {
			noticeTotalCnt = 10;
		}

		noticeVo.setTotalCount(noticeTotalCnt);
		List<YjNoticeVo> noticeList = noticeService.selectNoticeList(noticeVo);
		model.addAttribute("noticeList", noticeList);
		// model.addAttribute("pageVo", noticeVo);
		model.addAttribute("noticeListCnt", noticeVo.getEndRowNo());
		model.addAttribute("noticeTotalCnt", noticeTotalCnt);
		model.addAttribute("noticeListCnt", noticeVo.getTotalCount());
		model.addAttribute("pageCnt", noticeVo.getPageCnt());
		model.addAttribute("search", noticeVo.getSearch());
		return "yj/notice/noticeListPage";
	}


	/**
	 * @Method noticeDetailPage
	 * @Date 2021. 07. 03.
	 * @Writter sky(정영진)
	 * @Param NoticeVo
	 * @Param Model
	 * @EditHistory
	 * @Discript 공지사항 상세페이지.
	 * @Return String
	 */

	@RequestMapping(value="/noticeDetailPage.do", method = RequestMethod.POST)
	public String noticeDetailPage(@ModelAttribute YjNoticeVo noticeVo, Model model) {
		System.out.println(">>>>>>>>>>>>>>>> :: " + noticeVo.toString());
		return "yj/notice/noticeDetailPage";
	}


}

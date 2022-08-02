package co.kr.wdt.hm.notice.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import co.kr.wdt.br.notice.vo.BrNoticeVo;
import co.kr.wdt.hm.notice.service.HmNoticeService;
import co.kr.wdt.hm.notice.vo.HmNoticeVo;

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
@RequestMapping(value="/hm")
public class HmNoticeController {

	private Log log = LogFactory.getLog(HmNoticeController.class);

	@Autowired
	private HmNoticeService noticeService;

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
	public String noticeListPage(@ModelAttribute("pageVo") HmNoticeVo hmNoticeVo, Model model) throws Exception {
		if("".equals(hmNoticeVo.getPageCnt()) || hmNoticeVo.getPageCnt() == null) hmNoticeVo.setPageSize(10);
		else hmNoticeVo.setPageSize(Integer.parseInt(hmNoticeVo.getPageCnt()));
		int noticeTotalCnt = 0;

		try {
			noticeTotalCnt = noticeService.selectNoticeTotalCnt(hmNoticeVo);
		} catch (Exception e) {
			noticeTotalCnt = 10;
		}

		hmNoticeVo.setTotalCount(noticeTotalCnt);
		List<HmNoticeVo> noticeList = noticeService.selectNoticeList(hmNoticeVo);
		model.addAttribute("noticeList", noticeList);
		// model.addAttribute("pageVo", noticeVo);
		model.addAttribute("noticeListCnt", hmNoticeVo.getEndRowNo());
		model.addAttribute("noticeTotalCnt", noticeTotalCnt);
		model.addAttribute("noticeListCnt", hmNoticeVo.getTotalCount());
		model.addAttribute("pageCnt", hmNoticeVo.getPageCnt());
		model.addAttribute("search", hmNoticeVo.getSearch());
		return "hm/notice/noticeListPage";
	}


	@RequestMapping(value="/noticeWritePage.do", method=RequestMethod.GET)
	public String hmnoticeWritePage(@ModelAttribute HmNoticeVo noticeVo, Model model) {
		//List<HmNoticeVo> noticeList = noticeService.hminsertNoticeList(noticeVo);
		//model.addAttribute("noticeList", noticeList);
		return "hm/notice/noticeWritePage";
	}

	@RequestMapping(value="/noticeDetailPage.do", method={RequestMethod.GET})
	public ModelAndView noticeDetailPage() {
		ModelAndView mv = new ModelAndView("hm/notice/noticeDetailPage");
		return mv;
	}

/*	@RequestMapping(value="/noticeDetailPage.do", method=RequestMethod.GET)
	public String login() {
		return "hm/notice/noticeWritePage";
	} 컨트롤러커밋확인    */

}

package co.kr.wdt.yj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.kr.wdt.yj.service.YjService;
import co.kr.wdt.yj.vo.YjVo;

@Controller
@RequestMapping(value="/js")
public class YjController {

	@Autowired
	private YjService yjService;

	@RequestMapping(value="/jsHtmlTest.do", method=RequestMethod.GET)
	public ModelAndView jsHtmlTest() {
		ModelAndView mv = new ModelAndView("js/jsHtmlTest");
		return mv;
	}

	@RequestMapping(value="/mberSbscrb.do", method=RequestMethod.POST)
	public String mberSbscrb(@ModelAttribute YjVo vo, Model model) {
		System.out.println(">>>>>>>>>>>>>>>>>> :: " + vo.toString());

		yjService.mberSbscrb(vo);
		model.addAttribute("userInfo", vo);
		return "js/mberSbscrb";
	}

	@RequestMapping(value="/mberSbscrb2.do", method=RequestMethod.POST)
	@ResponseBody
	public String mberSbscrb2(@ModelAttribute YjVo vo, Model model) {
		System.out.println("@@@@@@@@@@@@@ :: " + vo.toString());
		model.addAttribute("userInfo", vo);
		return "js/mberSbscrb";
	}

	@RequestMapping(value="/mberSbscrb3.do", method=RequestMethod.POST)
	@ResponseBody
	public String mberSbscrb3(@RequestParam String userId, @RequestParam String userPw, Model model) {
		System.out.println("@@@@@@@@@@ userId :: " + userId);
		System.out.println("@@@@@@@@@@ userPw :: " + userPw);
		return "js/mberSbscrb";
	}

	@RequestMapping(value="/userCratePage.do", method=RequestMethod.GET)
	public String userCratePage() {
		return "yj/userCratePage";
	}

}
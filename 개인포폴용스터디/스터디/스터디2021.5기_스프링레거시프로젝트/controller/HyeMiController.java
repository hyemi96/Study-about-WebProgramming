package co.kr.wdt.hm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/hm")
public class HyeMiController {

	@RequestMapping(value="/hyeMiTestPage.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView hyeMiTestPage() {
		ModelAndView mv = new ModelAndView("hm/hyeMiTestPage");
		return mv;
	}
}
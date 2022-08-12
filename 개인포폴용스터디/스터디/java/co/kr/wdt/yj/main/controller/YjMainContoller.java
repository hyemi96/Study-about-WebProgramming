package co.kr.wdt.yj.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 메인 Controller
 *
 * @author 정영진
 * @since 2021. 06. 05.
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일		      수정자		                         수정내용
 *  -------    	 --------    ---------------------------
 * 2021. 06. 05.   정영진                                     최초생성
 *
 *
 * </pre>
 */

@Controller
@RequestMapping(value="/yj/main")
public class YjMainContoller {

	/**
	 * @Method yjMainPage
	 * @Date 2021. 06. 05.
	 * @Writter sky(정영진)
	 * @Param YjMainVo
	 * @Param HttpServletRequest
	 * @Param HttpServletResponse
	 * @EditHistory
	 * @Discript 메인페이지.
	 * @Return String
	 */

	@RequestMapping(value="/yjMainPage.do", method=RequestMethod.GET)
	public String yjMainPage() {
		return "yj/main/yjMainPage";
	}
}

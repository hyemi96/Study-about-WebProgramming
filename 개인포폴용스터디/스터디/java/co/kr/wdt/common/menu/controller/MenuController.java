package co.kr.wdt.common.menu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.wdt.common.menu.service.MenuService;
import co.kr.wdt.common.menu.vo.MenuVo;

/**
 * 메뉴 Controller
 *
 * @author 정영진
 * @since 2021. 06. 19.
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일		      수정자		                         수정내용
 *  -------    	 --------    ---------------------------
 * 2021. 06. 19.   정영진                                     최초생성
 *
 *
 * </pre>
 */

@Controller
public class MenuController {

	private Log log = LogFactory.getLog(MenuController.class);

	@Autowired
	private MenuService menuService;

	/**
	 * @Method setLeftPage
	 * @Date 2021. 06. 19.
	 * @Writter sky(정영진)
	 * @Param MenuVo
	 * @Param Model
	 * @Param HttpServletRequest
	 * @EditHistory
	 * @Discript 좌측 화면 구성.
	 * @Return String
	 */

	@RequestMapping(value= {"/", "/left.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public String setLeftPage(@ModelAttribute MenuVo menuVo, Model model, HttpSession session){
		log.info(">>>>>> 좌측 메뉴 호출");
		List<MenuVo> leftMenuList = menuService.selectLeftMenuList(menuVo, session);
		model.addAttribute("leftMenuList", leftMenuList);
		return "common/include-left";
	}

}

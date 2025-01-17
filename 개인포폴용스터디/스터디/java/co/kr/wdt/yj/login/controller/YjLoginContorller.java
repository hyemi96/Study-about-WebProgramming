package co.kr.wdt.yj.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.wdt.common.util.GetClientIp;
import co.kr.wdt.common.util.LoginManager;
import co.kr.wdt.yj.login.service.YjLoginService;
import co.kr.wdt.yj.login.vo.YjLoginVo;
import co.kr.wdt.yj.login.vo.YjUserAuthVo;

/**
 * 로그인 Controller
 *
 * @author 정영진
 * @since 2021. 05. 29.
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일		      수정자		                         수정내용
 *  -------    	 --------    ---------------------------
 * 2021. 05. 29.   정영진                                     최초생성
 *
 *
 * </pre>
 */

@Controller
@RequestMapping(value="/yj")
public class YjLoginContorller {

	@Autowired
	private YjLoginService yjLoginService;

	@RequestMapping(value="/login/login.do", method=RequestMethod.GET)
	public String login() {
		return "yj/login/login";
	}

	/**
	 * @Method loginChek
	 * @Date 2021. 05. 29.
	 * @Writter sky(정영진)
	 * @Param YjLoginVo
	 * @Param HttpServletRequest
	 * @Param HttpServletResponse
	 * @EditHistory
	 * @Discript 로그인 체크.
	 * @Return String
	 */

	@RequestMapping(value="/login/loginChek.do", method=RequestMethod.POST)
	public String loginChek(@ModelAttribute YjLoginVo yjLoginVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String redirectUrl = "redirect:/yj/main/yjMainPage.do";
		String loginId  = (request.getParameter("userId") != null) ? request.getParameter("userId") : "";
		String password = (request.getParameter("userPw") != null) ? request.getParameter("userPw") : "";

		// 카카오톡 로그인 & 네이버 로그인 인증 추가
		String success = (request.getParameter("success") != null) ? request.getParameter("success") : "";

		LoginManager loginManager = LoginManager.getInstance();

		yjLoginVo.setUserId(loginId);

		YjLoginVo checkLoginVo = new YjLoginVo();
		checkLoginVo = yjLoginService.selectUserLoginCheck(yjLoginVo);

		YjUserAuthVo userAuthVo = new YjUserAuthVo();
		userAuthVo.setFirstUrl("/yj/main/mainView.do");

		// 카카오톡 로그인 & 네이버 로그인 인증 추가
		if(success.equals("success")) {
			loginManager.setSession(request.getSession(), "guest");
			HttpSession session = request.getSession();
			session.setAttribute("userNm", request.getParameter("nickname"));
			session.setAttribute("divGb", userAuthVo.getDivGb());
			session.setAttribute("firstUrl", userAuthVo.getFirstUrl());
			session.setAttribute("ipAddr", GetClientIp.getClientIP(request));
			session.setAttribute("userId", "guest");
			session.setAttribute("userLevel", "5");
			yjLoginVo.setIpAddr(GetClientIp.getClientIP(request));
			return redirectUrl;
		}

		if(checkLoginVo == null) {
			redirectUrl = "redirect:/yj/login/login.do?LOGIN_ERR=IDNE";
			// yjLoginVo.setUserId(loginId);
		} else {
			if(!checkLoginVo.getUserId().equals(loginId)) {
				redirectUrl = "redirect:/yj/login/login.do?LOGIN_ERR=IDNE";
				// yjLoginVo.setUserId(checkLoginVo.getUserId());
			} else if(!BCrypt.checkpw(password, checkLoginVo.getUserPw())) {
				redirectUrl = "redirect:/yj/login/login.do?LOGIN_ERR=IDNE";
			} else {
				//이미 접속한 아이디인지 체크한다.
				if(!loginManager.isUsing(loginId)) {
					loginManager.setSession(request.getSession(), loginId);
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("userId", loginId);
					session.setAttribute("userLevel", userAuthVo.getUserLevel());
					redirectUrl = "redirect:/yj/login/login.do?LOGIN_ERR=IDDUP";
					return redirectUrl;
				}

				HttpSession session = request.getSession();
				session.setAttribute("lastContactFmtDt", checkLoginVo.getLastContactFmtDt());
				session.setAttribute("userId", checkLoginVo.getUserId());
				session.setAttribute("userNm", checkLoginVo.getUserNm());
				session.setAttribute("address1", checkLoginVo.getAddress1());
				session.setAttribute("address2", checkLoginVo.getAddress2());
				session.setAttribute("authority", checkLoginVo.getAuthority());
				session.setAttribute("divGb", userAuthVo.getDivGb());
				session.setAttribute("firstMenu", userAuthVo.getFirstMenu());
				session.setAttribute("firstUrl", userAuthVo.getFirstUrl());
				session.setAttribute("ipAddr", GetClientIp.getClientIP(request));
				yjLoginVo.setIpAddr(GetClientIp.getClientIP(request));
			}
		}
		return redirectUrl;
	}

	@RequestMapping(value="/login/logOut.do", method=RequestMethod.POST)
	@ResponseBody
	public void logOut(HttpSession session, HttpServletRequest request) {
		LoginManager loginManager = LoginManager.getInstance();
		String userId = (String) session.getAttribute("userId");
		if(userId == null) {
			loginManager.removeSession("");
		} else {
			request.getSession().invalidate();
		}
	}
}

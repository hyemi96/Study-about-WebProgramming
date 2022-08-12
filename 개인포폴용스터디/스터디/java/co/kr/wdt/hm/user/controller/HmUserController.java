package co.kr.wdt.hm.user.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.wdt.common.util.CertificationKeyGenerator;
import co.kr.wdt.common.util.GetClientIp;
import co.kr.wdt.common.util.dao.CertifiDAO;
import co.kr.wdt.hm.user.vo.HmUserVo;
import co.kr.wdt.hm.user.service.HmUserService;


/**
 * 사용자(유저) Controller
 *
 * @author 정영진
 * @since 2021. 05. 22.
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일		      수정자		                         수정내용
 *  -------    	 --------    ---------------------------
 * 2021. 05. 22.   정영진                                     최초생성
 *
 *
 * </pre>
 */

@Controller
@RequestMapping(value="/hm")
public class HmUserController {

	private Log log = LogFactory.getLog(HmUserController.class);
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private CertifiDAO certifiDAO;

	@Autowired
	private HmUserService hmUserService;


	@RequestMapping(value="/user/userRegister.do", method=RequestMethod.GET)
	public String userCratePage(Model model, HttpServletRequest request) {
		model.addAttribute("clientIP", GetClientIp.getClientIP(request));
		return "hm/user/userRegister";
	}

	/**
	 * @Method phoneSendPop
	 * @Date 2021. 05. 22.
	 * @Writter sky(정영진)
	 * @EditHistory
	 * @Discript 본인확인 팝업창.
	 * @Return String
	 */

	@RequestMapping(value="/send/phoneSendPop.do")
	public String phoneSendPop() {
		return "hm/user/phoneSendPop";
	}

	/**
	 * @Method phoneSend
	 * @Date 2021. 05. 22.
	 * @Writter sky(정영진)
	 * @Param String
	 * @EditHistory
	 * @Discript 인증키 전송.
	 * @Return String
	 */

	@RequestMapping(value="/send/phoneSend.do", method=RequestMethod.POST)
	@ResponseBody
	public String phoneSend(@RequestParam("userPhone") String userPhone) throws Exception {
		log.info("전화번호에 대한 인증키 생성을 시행합니다.");
		log.info("전화번호 : " + userPhone);
		try {
			//인증키 삭제&생성 루틴 실행
			CertificationKeyGenerator.newInstance().tempKeyGenerator(certifiDAO, userPhone);
			return "ok";
		} catch(Exception e) {
			return "fal";
		}
	}

	/**
	 * @Method phoneJoinCodeCheck
	 * @Date 2021. 05. 22.
	 * @Writter sky(정영진)
	 * @Param String
	 * @Param String
	 * @EditHistory
	 * @Discript 본인확인 인증.
	 * @Return String
	 */

	@RequestMapping(value = "/send/phoneJoinCodeCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String phoneJoinCodeCheck(String phone, String joinCode) throws Exception {
		log.info("sms인증을위해 디비와 값매칭을 시도합니다.");
		log.info("joinCode : " + joinCode);
		log.info("phone : " + phone);
		try{
			if(CertificationKeyGenerator.newInstance().isCorrectCertifiKey(certifiDAO, phone, joinCode)){
				return "ok";
			} else {
				return "fal";
			}
		} catch(Exception e) {
			return "error";
		}
	}

	/**
	 * @Method createIdAndEmailCheck
	 * @Date 2021. 05. 29.
	 * @Writter sky(정영진)
	 * @Param YjUserVo
	 * @EditHistory
	 * @Discript 중복 E-mail 및 아이디 체크.
	 * @Return String
	 */

	@RequestMapping(value="/createIdAndEmailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String createIdAndEmailCheck(@ModelAttribute("hmUserVo") HmUserVo hmUserVo) {
		HmUserVo idCheckUserVo = hmUserService.createIdCheck(hmUserVo);//에러
		HmUserVo emailCheckUserVo = hmUserService.createEmailCheck(hmUserVo);
		if(idCheckUserVo == null && emailCheckUserVo == null) return "ok";
		else return "fal";
	}

	/**
	 * @Method userCreateSuccess
	 * @Date 2021. 05. 29.
	 * @Writter sky(정영진)
	 * @Param YjUserVo
	 * @Param Model
	 * @Param HttpServletResponse
	 * @EditHistory
	 * @Discript 신규 회원가입.
	 * @Return String
	 */

	@RequestMapping(value="/userCreateSuccess.do", method=RequestMethod.POST)
	public void userCreateSuccess(@ModelAttribute("hmUserVo")/* @Valid */ HmUserVo hmUserVo, /*BindingResult result,*/ HttpServletResponse response, Model model) throws Exception {
		// 유효성 검사에서 해당이 있을경우 아래 @valid에 걸려서 view로 리턴후 화면에 메세지 프로퍼티에 설정한 값으로 출력해준다
		/*if(result.hasErrors()) {
			return "user/user/userCreatePage";
		}*/

		/*String encryptPassWord = "";
		encryptPassWord = (String)Sha256Util.encrypt(userVo.getUserPw());
		userVo.setUserPw(encryptPassWord);*/		// 암호화 저장

		String hashPassword = BCrypt.hashpw(hmUserVo.getUserPw(), BCrypt.gensalt());
		hmUserVo.setUserPw(hashPassword);		// 암호화 저장

		if(StringUtils.isNotBlank(hmUserVo.getUserPhone())) {
			hmUserVo.setUserPhone(hmUserVo.getUserPhone().replaceAll("-", "").replaceAll(" ", ""));
		}

		hmUserService.userCreateSuccess(hmUserVo);

		//PrintWrtier에서 한글 인코딩이 깨지는 경우 셋팅
		//반드시 PrintWriter 객체 선언하기 전에 셋팅해줘야 함
		//response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('정상적으로 회원가입이되었습니다.\\n로그인 페이지로 이동합니다.'); location.href='/hm/login/login.do'</script>");
		out.flush();	// 현재 출력 버퍼에 저장되어 있는 내용을 웹 브라우저에 전송하고 비운다.
	}

}

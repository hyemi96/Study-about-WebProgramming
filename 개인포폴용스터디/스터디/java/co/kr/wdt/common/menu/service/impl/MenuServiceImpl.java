package co.kr.wdt.common.menu.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.common.menu.dao.MenuDao;
import co.kr.wdt.common.menu.service.MenuService;
import co.kr.wdt.common.menu.vo.MenuVo;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;

	@Override
	public List<MenuVo> selectLeftMenuList(MenuVo menuVo, HttpSession session) {
		if(session.getAttribute("userId") == null) menuVo.setUserId("test");
		else menuVo.setUserId((String) session.getAttribute("userId"));
		return menuDao.selectLeftMenuList(menuVo);
	}

	/*@Override
	public List<MenuVo> selectSubMenuList(MenuVo menuVo) {
		return menuDao.selectSubMenuList(menuVo);
	}*/
}
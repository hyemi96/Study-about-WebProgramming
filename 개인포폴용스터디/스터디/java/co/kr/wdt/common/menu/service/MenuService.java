package co.kr.wdt.common.menu.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import co.kr.wdt.common.menu.vo.MenuVo;

public interface MenuService {

	public List<MenuVo> selectLeftMenuList(MenuVo menuVo, HttpSession session);

}
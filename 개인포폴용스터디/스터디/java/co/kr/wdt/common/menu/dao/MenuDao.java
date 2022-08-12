package co.kr.wdt.common.menu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao;
import co.kr.wdt.common.menu.vo.MenuVo;

@Repository
public class MenuDao extends CommonSqlDao {

	private final String PREFIX = "MenuMapper.";

	public List<MenuVo> selectLeftMenuList(MenuVo menuVo) {
		return selectList(PREFIX + "selectLeftMenuList", menuVo);
	}

	/*public List<MenuVo> selectSubMenuList(MenuVo menuVo) {
		return selectList(PREFIX + "selectSubMenuList", menuVo);
	}*/
}
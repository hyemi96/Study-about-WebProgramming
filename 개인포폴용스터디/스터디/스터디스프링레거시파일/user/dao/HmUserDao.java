package co.kr.wdt.hm.user.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao;
import co.kr.wdt.hm.user.vo.HmUserVo;

@Repository
public class HmUserDao extends CommonSqlDao {

	private final String PREFIX = "HmUserMapper.";

	public HmUserVo createIdCheck(HmUserVo hmUserVo) {
		return (HmUserVo) selectOne(PREFIX + "createIdCheck", hmUserVo);
	}

	public HmUserVo createEmailCheck(HmUserVo hmUserVo) {
		return (HmUserVo) selectOne(PREFIX + "createEmailCheck", hmUserVo);
	}

	public void userCreateSuccess(HmUserVo hmUserVo) {
		insert(PREFIX + "userCreateSuccess", hmUserVo);
	}

}

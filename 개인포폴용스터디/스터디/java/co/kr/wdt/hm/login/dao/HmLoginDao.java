package co.kr.wdt.hm.login.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao;
import co.kr.wdt.hm.login.vo.HmLoginVo;

@Repository
public class HmLoginDao extends CommonSqlDao {

	private final String PREFIX = "HmLoginMapper.";

	public HmLoginVo selectUserLoginCheck(HmLoginVo hmLoginVo) {
		return (HmLoginVo) selectOne(PREFIX + "selectUserLoginCheck", hmLoginVo);
	}

}

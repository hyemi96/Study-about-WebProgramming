package co.kr.wdt.yj.login.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao;
import co.kr.wdt.yj.login.vo.YjLoginVo;

@Repository
public class YjLoginDao extends CommonSqlDao {

	private final String PREFIX = "YjLoginMapper.";

	public YjLoginVo selectUserLoginCheck(YjLoginVo yjLoginVo) {
		return (YjLoginVo) selectOne(PREFIX + "selectUserLoginCheck", yjLoginVo);
	}

}

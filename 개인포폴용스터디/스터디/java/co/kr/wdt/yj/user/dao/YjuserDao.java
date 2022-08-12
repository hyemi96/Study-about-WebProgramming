package co.kr.wdt.yj.user.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao;
import co.kr.wdt.yj.user.vo.YjUserVo;

@Repository
public class YjuserDao extends CommonSqlDao {

	private final String PREFIX = "YjUserMapper.";

	public YjUserVo createIdCheck(YjUserVo yjUserVo) {
		return (YjUserVo) selectOne(PREFIX + "createIdCheck", yjUserVo);
	}

	public YjUserVo createEmailCheck(YjUserVo yjUserVo) {
		return (YjUserVo) selectOne(PREFIX + "createEmailCheck", yjUserVo);
	}

	public void userCreateSuccess(YjUserVo yjUserVo) {
		insert(PREFIX + "userCreateSuccess", yjUserVo);
	}

}

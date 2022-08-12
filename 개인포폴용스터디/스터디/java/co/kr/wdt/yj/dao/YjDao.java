package co.kr.wdt.yj.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao;
import co.kr.wdt.yj.vo.YjVo;

@Repository
public class YjDao extends CommonSqlDao {

	public void mberSbscrb(YjVo vo) {
		System.out.println("@@@@@@@@@@@@@ :: " + vo.toString());
		insert("TestMapper.insertMberSbscrb", vo);
	}

	public void mberSbscrb2(YjVo vo) {
		selectList("TestMapper.mberSbscrb2");
	}

}
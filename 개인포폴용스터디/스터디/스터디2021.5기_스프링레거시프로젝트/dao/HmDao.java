package co.kr.wdt.hm.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao;
import co.kr.wdt.hm.vo.HmVo;

@Repository
public class HmDao extends CommonSqlDao {
//상속 -추상ㅁㅔ소드 
	public void mberRegister(HmVo vo) {
		System.out.println("@@@@ :: " + vo.toString());
		insert("TestMapper.insertMberSbscrb", vo); //TestMapper:
	}

	public void mberRegister2(HmVo vo) {
		selectList("TestMapper.mberSbscrb2");
	}

}
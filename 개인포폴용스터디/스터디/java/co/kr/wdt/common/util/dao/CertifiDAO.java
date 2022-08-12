package co.kr.wdt.common.util.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao;

@Repository
public class CertifiDAO extends CommonSqlDao {

	private final String PREFIX = "PhoneCertificationMapper.";

	public void deleteTempKey(String phone) {
		delete(PREFIX + "deleteTempKey", phone);
	}

	public String getTempKey(String phone) {
		return (String)selectOne(PREFIX + "getTempKey", phone);
	}

	public void insertCertificationKey(HashMap<Object, Object> param) {
		insert(PREFIX + "insertCertificationKey", param);
	}
}
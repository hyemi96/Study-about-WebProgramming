package co.kr.wdt.common.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CommonSqlDao {
	protected Log log = LogFactory.getLog(CommonSqlDao.class);

	@Autowired
	@Resource(name="sqlSession")
	private SqlSessionTemplate sqlSession;

	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}

	public Object insert(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}

	public Object update(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}

	public Object delete(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}

	public Object selectOne(String queryId){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}

	public Object selectOne(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}

	public String selectString(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}

	public int getSelect(String paramString, Object paramObject){
		return sqlSession.selectOne(paramString, paramObject);
	}

	public <E> List<E> selectList(String queryId){
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}

	public <E> List<E> selectList(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}

	public HashMap<String, String> selectHashStringOne(String queryId){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}

	public HashMap<String, Object> selectHashObjectOne(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId,params);
	}
}

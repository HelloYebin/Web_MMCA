package com.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.vo.CollectionVO;
import com.web.vo.FaqVO;

public class FaqDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace="mapper.faq";
	
	public int insert(Object obj) {
		FaqVO vo=(FaqVO)obj;
		return sqlSession.insert(namespace+".insert", vo);
	}
	
	public int getCount(String faCategory) {
		return sqlSession.selectOne(namespace+".count",faCategory);
	}
	
	public List<Object> select(int startCount, int endCount, String faCategory){
		Map<String, String> param=new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("faCategory", faCategory);
		
		return sqlSession.selectList(namespace+".selectList",param);
	}
	
	public Object select(String faId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectContent", faId);
	}


	public int update(Object obj) {
		// TODO Auto-generated method stub
		FaqVO vo=(FaqVO)obj;
		return sqlSession.update(namespace+".update", vo);		
	}

	public int delete(String faId) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".deleteContent", faId);
	}


}

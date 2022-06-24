package com.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.vo.DigitalMovieVO;
import com.web.vo.OffNowVO;

public class OffNowDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace="mapper.offnowMv";
	
	
	public int insert(Object obj) {
		OffNowVO vo=(OffNowVO)obj;
		return sqlSession.insert(namespace+".insert", vo);
	}
	  
	 
	
	public int getCount() {
		return sqlSession.selectOne(namespace+".count");
	}
	
	public int getCount(String searchtext) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".countSearch",searchtext);
	}
	
	public int getCountCategory(String category) {
		return sqlSession.selectOne(namespace+".countCategory",category);
	}
	
	public List<Object> select(int startCount, int endCount){
		Map<String, String> param=new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		
		return sqlSession.selectList(namespace+".selectList",param);
	}

	public OffNowVO select(String exId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectContent", exId);
	}
	
	public int delete(String exId) {
		return sqlSession.delete(namespace+".deleteContent", exId);
	}
	
	/*
	 * public int update(Object obj) { OffNowVO vo=(OffNowVO)obj; vo.setCategory();
	 * vo.setProgram(); return sqlSession.update(namespace+".update", vo); }
	 */
	
	public String getOldFileName(String exId){
		return sqlSession.selectOne(namespace+".getSfile", exId);
	}

	public void updateHits(String exId) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateHit", exId);
	}

	public List<Object> select(int startCount, int endCount, String searchtext) {
		// TODO Auto-generated method stub
		Map<String, String> param=new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("searchtext", searchtext);
		
		return sqlSession.selectList(namespace+".selectListSearch",param);
	}
	
	public List<Object> selectCategory(int startCount, int endCount, String category) {
		// TODO Auto-generated method stub
		Map<String, String> param=new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("category", category);
		
		return sqlSession.selectList(namespace+".selectListCategory",param);
	}



	public int update(Object obj) {
		// TODO Auto-generated method stub
		OffNowVO vo=(OffNowVO)obj;
		return sqlSession.update(namespace+".update", vo);
	}

	

	
}

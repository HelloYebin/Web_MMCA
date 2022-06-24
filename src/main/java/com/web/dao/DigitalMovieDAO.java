package com.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.vo.DigitalMovieVO;

public class DigitalMovieDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace="mapper.digitalMv";
	
	public int insert(Object obj) {
		DigitalMovieVO vo=(DigitalMovieVO)obj;
		vo.setCategory();
		vo.setProgram();
		return sqlSession.insert(namespace+".insert", vo);
	}
	
	public int getCount() {
		return sqlSession.selectOne(namespace+".count");
	}
	
	public int getCount(String searchtext) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".countSearch",searchtext);
	}
	
	public List<Object> select(int startCount, int endCount){
		Map<String, String> param=new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		
		return sqlSession.selectList(namespace+".selectList",param);
	}

	public DigitalMovieVO select(String dmId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectContent", dmId);
	}
	
	public int delete(String dmId) {
		return sqlSession.delete(namespace+".deleteContent", dmId);
	}
	
	public int update(Object obj) {
		DigitalMovieVO vo=(DigitalMovieVO)obj;
		vo.setCategory();
		vo.setProgram();
		return sqlSession.update(namespace+".update", vo);
	}
	
	public String getOldFileName(String dmId){
		return sqlSession.selectOne(namespace+".getSfile", dmId);
	}

	public void updateHits(String dmId) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateHit", dmId);
	}

	public List<Object> select(int startCount, int endCount, String searchtext) {
		// TODO Auto-generated method stub
		Map<String, String> param=new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("searchtext", searchtext);
		
		return sqlSession.selectList(namespace+".selectListSearch",param);
	}

	
}

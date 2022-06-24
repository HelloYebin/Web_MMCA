package com.web.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.vo.NoticeVO;


public class NoticeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace="mapper.notice";
	
	public int insert(Object obj) {
		NoticeVO vo= (NoticeVO)obj;
		vo.setnWriter("test");
		return sqlSession.insert(namespace+".insert", vo);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".count");
	}
	
	public int getCount(String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		
		int result=0;
		if(searchcategory.equals("title")) {
			result=sqlSession.selectOne(namespace+".countSearchTitle",searchtext);
		}else if(searchcategory.equals("content")) {
			result=sqlSession.selectOne(namespace+".countSearchContent",searchtext);
		}else {
			result=sqlSession.selectOne(namespace+".countSearchCategory",searchtext);
		}	
		return result;
	}
	
	public List<Object> select(int startCount, int endCount){
		Map<String, String> param=new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		
		return sqlSession.selectList(namespace+".selectList", param);
	}
	
	public List<Object> select(int startCount, int endCount, String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		Map<String, String> param=new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("searchtext", searchtext);
		
		if(searchcategory.equals("title")) {
			return sqlSession.selectList(namespace+".selectListSearchTitle",param);
		}else if(searchcategory.equals("content")) {
			return sqlSession.selectList(namespace+".selectListSearchContent",param);
		}else {
			return sqlSession.selectList(namespace+".selectListSearchCategory",param);
		}	
		
	}
	
	public Object select(String nId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".content",nId);
	}


	public int update(Object obj) {
		// TODO Auto-generated method stub
		NoticeVO vo=(NoticeVO)obj;
		return sqlSession.update(namespace+".update", vo);
	}
	
	
	public int delete(String nId) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".delete",nId);
	}
	
	public Object updateHits(String nId) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".updateHits", nId);
	}
	
	
	
	

	
}

package com.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.vo.DispCommentVO;
//import com.web.vo.QnaVO;

public class DispCommentDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace="mapper.dispcomment";
	
	public int insert(Object obj) {
		DispCommentVO vo=(DispCommentVO)obj;
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
			result=sqlSession.selectOne(namespace+".countSearchUserId",searchtext);
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
			return sqlSession.selectList(namespace+".selectListSearchUserId",param);
		}
	}

	public Object select(String cmId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".content",cmId);
	}

	public int delete(String cmId) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".delete",cmId);
	}

	public int update(DispCommentVO vo) {
		// TODO Auto-generated method stub		
		return sqlSession.update(namespace+".update", vo);
	}

	public Object updateHits(String cmId) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".updateHits", cmId);
	}

	

	

}

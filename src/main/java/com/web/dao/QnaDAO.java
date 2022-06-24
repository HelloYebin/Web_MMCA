package com.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.vo.QnaVO;

public class QnaDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace="mapper.qna";
	
	public int insert(Object obj) {
		QnaVO vo=(QnaVO)obj;
		return sqlSession.insert(namespace+".insert", vo);
	}
	
	public int insertReply(Object obj) {
		QnaVO vo=(QnaVO)obj;
		return sqlSession.insert(namespace+".insertReply", vo);
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
	
	public List<Object> select(int startCount, int endCount,String searchtext, String searchcategory){
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

	public Object select(String qId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".content",qId);
	}

	public int getReplyGroup(int qOrigin) {
		return sqlSession.selectOne(namespace+".getGroupMax", qOrigin);
	}
	public void updateReply(int qGroup, int qOrigin) {
		// TODO Auto-generated method stub
		Map<String,String> param=new HashMap<String, String>();
		param.put("group", String.valueOf(qGroup));
		param.put("origin", String.valueOf(qOrigin));

		sqlSession.update(namespace+".updateReply", param);
	}

	public int delete(String qId) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".delete",qId);
	}

	public int update(Object obj) {
		// TODO Auto-generated method stub
		QnaVO vo=(QnaVO)obj;
		return sqlSession.update(namespace+".update", vo);
	}

	public Object updateHits(String qId) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".updateHits", qId);
	}

}

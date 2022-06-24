package com.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.vo.UserGalFrameVO;

public class UsergalFrameDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace="mapper.usergalFrame";
	
	public int insert(Object obj) {
		// TODO Auto-generated method stub
		UserGalFrameVO vo=(UserGalFrameVO)obj;
		return sqlSession.insert(namespace+".insert", vo);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".count");
	}

	public List<Object> select(int startCount, int endCount) {
		// TODO Auto-generated method stub
		Map<String, String> param=new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		
		return sqlSession.selectList(namespace+".selectList", param);
	}
	
	

}

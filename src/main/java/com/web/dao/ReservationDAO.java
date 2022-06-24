package com.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.vo.PostReservationVO;
import com.web.vo.PreReservationVO;

public class ReservationDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.reservation";
	
	public ArrayList<PreReservationVO> list() {
		List<PreReservationVO> list = sqlSession.selectList(namespace+".list");
		
		return (ArrayList<PreReservationVO>)list;
	}
	public int insert(PostReservationVO vo) {
		return sqlSession.insert(namespace+".insert", vo);
	}
	
	public int stateUpdate(String res_id) {
		return sqlSession.update(namespace+".stateUpdate", res_id);
	}
}

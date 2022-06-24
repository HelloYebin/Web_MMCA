package com.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.vo.PostReservationVO;

public class RListDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.rlist";
	
	public List<PostReservationVO> list() {
		return sqlSession.selectList(namespace+".list");
	}
	public List<PostReservationVO> list0(String id) {
		return sqlSession.selectList(namespace+".list0", id);
	}
	public List<PostReservationVO> list1(String id) {
		return sqlSession.selectList(namespace+".list1", id);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<PostReservationVO> list(
String id, String rtitle, String startdate, String enddate, String rtime, int startrnum, int endrnum) {
		
		Map param = new HashMap<String, String>();
		param.put("id", id);
		param.put("rtitle", rtitle);
		param.put("startdate", startdate);
		param.put("enddate", enddate);
		param.put("rtime", rtime);
		param.put("startrnum", startrnum);
		param.put("endrnum", endrnum);
		
		return sqlSession.selectList(namespace+".list_search", param);
	}
	
	public int rcancel(String rid) {
		return sqlSession.update(namespace+".rcancel", rid);
	}
	
	public int rcomplete(String rid) {
		return sqlSession.update(namespace+".rcomplete", rid);
	}
}
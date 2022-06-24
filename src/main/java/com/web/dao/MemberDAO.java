package com.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.vo.MemberVO;

public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.member";
	
	public int idCheck(String id) {
		return sqlSession.selectOne(namespace+".idcheck", id);
	}
	public int memberJoin(MemberVO vo) {
		return sqlSession.insert(namespace+".join", vo);
	}
	public int memberLogin(MemberVO vo) {
		return sqlSession.selectOne(namespace+".login", vo);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String idSearch(String name, String phone) {
		Map param = new HashMap<String, String>();
		param.put("name", name);
		param.put("phone", phone);
		
		return sqlSession.selectOne(namespace+".idSearch", param);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int pwSearch(String id, String name) {
		Map param = new HashMap<String, String>();
		param.put("id", id);
		param.put("name", name);
		
		return sqlSession.selectOne(namespace+".pwSearch", param);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int pwUpdate(String id, String new_pw) {
		Map param = new HashMap<String, String>();
		param.put("id", id);
		param.put("new_pw", new_pw);
		
		return sqlSession.update(namespace+".pwUpdate", param);
	}
	
	public List<MemberVO> memberList() {
		return sqlSession.selectList(namespace+".member_list");
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<MemberVO> memberList(
			String id, String name, String gender, String email, String address, String phone, String startdate, String enddate) {
		Map param = new HashMap<String, String>();
		param.put("id", id);
		param.put("name", name);
		param.put("gender", gender);
		param.put("email", email);
		param.put("address", address);
		param.put("phone", phone);
		param.put("startdate", startdate);
		param.put("enddate", enddate);
		
		return sqlSession.selectList(namespace+".member_list_search", param);
	}
	
	public MemberVO memberInfo(String id) {
		return sqlSession.selectOne(namespace+".member_info", id);
	}
	
	public int totalCount() {
		return sqlSession.selectOne(namespace+".totalCount");
	}
}

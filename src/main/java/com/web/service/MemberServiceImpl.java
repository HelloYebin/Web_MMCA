package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.MemberDAO;
import com.web.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int getIdCheckResult(String id) {
		return memberDAO.idCheck(id);
	}
	@Override
	public int getJoinResult(MemberVO vo) {
		return memberDAO.memberJoin(vo);
	}
	@Override
	public int getLoginResult(MemberVO vo) {
		return memberDAO.memberLogin(vo);
	}
	@Override
	public String getIDSearch(String name, String phone) {
		return memberDAO.idSearch(name, phone);
	}
	@Override
	public int getPWSearch(String id, String name) {
		return memberDAO.pwSearch(id, name);
	}
	@Override
	public int getPWUpdate(String id, String new_pw) {
		return memberDAO.pwUpdate(id, new_pw);
	}
	@Override
	public int getTotalCount() {
		return memberDAO.totalCount();
	}
	@Override
	public List<MemberVO> getMemberList() {
		return memberDAO.memberList();
	}
	@Override
	public List<MemberVO> getMemberList(
		String id, String name, String gender, String email, String address, String phone, String startdate, String enddate) {
		return memberDAO.memberList(
			id, name, gender, email, address, phone, startdate, enddate);
	}
	@Override
	public MemberVO getMemberInfo(String id) {
		return memberDAO.memberInfo(id);
	}
	
}

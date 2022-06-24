package com.web.service;

import java.util.List;

import com.web.vo.MemberVO;

public interface MemberService {
	int getIdCheckResult(String id);
	
	int getJoinResult(MemberVO vo);
	
	int getLoginResult(MemberVO vo);
	
	String getIDSearch(String name, String phone);
	
	int getPWSearch(String id, String name);
	
	int getPWUpdate(String id, String new_pw);
	
	int getTotalCount();
	
	List<MemberVO> getMemberList();
	
	List<MemberVO> getMemberList( 
		String id, String name, String gender, String email, String address, String phone, String startdate, String enddate);
	
	MemberVO getMemberInfo(String id);
}

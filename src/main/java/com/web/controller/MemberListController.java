package com.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.web.service.MemberServiceImpl;
import com.web.service.RListServiceImpl;
import com.web.vo.MemberVO;
import com.web.vo.PostReservationVO;


@Controller
public class MemberListController {
	
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private RListServiceImpl rlistService;
	
	@RequestMapping(value="admin/member_list.do", method=RequestMethod.GET)
	public ModelAndView member_list() {
		
		ModelAndView mv = new ModelAndView();

		List<MemberVO> list = memberService.getMemberList();
		
		mv.addObject("list", list);
		mv.setViewName("admin/member/member_list");
		
		return mv;
	}
	
	@RequestMapping(value="admin/member_search.do", method=RequestMethod.GET)
	public ModelAndView member_search(
		String id, String name, String gender, String email, String address, String phone, String startdate, String enddate) {
		ModelAndView mv = new ModelAndView();
		
		if(gender==null) {gender = "";}
		
		List<MemberVO> list = memberService.getMemberList(
				id, name, gender, email, address, phone, startdate, enddate);
		
		mv.addObject("list", list);
		
		mv.setViewName("admin/member/member_list");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="admin/member_info.do", produces="applicaton/text; charset=utf8", method=RequestMethod.GET)
	public String member_info(String id) {
		//produces="applicaton/json; charset=utf8",
		
		MemberVO vo = memberService.getMemberInfo(id);
		Gson gson = new GsonBuilder().create();
		JsonObject jso = new JsonObject();
		
		jso.addProperty("id", vo.getId());
		jso.addProperty("pw", vo.getPw());
		jso.addProperty("name", vo.getName());
		jso.addProperty("gender", vo.getGender());
		jso.addProperty("email", vo.getEmail());
		jso.addProperty("address", vo.getAddress());
		jso.addProperty("phone", vo.getPhone());
		jso.addProperty("joindate", vo.getJoindate());
		
		ArrayList<PostReservationVO> infolist0 = (ArrayList<PostReservationVO>) rlistService.getRList0(id);
		JsonArray jlist0 = new JsonArray();
		for(PostReservationVO vo0 : infolist0) {
			JsonObject obj = new JsonObject();
			obj.addProperty("rtitle",vo0.getRtitle());
			obj.addProperty("rdate",vo0.getRdate());
			obj.addProperty("rtime",vo0.getRtime());
			obj.addProperty("rnum",vo0.getRnum());
			
			jlist0.add(obj);
		}
		
		ArrayList<PostReservationVO> infolist1 = (ArrayList<PostReservationVO>) rlistService.getRList1(id);
		JsonArray jlist1 = new JsonArray();
		for(PostReservationVO vo1 : infolist1) {
			JsonObject obj = new JsonObject();
			obj.addProperty("rtitle",vo1.getRtitle());
			obj.addProperty("rdate",vo1.getRdate());
			obj.addProperty("rtime",vo1.getRtime());
			obj.addProperty("rnum",vo1.getRnum());
			
			jlist1.add(obj);
		}
		
		jso.add("jlist0", jlist0);
		jso.add("jlist1", jlist1);
		return gson.toJson(jso);
	}
}
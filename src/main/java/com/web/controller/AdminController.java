package com.web.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.ReservationServiceImpl;
import com.web.vo.PreReservationVO;

@Controller
public class AdminController {
	
	@Autowired ReservationServiceImpl reservationService;

	@RequestMapping(value="/admin.do",method=RequestMethod.GET)
	public String admin() {
		return "/admin/admin";
	}
	
	@RequestMapping(value="/admin/onwrite.do",method=RequestMethod.GET)
	public String adminOnWrite() {
		return "/admin/onlinedisp/admin_on_write";
	}
	
	@RequestMapping(value="/admin/onlist.do",method=RequestMethod.GET)
	public ModelAndView onList() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<PreReservationVO> list = reservationService.list();
		
		mv.addObject("list", list);
		mv.setViewName("admin/onlinedisp/on_list");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/onlist_stateUpdate.do",method=RequestMethod.GET)
	public String onList_stateUpdate(String res_id) {
		return String.valueOf(reservationService.stateUpdate(res_id));
	}
}

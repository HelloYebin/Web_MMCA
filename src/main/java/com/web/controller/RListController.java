package com.web.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.RListServiceImpl;
import com.web.vo.PostReservationVO;

@Controller
public class RListController {
	
	@Autowired
	private RListServiceImpl rlistService;
	
	@RequestMapping(value="/admin/reservation_list.do", method=RequestMethod.GET)
	public ModelAndView reservation_list() {
		ArrayList<PostReservationVO> list = (ArrayList<PostReservationVO>) rlistService.getRList();
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("admin/reservation/reservation_list");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/rsearch.do", method=RequestMethod.GET)
	public ModelAndView rsearch(String id, String rtitle, String startdate, String enddate, String rtime, 
			int startrnum, int endrnum) {
		ModelAndView mv = new ModelAndView();
		
		if(rtime == null) {rtime = "";}
		
		ArrayList<PostReservationVO> list = (ArrayList<PostReservationVO>) 
			rlistService.getRList(id, rtitle, startdate, enddate, rtime, startrnum, endrnum);
		
		mv.addObject("list", list);
		mv.setViewName("admin/reservation/reservation_list");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/rcancel.do", method=RequestMethod.GET)
	public String rcancel(String rid) {
		int result = rlistService.cancelReservation(rid);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/rvisited.do", method=RequestMethod.GET)
	public String rvisited(String rid) {
		int result = rlistService.completeReservation(rid);
		return String.valueOf(result);
	}
}

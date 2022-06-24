package com.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.service.MemberServiceImpl;
import com.web.vo.MemberVO;

@Controller
public class JoinController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "join/join";
	}
	
	@ResponseBody
	@RequestMapping(value="/idcheck.do", method=RequestMethod.GET)
	public String idCheck(String id) {
		return String.valueOf(memberService.getIdCheckResult(id));
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public ModelAndView join(MemberVO vo, RedirectAttributes re) {
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.getJoinResult(vo);
		
		if(result==1) {

			re.addFlashAttribute("join_result", "succ");
			mv.setViewName("redirect:/login.do");

		} else {

			re.addFlashAttribute("join_result", "fail");
			mv.setViewName("redirect:/join.do");

		}
		return mv;
	}
}

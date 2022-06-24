package com.web.controller;

import javax.servlet.http.HttpSession;

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
public class LoginController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(MemberVO vo, HttpSession session, RedirectAttributes re) {
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.getLoginResult(vo);
		
		if(result==1) {
			session.setAttribute("id", vo.getId());
			re.addFlashAttribute("login_result", "succ");
			mv.setViewName("redirect:index.do");
		} else {
			re.addFlashAttribute("login_result", "fail");
			mv.setViewName("redirect:login.do");
		}
		
		return mv;
	}
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session, RedirectAttributes re) {
		ModelAndView mv = new ModelAndView();
		String id = (String) session.getAttribute("id");
		
		if(id != null) {
			session.invalidate();
		}
		re.addFlashAttribute("logout_result", "succ");
		mv.setViewName("redirect:/index.do");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/id_search.do", method=RequestMethod.GET)
	public String id_search(String name, String ph1, String ph2, String ph3) {
		String phone = String.join("-", ph1, ph2, ph3);
		String id = memberService.getIDSearch(name, phone);
		
		return id;
	}
	
	@ResponseBody
	@RequestMapping(value="/pass_search.do", method=RequestMethod.GET)
	public String pass_search(String id, String name) {
		return String.valueOf(memberService.getPWSearch(id, name));
	}
	
	@ResponseBody
	@RequestMapping(value="/pass_update.do", method=RequestMethod.GET)
	public String pass_update(String id, String new_pw) {
		return String.valueOf(memberService.getPWUpdate(id, new_pw));
	}
}

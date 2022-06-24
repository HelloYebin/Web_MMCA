package com.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SitemapController {

	@RequestMapping(value="/sitemap.do",method=RequestMethod.GET)
	public ModelAndView sitemap(HttpSession session) {
		ModelAndView mv=new ModelAndView("sitemap/sitemap");
		String id=(String)session.getAttribute("id");
		mv.addObject("id", id);
		return mv;
	}
	
}

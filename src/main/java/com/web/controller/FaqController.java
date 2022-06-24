package com.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.javassist.convert.TransformNew;
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
import com.web.service.FaqServiceImpl;
import com.web.service.FileServiceImpl;
import com.web.vo.FaqVO;
import com.web.vo.NoticeVO;

@Controller
public class FaqController {
	
	@Autowired
	FaqServiceImpl faqService;

	@RequestMapping(value="/faq_list.do",method=RequestMethod.GET)
	public ModelAndView faqList(HttpSession session) {
		ModelAndView mv=new ModelAndView("/faq/faq_list");
		String id=(String)session.getAttribute("id");
		mv.addObject("id", id);
		return mv;
	}
	
	
	@RequestMapping(value="/faq_category.do",method=RequestMethod.GET, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String faqMenuChange(String faCategory,HttpServletResponse response) {
		//System.out.println(faCategory);
		
		Gson gson=new GsonBuilder().create();
		JsonObject jso=new JsonObject();
		JsonArray jArray=new JsonArray();
		
		int recordCount=faqService.getRecordCount(faCategory);
		List<Object> olist=faqService.getRecordList(1, recordCount, faCategory);
		List<FaqVO> list=new ArrayList<FaqVO>();
		
		int i=0;
		for(Object obj :olist) {
			list.add((FaqVO)obj);
		}
		
		
		for(FaqVO vo:list) {
			JsonObject jobj=new JsonObject();
			
			String str=vo.getFaContent().replaceAll(System.getProperty("line.separator"), "<br>");
			vo.setFaContent(str);
			
			jobj.addProperty("faId",vo.getFaId());
			jobj.addProperty("faTitle",vo.getFaTitle());
			jobj.addProperty("faCategory",vo.getFaCategory());
			jobj.addProperty("faContent",vo.getFaContent());
			
			jArray.add(jobj);
		}
		
		jso.add("list", jArray);
		//response.setCharacterEncoding("UTF-8");
		return gson.toJson(jso);
		//return String.valueOf(recordCount);
	}
	
	@RequestMapping(value="/faq_write.do",method=RequestMethod.GET)
	public String faqWrite() {
		return "/faq/faq_write";
	}
	
	@RequestMapping(value="/faq_write.do",method=RequestMethod.POST)
	public ModelAndView faqWrite(FaqVO vo) {
		ModelAndView mv=new ModelAndView("redirect: /mygit/faq_list.do");
		int result=faqService.InsertRecord(vo);
		if(result!=1) {
			
		}
		return mv;
	}
	
	@RequestMapping(value="/faq_update.do",method=RequestMethod.GET)
	public ModelAndView faqUpdate(String faId) {
		ModelAndView mv=new ModelAndView("/faq/faq_update");
		FaqVO vo=(FaqVO)faqService.getContent(faId);
		mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/faq_update.do",method=RequestMethod.POST)
	public ModelAndView faqUpdate(FaqVO vo) {
		ModelAndView mv=new ModelAndView("redirect: /mygit/faq_list.do");
		int result=faqService.updateContent(vo);
		if(result==0) {
			//Error Page
		}
		return mv;
	}
	
	@RequestMapping(value="/faq_delete.do",method=RequestMethod.GET)
	public String faqDelete(String faId) {
		int result=faqService.deleteContent(faId);
		if(result!=0) {
			return "redirect:faq_list.do";
		}
		return "redirect:faq_list.do";
	}
	

}

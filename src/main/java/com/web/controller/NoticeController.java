package com.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.FileServiceImpl;
import com.web.service.NoticeServiceImpl;
import com.web.service.PageServiceImpl;
import com.web.vo.CollectionVO;
import com.web.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeServiceImpl noticeService;
	
	@Autowired
	FileServiceImpl fileService;
	
	@Autowired
	PageServiceImpl pageService;
	
	@RequestMapping(value="/notice_list.do",method=RequestMethod.GET)
	public ModelAndView noticeList(String rpage,HttpSession session) {

		ModelAndView mv=new ModelAndView("/notice/notice_list");
		
		if(rpage==null) {
			rpage=new String("1");
		}
		
		String id=(String)session.getAttribute("id");
		String mode="list";
		Map<String, String> param= pageService.getPageResult(rpage, "notice", noticeService);
		
		int startCount=Integer.parseInt( param.get("start"));
		int endCount=Integer.parseInt(param.get("end"));
		int dbCount=Integer.parseInt(param.get("dbCount"));
		int reqPage=Integer.parseInt(param.get("reqPage"));
		int pageSize=Integer.parseInt(param.get("pageSize"));
		int pageCount=Integer.parseInt(param.get("pageCount"));
		
		//List<Object> olist=digitalMovieService.getRecordList(startCount, endCount);
		//List<CollectionVO> list=new ArrayList<DigitalMovieVO>();
		List<Object> olist=noticeService.getRecordList(startCount, endCount);
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		
		for(Object obj:olist) {
			list.add((NoticeVO)obj);
		}
				
		int divLast=0;
		if(dbCount%pageSize!=0) {
			divLast=pageSize-dbCount%pageSize;
		}
		
		mv.addObject("divLast",divLast);
		mv.addObject("reqPage", reqPage);
		mv.addObject("pageCount", pageCount);
		mv.addObject("list", list);
		mv.addObject("id",id);
		mv.addObject("mode", mode);
		return mv;
	}
	
	@RequestMapping(value="/notice_search.do",method=RequestMethod.GET)
	public ModelAndView noticeList(String rpage,String searchcategory,String searchtext,HttpSession session) {
		
		ModelAndView mv=new ModelAndView("/notice/notice_list");
		
		String id=(String)session.getAttribute("id");
		String mode="search";
		Map<String, String> param= pageService.getPageResult(rpage, searchcategory,searchtext,"notice", noticeService);
		
		int startCount=Integer.parseInt( param.get("start"));
		int endCount=Integer.parseInt(param.get("end"));
		int dbCount=Integer.parseInt(param.get("dbCount"));
		int reqPage=Integer.parseInt(param.get("reqPage"));
		int pageSize=Integer.parseInt(param.get("pageSize"));
		int pageCount=Integer.parseInt(param.get("pageCount"));
		
		List<Object> olist=noticeService.getRecordList(startCount, endCount,searchtext,searchcategory);
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		
		int i=0;
		for(Object obj:olist) {
			list.add((NoticeVO)obj);
			list.get(i++).getnId();
		}
				
		int divLast=0;
		if(dbCount%pageSize!=0) {
			divLast=pageSize-dbCount%pageSize;
		}
		
		mv.addObject("divLast",divLast);
		mv.addObject("reqPage", reqPage);
		mv.addObject("pageCount", pageCount);
		mv.addObject("list", list);
		mv.addObject("id",id);
		mv.addObject("mode", mode);
		mv.addObject("searchtext",searchtext );
		mv.addObject("searchcategory",searchcategory);
		return mv;
	}
	
	@RequestMapping(value="/notice_content.do",method=RequestMethod.GET)
	public ModelAndView noticeContent(String nId,HttpSession session) {
		ModelAndView mv=new ModelAndView("/notice/notice_content");
		String id=(String)session.getAttribute("id");
		NoticeVO vo= (NoticeVO)noticeService.getContent(nId);
		String str=vo.getnContent().replaceAll(System.getProperty("line.separator"), "<br>");
		vo.setnContent(str);
		noticeService.updateHits(nId);
		mv.addObject("vo", vo);
		mv.addObject("id",id);
		return mv;
	}
	
	@RequestMapping(value="/notice_write.do",method=RequestMethod.GET)
	public String noticeWrite() {
		return "/notice/notice_write";
	}
	
	@RequestMapping(value="/notice_write.do",method=RequestMethod.POST)
	public ModelAndView noticeWrite(NoticeVO vo,HttpServletRequest request) throws Exception {
		ModelAndView mv=new ModelAndView();
		
		vo=fileService.fileCheck(vo);		
		int result= noticeService.InsertRecord(vo);
		
		if(result!=0) {
			fileService.fileSave(vo, request);
		}


		
		mv.setViewName("redirect: /mygit/notice_list.do?rpage=1");
		return mv;
	}
	
	@RequestMapping(value="/notice_update.do",method=RequestMethod.GET)
	public ModelAndView noticeUpdate(String nId) {
		ModelAndView mv=new ModelAndView("/notice/notice_update");
		NoticeVO vo= (NoticeVO)noticeService.getContent(nId);
		mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/notice_update.do",method=RequestMethod.POST)
	public ModelAndView noticeUpdate(NoticeVO vo,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		
		String sfile=vo.getnSfile();
		vo=fileService.fileCheck(vo);
		
		int result=noticeService.updateContent(vo);
		if(result!=0) {
			fileService.deleteFile(sfile, request);
		}
		
		mv.setViewName("redirect: /mygit/notice_list.do?rpage=1");
		return mv;
	}
	
	@RequestMapping(value="/notice_delete.do",method=RequestMethod.GET)
	public String noticeDelete(String nId,HttpServletRequest request) {
		NoticeVO vo= (NoticeVO)noticeService.getContent(nId);
		
		String sfile="";
		if(vo.getnSfile()!="") {
			sfile=vo.getnSfile();
		}
		
		int result=noticeService.deleteContent(nId);
		
		if(result==1) {
			fileService.deleteFile(sfile, request);
		}
		
		return "redirect: /mygit/notice_list.do?rpage=1";
	}
}

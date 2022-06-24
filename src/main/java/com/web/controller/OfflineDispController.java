package com.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.DigitalMovieServiceImpl;
import com.web.service.FileServiceImpl;
import com.web.service.OfflineDispServiceImpl;
import com.web.service.PageServiceImpl;
import com.web.vo.CollectionVO;
import com.web.vo.DigitalMovieVO;
import com.web.vo.OffNowVO;

@Controller
public class OfflineDispController {
	
	@Autowired
	FileServiceImpl fileService;
	
	@Autowired
	OfflineDispServiceImpl offnowService;
	
	@Autowired
	PageServiceImpl pageService;

	@RequestMapping(value="/off_content_no.do",method=RequestMethod.GET)
	public ModelAndView offContentNo(String exId,HttpSession session) {
		ModelAndView mv= new ModelAndView( "/offlinedisp/off_content_no");
		String id=(String)session.getAttribute("id");
		offnowService.updateHits(exId);
		OffNowVO vo=(OffNowVO)offnowService.getContent(exId);
		String str=vo.getExContent().replaceAll(System.getProperty("line.separator"), "<br>");
		vo.setExContent(str);
		mv.addObject("vo", vo);
		mv.addObject("id", id);
		return mv;
	}
	
	@RequestMapping(value="/off_future.do",method=RequestMethod.GET)
	public String offFuture() {
		return "/offlinedisp/off_future";
	}
	
	@RequestMapping(value="/offDispWrite.do",method=RequestMethod.GET)
	public String offDispWrite() {
		
		return "/offlinedisp/off_disp_write";
	}
	
	@RequestMapping(value="/offDispWrite.do",method=RequestMethod.POST)
	public ModelAndView offDispWrite(OffNowVO vo,HttpServletRequest request) throws Exception {
		ModelAndView mv=new ModelAndView();
		vo=fileService.fileCheck(vo);
		
		int result=offnowService.InsertRecord(vo);		
		if(result==1) {
			fileService.fileSave(vo, request);
		}		
		mv.setViewName("redirect:off_now.do?rpage=1");
		return mv;
		
	}
	
	@RequestMapping(value="/offDispUpdate.do",method=RequestMethod.GET)
	public ModelAndView offDispUpdate(String exId) {
		ModelAndView mv=new ModelAndView("/offlinedisp/off_disp_update");
		OffNowVO vo=(OffNowVO)offnowService.getContent(exId);
		vo.getFileArr();
		mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/offDispUpdate.do",method=RequestMethod.POST)
	public ModelAndView offDispUpdate(OffNowVO vo,HttpServletRequest request) throws Exception {
		ModelAndView mv=new ModelAndView("redirect:off_now.do?rpage=1");
		String[] orgSfile=vo.getsFileArr();
		vo=(OffNowVO)fileService.fileCheck(vo);
		
		int result=offnowService.updateContent(vo);
		if(result!=0) {
			if(!vo.getExSfile().equals(""))
			{
				fileService.fileSave(vo, request);
				for(int i=0;i<orgSfile.length;i++) {
					fileService.deleteFile(orgSfile[i], request);
				}
			}
			
			
		}
		
		mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/off_now.do",method=RequestMethod.GET)
	public ModelAndView offNow(String rpage,String category,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String id=(String)session.getAttribute("id");
		String mode="list";
		Map<String, String> param= new HashMap<String, String>();
		List<Object> olist=new ArrayList<Object>();
		
		if(rpage==null) {
			rpage=new String("1");
		}
		
		
		
		if(category==null) {
			param= pageService.getPageResult(rpage,"offNow",offnowService);
			}
		else {
			param= pageService.getPageResultCategory(rpage,category,"offNow",offnowService);
			}

		
		int startCount=Integer.parseInt( param.get("start"));
		int endCount=Integer.parseInt(param.get("end"));
		int dbCount=Integer.parseInt(param.get("dbCount"));
		int reqPage=Integer.parseInt(param.get("reqPage"));
		int pageSize=Integer.parseInt(param.get("pageSize"));
		int pageCount=Integer.parseInt(param.get("pageCount"));
		
		if(category==null) {
			olist=offnowService.getRecordList(startCount, endCount);
		}else {
			olist=offnowService.getRecordListCategory(startCount, endCount,category);
		}
		
		List<OffNowVO> list=new ArrayList<OffNowVO>();
		if (olist!=null) {
		for(Object obj:olist) {
			list.add((OffNowVO)obj);
		}
		}
		int divLast=0;
		if(dbCount%pageSize!=0) {
			divLast=pageSize-dbCount%pageSize;
		}
		
		mv.addObject("divLast",divLast);
		mv.addObject("reqPage", reqPage);
		mv.addObject("pageCount", pageCount);
		mv.addObject("list", list);
		mv.addObject("id", id);
		mv.addObject("mode",mode);
		mv.addObject("category", category);
		mv.setViewName("/offlinedisp/off_now");		
		return mv;
	}
	
	@RequestMapping(value="/offDispSearch.do",method=RequestMethod.GET)
	public ModelAndView offNowSearch(String rpage,String searchtext,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String id=(String)session.getAttribute("id");
		String mode="search";
		Map<String, String> param= new HashMap<String, String>();
		List<Object> olist=new ArrayList<Object>();
		
	
		param= pageService.getPageResult(rpage,searchtext,"offNow",offnowService);

		
	
		int startCount=Integer.parseInt( param.get("start"));
		int endCount=Integer.parseInt(param.get("end"));
		int dbCount=Integer.parseInt(param.get("dbCount"));
		int reqPage=Integer.parseInt(param.get("reqPage"));
		int pageSize=Integer.parseInt(param.get("pageSize"));
		int pageCount=Integer.parseInt(param.get("pageCount"));
		
		
		olist=offnowService.getRecordList(startCount, endCount,searchtext);

		
		List<OffNowVO> list=new ArrayList<OffNowVO>();
		if (olist!=null) {
		for(Object obj:olist) {
			list.add((OffNowVO)obj);
		}
		}
		int divLast=0;
		if(dbCount%pageSize!=0) {
			divLast=pageSize-dbCount%pageSize;
		}
		
		mv.addObject("divLast",divLast);
		mv.addObject("reqPage", reqPage);
		mv.addObject("pageCount", pageCount);
		mv.addObject("list", list);
		mv.addObject("id", id);
		mv.addObject("mode",mode);
		mv.addObject("searchtext", searchtext);
		mv.setViewName("/offlinedisp/off_now");		
		return mv;
	}
	
	@RequestMapping(value="/off_past.do",method=RequestMethod.GET)
	public String offPast() {
		return "/offlinedisp/off_past";
	}
	
	@RequestMapping(value="/offDispDelete.do",method=RequestMethod.GET)
	public ModelAndView offDispUpdate(String exId,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("redirect:off_now.do?rpage=1");
		
		OffNowVO vo=(OffNowVO) offnowService.getContent(exId);
		String[] orgSfile=vo.getsFileArr();
		
		int result=offnowService.deleteContent(exId);
		if(result!=0) {		
				for(int i=0;i<orgSfile.length;i++) {
					fileService.deleteFile(orgSfile[i], request);
			}			
		}	

		return mv;
	}
}

package com.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.CollationElementIterator;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.dao.CollectionDAO;
import com.web.service.CollectionServiceImpl;
//import com.web.dao.DigitalMovieDAO;
import com.web.service.DigitalMovieServiceImpl;
import com.web.service.FileServiceImpl;
import com.web.service.ObjectService;
import com.web.service.PageServiceImpl;
//import com.web.dao.DigitalMovieDAO;
import com.web.vo.CollectionVO;
import com.web.vo.DigitalMovieVO;

@Controller
public class OnDispController {
	
	
	@Autowired
	FileServiceImpl fileService;
	
	@Autowired
	DigitalMovieServiceImpl digitalMovieService;
	
	@Autowired
	PageServiceImpl pageService;
	
	@Autowired
	CollectionServiceImpl collectionService;
	
	//ObjectService collectionService;

	@RequestMapping(value="/online/digitalMovList.do",method=RequestMethod.GET)
	public ModelAndView onDigitalMovList(String rpage,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String id=(String)session.getAttribute("id");
		String mode="List";
		
		if(rpage==null) {
			rpage=new String("1");
		}
		
		Map<String, String> param= pageService.getPageResult(rpage,"digitalMovie",digitalMovieService);
		
		int startCount=Integer.parseInt( param.get("start"));
		int endCount=Integer.parseInt(param.get("end"));
		int dbCount=Integer.parseInt(param.get("dbCount"));
		int reqPage=Integer.parseInt(param.get("reqPage"));
		int pageSize=Integer.parseInt(param.get("pageSize"));
		int pageCount=Integer.parseInt(param.get("pageCount"));
		
		List<Object> olist=digitalMovieService.getRecordList(startCount, endCount);
		List<DigitalMovieVO> list=new ArrayList<DigitalMovieVO>();
		
		for(Object obj:olist) {
			list.add((DigitalMovieVO)obj);
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
		mv.setViewName("/onlinedisp/on_digitalMov_list");		
		return mv;
	}
	
	@RequestMapping(value="/online/digitalMovSearch.do",method=RequestMethod.GET)
	public ModelAndView onDigitalMovList(String rpage,String searchtext, HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String mode="Search";
		
		String id=(String)session.getAttribute("id");
		Map<String, String> param= pageService.getPageResult(rpage,searchtext,"digitalMovie",digitalMovieService);
		
		int startCount=Integer.parseInt( param.get("start"));
		int endCount=Integer.parseInt(param.get("end"));
		int dbCount=Integer.parseInt(param.get("dbCount"));
		int reqPage=Integer.parseInt(param.get("reqPage"));
		int pageSize=Integer.parseInt(param.get("pageSize"));
		int pageCount=Integer.parseInt(param.get("pageCount"));
		
		List<Object> olist=digitalMovieService.getRecordList(startCount, endCount,searchtext);
		List<DigitalMovieVO> list=new ArrayList<DigitalMovieVO>();
		
		for(Object obj:olist) {
			list.add((DigitalMovieVO)obj);
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
		mv.setViewName("/onlinedisp/on_digitalMov_list");		
		mv.addObject("mode",mode);
		mv.addObject("searchtext",searchtext);
		return mv;
	}
	
	@RequestMapping(value="/online/collectionList.do",method=RequestMethod.GET)
	public ModelAndView onCollection(String rpage,HttpSession session) {
		ModelAndView mv=new ModelAndView( "/onlinedisp/on_collection_list");
		String id=(String)session.getAttribute("id");
		String mode="List";
		Map<String, String> param= pageService.getPageResult(rpage, "collection", collectionService);
		
		int startCount=Integer.parseInt( param.get("start"));
		int endCount=Integer.parseInt(param.get("end"));
		int dbCount=Integer.parseInt(param.get("dbCount"));
		int reqPage=Integer.parseInt(param.get("reqPage"));
		int pageSize=Integer.parseInt(param.get("pageSize"));
		int pageCount=Integer.parseInt(param.get("pageCount"));
		
		//List<Object> olist=digitalMovieService.getRecordList(startCount, endCount);
		//List<CollectionVO> list=new ArrayList<DigitalMovieVO>();
		List<Object> olist=collectionService.getRecordList(startCount, endCount);
		List<CollectionVO> list=new ArrayList<CollectionVO>();
		
		for(Object obj:olist) {
			list.add((CollectionVO)obj);
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
		return mv;
	}
	
	@RequestMapping(value="/online/collectionSearch.do",method=RequestMethod.GET)
	public ModelAndView onCollectionSearch(String rpage,String searchtext,HttpSession session) {
		ModelAndView mv=new ModelAndView( "/onlinedisp/on_collection_list");
		String id=(String)session.getAttribute("id");
		String mode="Search";
		Map<String, String> param= pageService.getPageResult(rpage,searchtext, "collection", collectionService);
		
		int startCount=Integer.parseInt( param.get("start"));
		int endCount=Integer.parseInt(param.get("end"));
		int dbCount=Integer.parseInt(param.get("dbCount"));
		int reqPage=Integer.parseInt(param.get("reqPage"));
		int pageSize=Integer.parseInt(param.get("pageSize"));
		int pageCount=Integer.parseInt(param.get("pageCount"));
		
		//List<Object> olist=digitalMovieService.getRecordList(startCount, endCount);
		//List<CollectionVO> list=new ArrayList<DigitalMovieVO>();
		List<Object> olist=collectionService.getRecordList(startCount, endCount,searchtext);
		List<CollectionVO> list=new ArrayList<CollectionVO>();
		
		for(Object obj:olist) {
			list.add((CollectionVO)obj);
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
		mv.addObject("searchtext",searchtext);
		return mv;
	}
	
	@RequestMapping(value="/online/digitalMovInfo.do",method=RequestMethod.GET)
	public ModelAndView onDigitalMovInfo(String dmId,HttpSession session) {
		ModelAndView mv=new ModelAndView("/onlinedisp/on_digitalMov_info");
		String id=(String)session.getAttribute("id");
		digitalMovieService.updateHits(dmId);
		DigitalMovieVO vo=(DigitalMovieVO)digitalMovieService.getContent(dmId);
		String str=vo.getDmContent().replaceAll(System.getProperty("line.separator"), "<br>");
		vo.setDmContent(str);
		mv.addObject("id", id);;
		mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/online/collectionInfo.do",method=RequestMethod.GET)
	public ModelAndView onCollectionInfo(String coId,HttpSession session) {
		ModelAndView mv= new ModelAndView( "/onlinedisp/on_collection_info");
		String id=(String)session.getAttribute("id");
		collectionService.updateHits(coId);
		CollectionVO vo=(CollectionVO)collectionService.getContent(coId);
		String str=vo.getCoContent().replaceAll(System.getProperty("line.separator"), "<br>");
		vo.setCoContent(str);
		mv.addObject("vo", vo);
		mv.addObject("id", id);
		return mv;
	}
	
	@RequestMapping(value="/online/collectionWrite.do",method=RequestMethod.GET)
	public String onCollectionWrite() {
		return "/onlinedisp/on_collection_write";
	}
	
	@RequestMapping(value="/online/collectionWrite.do",method=RequestMethod.POST)
	public ModelAndView onCollectionWrite(CollectionVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv=new ModelAndView();
		vo=fileService.fileCheck(vo);
		int result=collectionService.InsertRecord(vo);
		//int result=collectionDao.insert(vo);
		if(result==1) {
			fileService.fileSave(vo, request);
		}		
		mv.setViewName("redirect: /mygit/online/collectionList.do?rpage=1");
		return mv;
	}
	
	@RequestMapping(value="/online/digitalMovWrite.do",method=RequestMethod.GET)
	public String onDigitalMovWrite() {
		return "/onlinedisp/on_digitalMov_write";
	}
	
	@RequestMapping(value="/online/digitalMovWrite.do",method=RequestMethod.POST)
	public ModelAndView onDigitalMovWrite(DigitalMovieVO vo, HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView();
		//FileServiceImpl fileService=new FileServiceImpl();		
		vo=fileService.fileCheck(vo);		
		int result=digitalMovieService.InsertRecord(vo);			
		if(result==1) {
			fileService.fileSave(vo, request);
		}		
		mv.setViewName("redirect: /mygit/online/digitalMovList.do?rpage=1");
		return mv;
	}
	
	@RequestMapping(value="/online/collectionUpdate.do",method=RequestMethod.GET)
	public ModelAndView onCollectionUpdate(String coId) {
		ModelAndView mv=new ModelAndView("/onlinedisp/on_collection_update");
		CollectionVO vo=(CollectionVO)collectionService.getContent(coId);
		
		vo.setCategoryInv();
		mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/online/collectionUpdate.do",method=RequestMethod.POST)
	public ModelAndView onCollectionUpdate(CollectionVO vo,HttpServletRequest request) throws Exception {
		ModelAndView mv=new ModelAndView();
		
		String sfile=vo.getCoSfile();
		vo=fileService.fileCheck(vo);	
		
		int result=collectionService.updateContent(vo);
		
		if(result==1) {
			if(vo.getCoFile()!=null) {
				fileService.fileSave(vo, request);
				fileService.deleteFile(sfile, request);
			}
		}
	
		mv.setViewName("redirect: /mygit/online/collectionList.do?rpage=1");
		return mv;
	}
	
	
	@RequestMapping(value="/online/digitalMovUpdate.do",method=RequestMethod.GET)
	public ModelAndView onDigitalMovUpdate(String dmId) {
		ModelAndView mv= new ModelAndView("/onlinedisp/on_digitalMov_update");
		DigitalMovieVO vo=(DigitalMovieVO) digitalMovieService.getContent(dmId);
				//digitalMovieDao.select(dmId);
		vo.setCategoryInv();
		vo.setProgramInv();
		mv.addObject("vo", vo);
		return  mv;
	}
	
	@RequestMapping(value="/online/digitalMovUpdate.do",method=RequestMethod.POST)
	public ModelAndView onDigitalMovUpdate(DigitalMovieVO vo,HttpServletRequest request) throws Exception, Exception {
		ModelAndView mv=new ModelAndView();

		String sfile=vo.getDmSfile();
		vo=fileService.fileCheck(vo);	
		
		int result=digitalMovieService.updateContent(vo);
		//int result=digitalMovieDao.update(vo);

		
		if(result==1) {
			if(vo.getDmFile()!=null) {
				fileService.fileSave(vo, request);
				fileService.deleteFile(sfile, request);
			}
		}
	
		mv.setViewName("redirect: /mygit/online/digitalMovList.do?rpage=1");
		return mv;
	}
	
	@RequestMapping(value="/online/collectionDelete.do",method=RequestMethod.GET)
	public String onCollectionDelete(String coId,HttpServletRequest request) {

		CollectionVO vo=(CollectionVO) collectionService.getContent(coId);
		
		String sfile="";
		if(vo.getCoSfile()!="") {
			sfile=vo.getCoSfile();
		}
		
		int result=collectionService.deleteContent(coId);
		
		if(result==1) {
			fileService.deleteFile(sfile,request);
		}
		
		
		
		return "redirect:/online/collectionList.do?rpage=1";
	}
	
	@RequestMapping(value="/online/digitalMovDelete.do",method=RequestMethod.GET)
	public String onDigitalMovDelete(String dmId,HttpServletRequest request) {
		
		DigitalMovieVO vo=(DigitalMovieVO)digitalMovieService.getContent(dmId);
		String sfile="";
		if(vo.getDmSfile()!="") {
			sfile=vo.getDmSfile();
		}
		
		int result=digitalMovieService.deleteContent(dmId);
		
		if(result==1) {
			fileService.deleteFile(sfile,request);
		}
		
		return "redirect:/online/digitalMovList.do?rpage=1";
		}
	
	@RequestMapping(value="/online/on_show.do",method=RequestMethod.GET)
	public String onShow() {
		return "/onlinedisp/on_show";
	}
	
	
}

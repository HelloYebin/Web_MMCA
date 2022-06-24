package com.web.controller;

import java.io.IOException;
import java.io.OutputStream;
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
import com.web.service.PageServiceImpl;
import com.web.service.QnaServiceImpl;
import com.web.vo.NoticeVO;
import com.web.vo.QnaVO;

@Controller
public class QnaController {

	@Autowired
	FileServiceImpl fileService;
	
	@Autowired
	QnaServiceImpl qnaService;
	
	@Autowired
	PageServiceImpl pageService;
	
	@RequestMapping(value="/qna_list.do",method = RequestMethod.GET)
	public ModelAndView qnaList(String rpage) {
		ModelAndView mv=new ModelAndView("/qna/qna_list");
		String mode="list";
		
		if(rpage==null) {
			rpage=new String("1");
		}
		
		Map<String, String> param= pageService.getPageResult(rpage,"qna",qnaService);
		
		int startCount=Integer.parseInt( param.get("start"));
		int endCount=Integer.parseInt(param.get("end"));
		int dbCount=Integer.parseInt(param.get("dbCount"));
		int reqPage=Integer.parseInt(param.get("reqPage"));
		int pageSize=Integer.parseInt(param.get("pageSize"));
		int pageCount=Integer.parseInt(param.get("pageCount"));
		
		List<Object> olist=qnaService.getRecordList(startCount,endCount);
		List<QnaVO> list=new ArrayList<QnaVO>();
		
		for(Object obj:olist) {
			list.add((QnaVO)obj);
		}
		
		int divLast=0;
		if(dbCount%pageSize!=0) {
			divLast=pageSize-dbCount%pageSize;
		}
		
		mv.addObject("divLast",divLast);
		mv.addObject("reqPage", reqPage);
		mv.addObject("pageCount", pageCount);
		mv.addObject("list", list);
		mv.addObject("mode",mode);
		return mv;
	}
	
	@RequestMapping(value="/qna_search.do",method=RequestMethod.GET)
	public ModelAndView noticeList(String rpage,String searchcategory,String searchtext,HttpSession session) {
		
		ModelAndView mv=new ModelAndView("/qna/qna_list");
		String id=(String)session.getAttribute("id");
		String mode="search";
		
		
		
		Map<String, String> param= pageService.getPageResult(rpage, searchcategory,searchtext,"qna", qnaService);
		
		int startCount=Integer.parseInt( param.get("start"));
		int endCount=Integer.parseInt(param.get("end"));
		int dbCount=Integer.parseInt(param.get("dbCount"));
		int reqPage=Integer.parseInt(param.get("reqPage"));
		int pageSize=Integer.parseInt(param.get("pageSize"));
		int pageCount=Integer.parseInt(param.get("pageCount"));
		
		List<Object> olist=qnaService.getRecordList(startCount, endCount,searchtext,searchcategory);
		List<QnaVO> list=new ArrayList<QnaVO>();
		
		int i=0;
		for(Object obj:olist) {
			list.add((QnaVO)obj);
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
		mv.addObject("mode",mode);
		mv.addObject("searchcategory",searchcategory);
		mv.addObject("searchtext",searchtext);
		return mv;
	}
	
	@RequestMapping(value="/qna_write.do",method = RequestMethod.GET)
	public ModelAndView qnaWrite(HttpSession session) {
		String id=(String)session.getAttribute("id");
		ModelAndView mv=new ModelAndView("/qna/qna_write");
		mv.addObject("id", id);
		return mv;
	}
	
	/*//session 미적용
	@RequestMapping(value="/qna_write.do",method = RequestMethod.GET)
	public String qnaWrite(HttpSession session) {
		return "/qna/qna_write";
	}*/
	
	@RequestMapping(value="/qna_write.do",method = RequestMethod.POST)
	public ModelAndView qnaWrite(QnaVO vo,HttpServletRequest request) throws Exception {
		ModelAndView mv=new ModelAndView("redirect: /mygit/qna_list.do?rapge=1");
		//vo.setqUserId("test");
		//vo.setqOrigin(0);
		vo=fileService.fileCheck(vo);
		
		fileService.fileSave(vo, request);
		qnaService.InsertRecord(vo);
		return  mv;
	}
	
	@RequestMapping(value="/qna_update.do",method = RequestMethod.GET)
	public ModelAndView qnaUpdate(String qId) {
		ModelAndView mv=new ModelAndView("/qna/qna_update");
		QnaVO vo=(QnaVO)qnaService.getContent(qId);
		mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/qna_update.do",method = RequestMethod.POST)
	public ModelAndView qnaUpdate(QnaVO vo,HttpServletRequest request) throws Exception {
		ModelAndView mv=new ModelAndView("redirect: /mygit/qna_list.do?rpage=1");

		String sfile=vo.getqSfile();
		vo=fileService.fileCheck(vo);	
		
		int result=qnaService.updateContent(vo);
		//int result=digitalMovieDao.update(vo);

		
		if(result==1) {
			if(vo.getqFile()!=null) {
				fileService.fileSave(vo, request);
				fileService.deleteFile(sfile, request);
			}
		}

		return mv;
	}
	
	@RequestMapping(value="/qna_content.do",method = RequestMethod.GET)
	public ModelAndView qnaContent(String qId,HttpSession session) {
		ModelAndView mv=new ModelAndView("/qna/qna_content");
		QnaVO vo=(QnaVO) qnaService.getContent(qId);
		String str=vo.getqContent().replaceAll(System.getProperty("line.separator"), "<br>");
		vo.setqContent(str);
		qnaService.updateHits(qId);
		String id=(String)session.getAttribute("id");
		mv.addObject("id",id);
		mv.addObject("vo", vo);
		return mv;
	}
	

	@RequestMapping(value="/qna_writeReply.do",method = RequestMethod.GET)
	public ModelAndView qnaWriteReply(String qId,HttpSession session) {
		ModelAndView mv=new ModelAndView("/qna/qna_write_reply");
		QnaVO vo=(QnaVO)qnaService.getContent(qId);
		
		String id=(String)session.getAttribute("id");
		mv.addObject("id",id);
		mv.addObject("qId", vo.getqId());
		mv.addObject("qtitle",vo.getqTitle());
		return mv;
	}
	
	@RequestMapping(value="/qna_writeReply.do",method = RequestMethod.POST)
	public ModelAndView qnaWriteReply(QnaVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv=new ModelAndView("redirect: /mygit/qna_list.do?rpage=1");
		//vo.setqUserId("test");
		vo=fileService.fileCheck(vo);
		int result=qnaService.insertReplyProcess(vo);
		if(result!=0) {
			fileService.fileSave(vo, request);
		}
		else {
			//errorPage
		}
		
		return mv;
	}
	
	@RequestMapping(value="/qna_delete.do",method=RequestMethod.GET)
	public String qnaDelete(String qId,HttpServletRequest request) {
		
		QnaVO vo=(QnaVO)qnaService.getContent(qId);
		String sfile="";
		if(vo.getqSfile()!="") {
			sfile=vo.getqSfile();
		}
		
		int result=qnaService.deleteContent(qId);
		
		if(result==1) {
			fileService.deleteFile(sfile, request);
		}
		
		return "redirect:qna_list.do?rpage=1";
	}
	
	
}

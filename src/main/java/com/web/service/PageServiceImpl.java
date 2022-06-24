package com.web.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class PageServiceImpl {
	
	@Autowired
	DigitalMovieServiceImpl digitalMovieService;
	
	@Autowired
	CollectionServiceImpl collectionService;
	
	@Autowired
	QnaServiceImpl qnaService;
	
	@Autowired
	NoticeServiceImpl noticeService;
	
	@Autowired
	DispCommentServiceImpl dispCommentService;
	
	@Autowired
	OfflineDispServiceImpl offnowService;
	
	public Map<String, String> getPageResult(String rpage ,String serviceName,ObjectService service){
		
		Map<String, String> param=new HashMap<String, String>();
		
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 8;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	
		int dbCount = 0; //전체 페이지 수
		
		if(serviceName.equals("digitalMovie")) {
			digitalMovieService=(DigitalMovieServiceImpl)service;
			dbCount=digitalMovieService.getRecordCount();
			pageSize = 8;
		}else if(serviceName.equals("collection")) {
			collectionService=(CollectionServiceImpl)service;
			dbCount=collectionService.getRecordCount();
			pageSize = 8;
		}else if(serviceName.equals("qna")) {
			qnaService=(QnaServiceImpl)service;
			dbCount=qnaService.getRecordCount();
			pageSize=10;
		}else if(serviceName.equals("notice")) {
			noticeService=(NoticeServiceImpl)service;
			dbCount=noticeService.getRecordCount();
			pageSize=10;
		}else if(serviceName.equals("comment")) {
			dispCommentService=(DispCommentServiceImpl)service;
			dbCount=dispCommentService.getRecordCount();
			pageSize=10;
		}else if(serviceName.equals("offNow")) {
			offnowService=(OfflineDispServiceImpl)service;
			dbCount=offnowService.getRecordCount();
			pageSize=8;
		}
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}
		
		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 5;
		}
		
		param.put("start",String.valueOf(startCount));
		param.put("end",String.valueOf(endCount));		
		param.put("dbCount",String.valueOf(dbCount));
		param.put("reqPage",String.valueOf(reqPage));
		param.put("pageSize",String.valueOf(pageSize));
		param.put("pageCount",String.valueOf(pageCount));
		
		return  param;
	}
	
public Map<String, String> getPageResult(String rpage ,String searchtext,String serviceName,ObjectService service){
		
		Map<String, String> param=new HashMap<String, String>();
		
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 8;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	
		int dbCount = 0; //전체 페이지 수
		
		if(serviceName.equals("digitalMovie")) {
			digitalMovieService=(DigitalMovieServiceImpl)service;
			dbCount=digitalMovieService.getRecordCount(searchtext);
			pageSize = 8;
		}else if(serviceName.equals("collection")) {
			collectionService=(CollectionServiceImpl)service;
			dbCount=collectionService.getRecordCount(searchtext);
			pageSize = 8;
		}else if(serviceName.equals("offNow")) {
			offnowService=(OfflineDispServiceImpl)service;
			dbCount=offnowService.getRecordCount(searchtext);
			pageSize=8;
		}
		
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}
		
		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 5;
		}
		
		param.put("start",String.valueOf(startCount));
		param.put("end",String.valueOf(endCount));		
		param.put("dbCount",String.valueOf(dbCount));
		param.put("reqPage",String.valueOf(reqPage));
		param.put("pageSize",String.valueOf(pageSize));
		param.put("pageCount",String.valueOf(pageCount));
		
		return  param;
	}

public Map<String, String> getPageResult(String rpage, String searchcategory, String searchtext, String serviceName,ObjectService service) {
	// TODO Auto-generated method stub
	Map<String, String> param=new HashMap<String, String>();
	
	
	int startCount = 0;
	int endCount = 0;
	int pageSize = 8;	//한페이지당 게시물 수
	int reqPage = 1;	//요청페이지	
	int pageCount = 1;	
	int dbCount = 0; //전체 페이지 수
	
	if(serviceName.equals("notice")) {
		noticeService=(NoticeServiceImpl)service;
		dbCount=noticeService.getRecordCount(searchtext,searchcategory);
		pageSize = 10;
	}else if(serviceName.equals("qna")) {
		qnaService=(QnaServiceImpl)service;
		dbCount=qnaService.getRecordCount(searchtext,searchcategory);
		pageSize = 10;
	}else if(serviceName.equals("comment")) {
		dispCommentService=(DispCommentServiceImpl)service;
		dbCount=dispCommentService.getRecordCount(searchtext,searchcategory);
		pageSize = 10;
	}
	
	
	//총 페이지 수 계산
	if(dbCount % pageSize == 0){
		pageCount = dbCount/pageSize;
	}else{
		pageCount = dbCount/pageSize+1;
	}
	
	//요청 페이지 계산
	if(rpage != null){
		reqPage = Integer.parseInt(rpage);
		startCount = (reqPage-1) * pageSize+1;
		endCount = reqPage *pageSize;
	}else{
		startCount = 1;
		endCount = 5;
	}
	
	param.put("start",String.valueOf(startCount));
	param.put("end",String.valueOf(endCount));		
	param.put("dbCount",String.valueOf(dbCount));
	param.put("reqPage",String.valueOf(reqPage));
	param.put("pageSize",String.valueOf(pageSize));
	param.put("pageCount",String.valueOf(pageCount));
	
	return  param;
}

public Map<String, String> getPageResultCategory(String rpage ,String category,String serviceName,ObjectService service){
	
	Map<String, String> param=new HashMap<String, String>();
	
	
	int startCount = 0;
	int endCount = 0;
	int pageSize = 8;	//한페이지당 게시물 수
	int reqPage = 1;	//요청페이지	
	int pageCount = 1;	
	int dbCount = 0; //전체 페이지 수
	
	if(serviceName.equals("offNow")) {
		offnowService=(OfflineDispServiceImpl)service;
		dbCount=offnowService.getRecordCountCategory(category);
		pageSize=8;
	}
	
	
	//총 페이지 수 계산
	if(dbCount % pageSize == 0){
		pageCount = dbCount/pageSize;
	}else{
		pageCount = dbCount/pageSize+1;
	}
	
	//요청 페이지 계산
	if(rpage != null){
		reqPage = Integer.parseInt(rpage);
		startCount = (reqPage-1) * pageSize+1;
		endCount = reqPage *pageSize;
	}else{
		startCount = 1;
		endCount = 5;
	}
	
	param.put("start",String.valueOf(startCount));
	param.put("end",String.valueOf(endCount));		
	param.put("dbCount",String.valueOf(dbCount));
	param.put("reqPage",String.valueOf(reqPage));
	param.put("pageSize",String.valueOf(pageSize));
	param.put("pageCount",String.valueOf(pageCount));
	
	return  param;
}
}

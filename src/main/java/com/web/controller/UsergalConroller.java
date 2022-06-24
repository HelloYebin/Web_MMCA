package com.web.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.UsergalFrameServiceImpl;
import com.web.vo.UserGalFrameVO;

@Controller
public class UsergalConroller {

	@Autowired
	UsergalFrameServiceImpl usergalFrameService;
	
	@RequestMapping(value="/usergal/usergal_list.do",method=RequestMethod.GET)
	public ModelAndView usergalList(String rpage, HttpSession session) {
		ModelAndView mv=new ModelAndView("/usergallery/usergal_list");
		String id=(String)session.getAttribute("id");
		if(rpage==null) {
			rpage=new String("1");
		}
		mv.addObject("id",id);
		return mv;
	}
	
	@RequestMapping(value="/usergal/collectionList.do",method=RequestMethod.GET)
	public String usergalCollectionList() {
		return "/usergallery/usergal_collection_list";
	}
	
	
	@RequestMapping(value="/usergal/usergalCreate.do",method=RequestMethod.POST, produces = "application/text; charset=UTF-8")	
	@ResponseBody
	public String usergalCreate(String galleryTitle,String galleryUserId,HttpServletResponse response) {
		System.out.println(galleryTitle);
		System.out.println(galleryUserId);
		
		UserGalFrameVO vo=new UserGalFrameVO();
		vo.setGalleryTitle(galleryTitle);
		vo.setGalleryUserId(galleryUserId);
		
		return String.valueOf(usergalFrameService.InsertRecord(vo));
	}
	
	
	
	
	/*
	@RequestMapping(value="/usergal/item_content.do",method=RequestMethod.GET)
	public String usergalItemContent() {
		return "/usergallery/item/usergal_item_content";
	}*/
	
	@RequestMapping(value="/usergal/galleryList.do",method=RequestMethod.GET)
	public String usergalDigigalList() {
		return "/usergallery/usergal_gallery_list";
	}
	/*
	@RequestMapping(value="/usergal/digigal_content.do",method=RequestMethod.GET)
	public String usergalDigigalContent() {
		return "/usergallery/digigal/usergal_digigal_content";
	}*/
	
	
}

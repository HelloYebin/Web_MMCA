package com.web.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.web.vo.CollectionVO;
import com.web.vo.DigitalMovieVO;
import com.web.vo.DispCommentVO;
import com.web.vo.NoticeVO;
import com.web.vo.OffNowVO;
import com.web.vo.QnaVO;

public class FileServiceImpl {
	
	public DigitalMovieVO fileCheck(DigitalMovieVO vo) {
		
		String file="";
		String sfile="";
		if(!vo.getFormFile().getOriginalFilename().equals("")) {
			UUID uuid=UUID.randomUUID();
			file=vo.getFormFile().getOriginalFilename();
			sfile=file+"_"+uuid;			
			vo.setDmFile(file);
			vo.setDmSfile(sfile);
		}
		
		
		return vo;
	}
	
	public CollectionVO fileCheck(CollectionVO vo) {
		
		String file="";
		String sfile="";
		if(!vo.getFormFile().getOriginalFilename().equals("")) {
			UUID uuid=UUID.randomUUID();
			file=vo.getFormFile().getOriginalFilename();
			sfile=file+"_"+uuid;			
			vo.setCoFile(file);
			vo.setCoSfile(sfile);
		}	
		return vo;
	}
	
	public QnaVO fileCheck(QnaVO vo) {
		// TODO Auto-generated method stub
		String file="";
		String sfile="";
		if(!vo.getFormFile().getOriginalFilename().equals("")) {
			UUID uuid=UUID.randomUUID();
			file=vo.getFormFile().getOriginalFilename();
			sfile=file+"_"+uuid;
			vo.setqFile(file);
			vo.setqSfile(sfile);
		}	
		
		return vo;
	}
	
	public NoticeVO fileCheck(NoticeVO vo) {
		// TODO Auto-generated method stub
		String file="";
		String sfile="";
		if(!vo.getFormFile().getOriginalFilename().equals("")) {
			UUID uuid=UUID.randomUUID();
			file=vo.getFormFile().getOriginalFilename();
			sfile=file+"_"+uuid;
			vo.setnFile(file);
			vo.setnSfile(sfile);
		}	
		
		return vo;
	}
	
	public OffNowVO fileCheck(OffNowVO vo) {
		// TODO Auto-generated method stub
		String file="";
		String sfile="";
		String sfileArr[]=new String[4];
		String fileArr[]=new String[4];
		
	if(!vo.getFormFiles().get(0).getOriginalFilename().equals("")) {
			for(int i=0;i<vo.getFormFiles().size();i++) {
				String fileName="";
				String sFileName="";
				
				UUID uuid=UUID.randomUUID();
				fileName=vo.getFormFiles().get(i).getOriginalFilename();
				if(!fileName.equals("")) {
					sFileName=fileName+"_"+uuid;
				}
				
				file+=fileName+", ";
				sfile+=sFileName+", ";
				sfileArr[i]=sfile;
				fileArr[i]=file;
			}
			
		}
		
		vo.setExFile(file);
		vo.setExSfile(sfile);
		vo.setsFileArr(sfileArr);
		vo.setFileArr(fileArr);
		
		return vo;
	}
	
	public DispCommentVO fileCheck(DispCommentVO vo) {
		// TODO Auto-generated method stub
		String file="";
		String sfile="";
		if(!vo.getFormFile().getOriginalFilename().equals("")) {
			UUID uuid=UUID.randomUUID();
			file=vo.getFormFile().getOriginalFilename();
			sfile=file+"_"+uuid;
			vo.setCmFile(file);
			vo.setCmSfile(sfile);
		}	
		
		return vo;
	}
	
	public void fileSave(DigitalMovieVO vo, HttpServletRequest request) throws Exception, IOException {
		if(!vo.getFormFile().getOriginalFilename().equals("")) {
			String rootPath= request.getSession().getServletContext().getRealPath("/");
			rootPath+="resources\\upload\\";

			File newFile=new File(rootPath+vo.getDmSfile());
			vo.getFormFile().transferTo(newFile);
			System.out.println(rootPath);
			
		}
	}
	
	public void fileSave(CollectionVO vo, HttpServletRequest request) throws Exception, IOException {
		if(!vo.getFormFile().getOriginalFilename().equals("")) {
			String rootPath= request.getSession().getServletContext().getRealPath("/");
			rootPath+="resources\\upload\\";

			File newFile=new File(rootPath+vo.getCoSfile());
			vo.getFormFile().transferTo(newFile);
			
		}
	}
	
	public void fileSave(QnaVO vo, HttpServletRequest request) throws Exception, IOException {
		if(!vo.getFormFile().getOriginalFilename().equals("")) {
			String rootPath= request.getSession().getServletContext().getRealPath("/");
			rootPath+="resources\\upload\\";

			File newFile=new File(rootPath+vo.getqSfile());
			vo.getFormFile().transferTo(newFile);
			
		}
	}
	
	public void fileSave(NoticeVO vo, HttpServletRequest request) throws Exception{
		// TODO Auto-generated method stub
		if(!vo.getFormFile().getOriginalFilename().equals("")) {
			String rootPath= request.getSession().getServletContext().getRealPath("/");
			rootPath+="resources\\upload\\";

			File newFile=new File(rootPath+vo.getnSfile());
			vo.getFormFile().transferTo(newFile);
			
		}
	}
	
	public void fileSave(DispCommentVO vo, HttpServletRequest request) throws Exception{
		// TODO Auto-generated method stub
		if(!vo.getFormFile().getOriginalFilename().equals("")) {
			String rootPath= request.getSession().getServletContext().getRealPath("/");
			rootPath+="resources\\upload\\";

			File newFile=new File(rootPath+vo.getCmSfile());
			vo.getFormFile().transferTo(newFile);
			
		}
	}
	
	public void fileSave(OffNowVO vo, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		if(vo.getFormFiles().size()!=0) {
			
			String rootPath= request.getSession().getServletContext().getRealPath("/");
			rootPath+="resources\\upload\\";
			
			for(int i=0;i<vo.getFormFiles().size();i++) {
				if(!vo.getFileArr()[i].equals("")) {
				File newFile=new File(rootPath+vo.getsFileArr()[i]);
				vo.getFormFiles().get(i).transferTo(newFile);
				System.out.println(rootPath);}
			}
			
		}
		
		
	}
	
	public void deleteFile(String sfile, HttpServletRequest request) {
		// TODO Auto-generated method stub
		if(sfile!="") {
			String rootPath= request.getSession().getServletContext().getRealPath("/");
			rootPath+="resources\\upload\\";
			
			File delFile=new File(rootPath+sfile);
			if(delFile.exists()) {
				delFile.delete();
			}
		}
	}
	
	
	

	

	

}

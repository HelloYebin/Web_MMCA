package com.web.vo;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class OffNowVO {
	
	private String exId,exCategory,exTitle,exTermStart,exTermEnd,exPlace,exContent,exAuthor,exHost;
	int exHits,exNo,exPiece,exPrice,rno;
	
	public int getExPrice() {
		return exPrice;
	}

	public void setExPrice(int exPrice) {
		this.exPrice = exPrice;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	private List<CommonsMultipartFile> formFiles;
	private String prevId,nextId,prevTitle,nextTitle,exFile,exSfile;
	private String sFileArr[]=new String[4];
	private String fileArr[]=new String[4];
	
	public String getPrevId() {
		return prevId;
	}

	public void setPrevId(String prevId) {
		this.prevId = prevId;
	}

	public String getNextId() {
		return nextId;
	}

	public void setNextId(String nextId) {
		this.nextId = nextId;
	}

	public String getPrevTitle() {
		return prevTitle;
	}

	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}

	public String getNextTitle() {
		return nextTitle;
	}

	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}

	

	public String getExId() {
		return exId;
	}

	public void setExId(String exId) {
		this.exId = exId;
	}

	public String getExCategory() {
		return exCategory;
	}

	public void setExCategory(String exCategory) {
		this.exCategory = exCategory;
	}

	public String getExTitle() {
		return exTitle;
	}

	public void setExTitle(String exTitle) {
		this.exTitle = exTitle;
	}

	public String getExTermStart() {
		return exTermStart;
	}

	public void setExTermStart(String exTermStart) {
		this.exTermStart = exTermStart;
	}

	

	public String getExTermEnd() {
		return exTermEnd;
	}

	public void setExTermEnd(String exTermEnd) {
		this.exTermEnd = exTermEnd;
	}

	public String getExPlace() {
		return exPlace;
	}

	public void setExPlace(String exPlace) {
		this.exPlace = exPlace;
	}

	public String getExContent() {
		return exContent;
	}

	public void setExContent(String exContent) {
		this.exContent = exContent;
	}

	public String getExAuthor() {
		return exAuthor;
	}

	public void setExAuthor(String exAuthor) {
		this.exAuthor = exAuthor;
	}

	public String getExHost() {
		return exHost;
	}

	public void setExHost(String exHost) {
		this.exHost = exHost;
	}

	public int getExHits() {
		return exHits;
	}

	public void setExHits(int exHits) {
		this.exHits = exHits;
	}

	public int getExNo() {
		return exNo;
	}

	public void setExNo(int exNo) {
		this.exNo = exNo;
	}

	public int getExPiece() {
		return exPiece;
	}

	public void setExPiece(int exPiece) {
		this.exPiece = exPiece;
	}

	public List<CommonsMultipartFile> getFormFiles() {
		return formFiles;
	}

	public void setFormFiles(List<CommonsMultipartFile> formFiles) {
		this.formFiles = formFiles;
	}

	public String getExFile() {
		return exFile;
	}

	public void setExFile(String exFile) {
		this.exFile = exFile;
	}

	public String getExSfile() {
		return exSfile;
	}

	public void setExSfile(String exSfile) {
		this.exSfile = exSfile;
	}

	public String[] getsFileArr() {
		if(exSfile!=null) {
			sFileArr=exSfile.split(", ");
		}else {
			return null;
		}		
		return sFileArr;
	}

	public void setsFileArr(String[] sFileArr) {
		this.sFileArr = sFileArr;
	}

	public String[] getFileArr() {
		if(exFile!=null) {
			fileArr=exFile.split(", ");
		}else {
			return null;
		}
		return fileArr;
	}

	public void setFileArr(String[] fileArr) {
		this.fileArr = fileArr;
	}
	
	
	

	
	
	
}
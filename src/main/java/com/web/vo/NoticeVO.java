package com.web.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class NoticeVO {

	String nId,nTitle,nContent,nDate,nCategory,nFile,nSfile,nWriter;
	int nHits,rno;
	CommonsMultipartFile formFile;
	
	private String prevId,nextId,prevTitle,nextTitle;
	
	public String getnId() {
		return nId;
	}
	public void setnId(String nId) {
		this.nId = nId;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getnDate() {
		return nDate;
	}
	public void setnDate(String nDate) {
		this.nDate = nDate;
	}
	public String getnCategory() {
		return nCategory;
	}
	public void setnCategory(String nCategory) {
		this.nCategory = nCategory;
	}
	public String getnFile() {
		return nFile;
	}
	public void setnFile(String nFile) {
		this.nFile = nFile;
	}
	public String getnSfile() {
		return nSfile;
	}
	public void setnSfile(String nSfile) {
		this.nSfile = nSfile;
	}
	public int getnHits() {
		return nHits;
	}
	public void setnHits(int nHits) {
		this.nHits = nHits;
	}
	
	
	public String getnWriter() {
		return nWriter;
	}
	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}
	public CommonsMultipartFile getFormFile() {
		return formFile;
	}
	public void setFormFile(CommonsMultipartFile formFile) {
		this.formFile = formFile;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
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
	
	
	
}

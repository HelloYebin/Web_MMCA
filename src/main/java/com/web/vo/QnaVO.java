package com.web.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class QnaVO {
	private String qId,qTitle,qContent,qDate,qUserId,qFile,qSfile;
	private int qHits,qOrigin,qGroup,qDepth,rno;
	CommonsMultipartFile formFile;
	
	private String prevId,nextId,prevTitle,nextTitle;
	
	public String getqId() {
		return qId;
	}
	public void setqId(String qId) {
		this.qId = qId;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getqDate() {
		return qDate;
	}
	public void setqDate(String qDate) {
		this.qDate = qDate;
	}
	public String getqUserId() {
		return qUserId;
	}
	public void setqUserId(String qUserId) {
		this.qUserId = qUserId;
	}
	public String getqFile() {
		return qFile;
	}
	public void setqFile(String qFile) {
		this.qFile = qFile;
	}
	public String getqSfile() {
		return qSfile;
	}
	public void setqSfile(String qSfile) {
		this.qSfile = qSfile;
	}
	public int getqHits() {
		return qHits;
	}
	public void setqHits(int qHits) {
		this.qHits = qHits;
	}
	public int getqOrigin() {
		return qOrigin;
	}
	public void setqOrigin(int qOrigin) {
		this.qOrigin = qOrigin;
	}
	public int getqGroup() {
		return qGroup;
	}
	public void setqGroup(int qGroup) {
		this.qGroup = qGroup;
	}
	public int getqDepth() {
		return qDepth;
	}
	public void setqDepth(int qDepth) {
		this.qDepth = qDepth;
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

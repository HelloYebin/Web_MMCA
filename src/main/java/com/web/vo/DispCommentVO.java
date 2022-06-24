package com.web.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class DispCommentVO {
	
		String cmId,cmTitle,cmDisp,cmUserId,cmContent,cmDate,cmFile,cmSfile;
		int cmHits,rno,cmNo;
		
		CommonsMultipartFile formFile;

		
		String prevId,nextId,prevTitle,nextTitle;


		public String getCmId() {
			return cmId;
		}


		public void setCmId(String cmId) {
			this.cmId = cmId;
		}


		public String getCmTitle() {
			return cmTitle;
		}


		public void setCmTitle(String cmTitle) {
			this.cmTitle = cmTitle;
		}


		public String getCmDisp() {
			return cmDisp;
		}


		public void setCmDisp(String cmDisp) {
			this.cmDisp = cmDisp;
		}


		public String getCmUserId() {
			return cmUserId;
		}


		public void setCmUserId(String cmUserId) {
			this.cmUserId = cmUserId;
		}


		public String getCmContent() {
			return cmContent;
		}


		public void setCmContent(String cmContent) {
			this.cmContent = cmContent;
		}


		public String getCmDate() {
			return cmDate;
		}


		public void setCmDate(String cmDate) {
			this.cmDate = cmDate;
		}


		public String getCmFile() {
			return cmFile;
		}


		public void setCmFile(String cmFile) {
			this.cmFile = cmFile;
		}


		public String getCmSfile() {
			return cmSfile;
		}


		public void setCmSfile(String cmSfile) {
			this.cmSfile = cmSfile;
		}


		public int getCmHits() {
			return cmHits;
		}


		public void setCmHits(int cmHits) {
			this.cmHits = cmHits;
		}


		public int getRno() {
			return rno;
		}


		public void setRno(int rno) {
			this.rno = rno;
		}


		public int getCmNo() {
			return cmNo;
		}


		public void setCmNo(int cmNo) {
			this.cmNo = cmNo;
		}


		public CommonsMultipartFile getFormFile() {
			return formFile;
		}


		public void setFormFile(CommonsMultipartFile formFile) {
			this.formFile = formFile;
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

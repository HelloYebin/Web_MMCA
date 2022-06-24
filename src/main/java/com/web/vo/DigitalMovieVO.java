package com.web.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class DigitalMovieVO {
	
	private String dmId,dmTitle,dmUrl,dmFile,dmSfile,dmDate;
	private String dmContent,dmProgram,dmCategory;
	
	private String prevId,nextId,prevTitle,nextTitle;
	
	private String formProgram,formCategory,embedUrl;	
	CommonsMultipartFile formFile;
	
	int dmHits;
	int rno;
	
	public String getDmId() {
		return dmId;
	}
	public void setDmId(String dmId) {
		this.dmId = dmId;
	}
	public String getDmTitle() {
		return dmTitle;
	}
	public void setDmTitle(String dmTitle) {
		this.dmTitle = dmTitle;
	}
	public String getDmUrl() {

		return dmUrl;
	}
	public void setDmUrl(String dmUrl) {
		
		this.dmUrl = dmUrl;
	}
	public String getDmFile() {
		return dmFile;
	}
	public void setDmFile(String dmFile) {
		this.dmFile = dmFile;
	}
	public String getDmSfile() {
		return dmSfile;
	}
	public void setDmSfile(String dmSfile) {
		this.dmSfile = dmSfile;
	}
	public String getDmDate() {
		return dmDate;
	}
	public void setDmDate(String dmDate) {
		this.dmDate = dmDate;
	}
	public String getDmContent() {
		return dmContent;
	}
	public void setDmContent(String dmContent) {
		this.dmContent = dmContent;
	}
	public String getDmProgram() {
		
		if(dmProgram==null) {
			setProgram();
		}
		return dmProgram;
	}
	public void setDmProgram(String dmProgram) {

		this.dmProgram = dmProgram;
	}
	public String getDmCategory() {
		
		if(dmCategory==null) {
			setCategory();
		}		
		return dmCategory;
	}
	public void setDmCategory(String dmCategory) {
		
		this.dmCategory = dmCategory;
	}
	public int getDmHits() {
		return dmHits;
	}
	public void setDmHits(int dmHits) {
		this.dmHits = dmHits;
	}
	public CommonsMultipartFile getFormFile() {
		return formFile;
	}
	public void setFormFile(CommonsMultipartFile formFile) {
		this.formFile = formFile;
	}
	public String getFormProgram() {
		return formProgram;
	}
	public void setFormProgram(String formProgram) {
		this.formProgram = formProgram;
	}
	public String getFormCategory() {
		return formCategory;
	}
	public void setFormCategory(String formCategory) {
		this.formCategory = formCategory;
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
	
	
	public String getEmbedUrl() {
		if(embedUrl==null) {
			setEmbUrl();
		}
		return embedUrl;
	}
	public void setEmbedUrl(String embedUrl) {
		if(this.embedUrl==null) {
			setEmbUrl();
		}
		//this.embedUrl = embedUrl;
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
	public void setProgram(){
		String result="";
	
		
		if (formProgram.equals("p1")) {
			result="관장이 들려주는 소장품 이야기";
		}else if (formProgram.equals("p2")){
			result="큐레이터 전시 해설";
		}else if (formProgram.equals("p3")){
			result="강의&학술토론";
		}else if (formProgram.equals("p4")){
			result="작품&작가";
		}else if (formProgram.equals("p5")){
			result="미술관 소식";
		}else if (formProgram.equals("p6")){
			result="오늘, 이 작품";
		}
		else {
			result="invalid formProgram";
		}
		dmProgram=result;
	}
	
	public void setProgramInv(){
		String result="";
	
		
		if (dmProgram.equals("관장이 들려주는 소장품 이야기")) {
			result="p1";
		}else if (dmProgram.equals("큐레이터 전시 해설")){
			result="p2";
		}else if (dmProgram.equals("강의&학술토론")){
			result="p3";
		}else if (dmProgram.equals("작품&작가")){
			result="p4";
		}else if (dmProgram.equals("미술관 소식")){
			result="p5";
		}else if (dmProgram.equals("오늘, 이 작품")){
			result="p6";
		}
		else {
			result="invalid formProgram";
		}
		formProgram=result;
	}
	
	public void setCategory(){
		String result="";
		
		if (formCategory.equals("c1")) {
			result="전시연계";
		}else if (formCategory.equals("c2")){
			result="전시감상";
		}else if (formCategory.equals("c3")){
			result="진로탐색";
		}else if (formCategory.equals("c4")){
			result="보존과학";
		}else if (formCategory.equals("c5")){
			result="작가인터뷰";
		}else if (formCategory.equals("c6")){
			result="전시소개";
		}
		else {
			result="";
		}
		dmCategory=result;
	}
	
	public void setCategoryInv(){
		String result="";
		
		if (dmCategory.equals("전시연계")) {
			result="c1";
		}else if (dmCategory.equals("전시감상")){
			result="c2";
		}else if (dmCategory.equals("진로탐색")){
			result="c3";
		}else if (dmCategory.equals("보존과학")){
			result="c4";
		}else if (dmCategory.equals("작가인터뷰")){
			result="c5";
		}else if (dmCategory.equals("전시소개")){
			result="c6";
		}
		else {
			result="";
		}
		formCategory=result;
	}
	
	public void setEmbUrl() {
		StringBuffer urlOrigin=new StringBuffer(dmUrl);
		if(urlOrigin.length()>=17) {
			urlOrigin.replace(8, 16, "www.youtube.com/embed");
		}		
		embedUrl=urlOrigin.toString();
	}
}

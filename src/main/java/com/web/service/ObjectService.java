package com.web.service;

import java.util.List;

public interface ObjectService {

	int InsertRecord(Object obj);
	
	int getRecordCount();
	
	int getRecordCount(String keyword);

	int getRecordCount(String searchtext, String searchcategory);
	
	List<Object> getRecordList(int startCount, int endCount);
	
	List<Object> getRecordList(int startCount, int endCount, String searchtext);
	
	List<Object> getRecordList(int startCount, int endCount, String searchtext, String searchcategory);
	
	Object getContent(String Id);

	int deleteContent(String Id);

	int updateContent(Object obj);

	void updateHits(String Id);

	

	

	

}

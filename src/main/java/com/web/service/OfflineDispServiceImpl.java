package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.OffNowDAO;

public class OfflineDispServiceImpl implements OfflineDispService{

	@Autowired
	OffNowDAO offnowDAO;
	
	@Override
	public int InsertRecord(Object obj) {
		// TODO Auto-generated method stub
		return offnowDAO.insert(obj);
	}

	@Override
	public int getRecordCount() {
		// TODO Auto-generated method stub
		return offnowDAO.getCount();
	}
	@Override
	public int getRecordCountCategory(String category) {
		// TODO Auto-generated method stub
		return offnowDAO.getCountCategory(category);
	}

	@Override
	public int getRecordCount(String searchtext) {
		// TODO Auto-generated method stub
		return offnowDAO.getCount(searchtext);
	}

	@Override
	public int getRecordCount(String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount) {
		// TODO Auto-generated method stub
		return offnowDAO.select(startCount, endCount);
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount, String searchtext) {
		// TODO Auto-generated method stub
		return offnowDAO.select(startCount, endCount,searchtext);
	}
	
	@Override
	public List<Object> getRecordListCategory(int startCount, int endCount, String category) {
		// TODO Auto-generated method stub
		return offnowDAO.selectCategory(startCount, endCount,category);
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount, String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getContent(String Id) {
		// TODO Auto-generated method stub
		return offnowDAO.select(Id);
	}

	@Override
	public int deleteContent(String Id) {
		// TODO Auto-generated method stub
		return offnowDAO.delete(Id);
	}

	@Override
	public int updateContent(Object obj) {
		// TODO Auto-generated method stub
		return offnowDAO.update(obj);
	}

	@Override
	public void updateHits(String Id) {
		// TODO Auto-generated method stub
		offnowDAO.updateHits(Id);
	}

	

	

}

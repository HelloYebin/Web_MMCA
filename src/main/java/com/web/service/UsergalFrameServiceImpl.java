package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.UsergalFrameDAO;

public class UsergalFrameServiceImpl implements UsergalFrameService{

	@Autowired
	UsergalFrameDAO usergalFrameDao;
	
	@Override
	public int InsertRecord(Object obj) {
		// TODO Auto-generated method stub
		return usergalFrameDao.insert(obj) ;
	}

	@Override
	public int getRecordCount() {
		// TODO Auto-generated method stub
		return usergalFrameDao.getCount();
	}

	@Override
	public int getRecordCount(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getRecordCount(String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount) {
		// TODO Auto-generated method stub
		return usergalFrameDao.select(startCount, endCount);
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount, String searchtext) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount, String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getContent(String Id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteContent(String Id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateContent(Object obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateHits(String Id) {
		// TODO Auto-generated method stub
		
	}

	
}

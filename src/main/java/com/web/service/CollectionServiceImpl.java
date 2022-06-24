package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.CollectionDAO;
import com.web.vo.CollectionVO;

public class CollectionServiceImpl implements CollectionService{

	@Autowired
	CollectionDAO collectionDao;
	
	@Override
	public int InsertRecord(Object obj) {
		// TODO Auto-generated method stub

		return collectionDao.insert(obj);
	}

	@Override
	public int getRecordCount() {
		// TODO Auto-generated method stub
		return collectionDao.getCount();
	}
	
	@Override
	public int getRecordCount(String searchtext) {
		// TODO Auto-generated method stub
		return collectionDao.getCount(searchtext);
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount) {
		// TODO Auto-generated method stub
		return collectionDao.select(startCount, endCount);
	}
	
	@Override
	public List<Object> getRecordList(int startCount, int endCount,String searchtext) {
		// TODO Auto-generated method stub
		return collectionDao.select(startCount, endCount,searchtext);
	}
	
	@Override
	public Object getContent(String coId) {
		// TODO Auto-generated method stub
		return collectionDao.select(coId);
	}

	@Override
	public void updateHits(String coId) {
		// TODO Auto-generated method stub
		collectionDao.updateHits(coId);
	}

	@Override
	public int deleteContent(String coId) {
		// TODO Auto-generated method stub
		return collectionDao.delete(coId);
	}

	@Override
	public int updateContent(Object obj) {
		// TODO Auto-generated method stub
		
		return collectionDao.update(obj);
	}

	@Override
	public int getRecordCount(String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount, String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}

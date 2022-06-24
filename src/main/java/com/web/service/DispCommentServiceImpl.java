package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.DispCommentDAO;
import com.web.vo.DispCommentVO;

public class DispCommentServiceImpl implements DispCommentService{

	@Autowired
	DispCommentDAO dispCommentDao;
	
	@Override
	public int InsertRecord(Object obj) {
		// TODO Auto-generated method stub	
		return dispCommentDao.insert(obj);
	}

	@Override
	public int getRecordCount() {
		// TODO Auto-generated method stub
		return dispCommentDao.getCount();
	}
	
	@Override
	public int getRecordCount(String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		return dispCommentDao.getCount(searchtext,searchcategory);
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount) {
		// TODO Auto-generated method stub
		return dispCommentDao.select(startCount, endCount);
	}
	
	public List<Object> getRecordList(int startCount, int endCount, String searchcategory, String searchtext) {
		// TODO Auto-generated method stub
		return dispCommentDao.select(startCount, endCount,searchtext,searchcategory);
	}

	@Override
	public Object getContent(String cmId) {
		// TODO Auto-generated method stub
		return dispCommentDao.select(cmId);
	}

	@Override
	public int deleteContent(String cmId) {
		// TODO Auto-generated method stub
		return dispCommentDao.delete(cmId);
	}

	@Override
	public int updateContent(Object obj) {
		// TODO Auto-generated method stub
		DispCommentVO vo=(DispCommentVO)obj;
		return dispCommentDao.update(vo);
	}

	@Override
	public void updateHits(String cmId) {
		// TODO Auto-generated method stub
		dispCommentDao.updateHits(cmId);
	}

	@Override
	public int getRecordCount(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount, String searchtext) {
		// TODO Auto-generated method stub
		return null;
	}

	

	

	
	
}

package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.DigitalMovieDAO;
import com.web.vo.DigitalMovieVO;

public class DigitalMovieServiceImpl  implements DigitalMovieService{

	@Autowired
	DigitalMovieDAO digitalMovieDao;
	
	@Override
	public int InsertRecord(Object obj) {
		DigitalMovieVO vo=(DigitalMovieVO) obj;
		return digitalMovieDao.insert(vo);
	}
	
	@Override
	public int getRecordCount() {
		return digitalMovieDao.getCount();
	}
	
	@Override
	public List<Object> getRecordList(int startCount, int endCount){		
		return digitalMovieDao.select(startCount, endCount);		
	}
	
	@Override
	public Object getContent(String dmId) {
		return digitalMovieDao.select(dmId);	
	}
	
	@Override
	public int deleteContent(String dmId) {
		return digitalMovieDao.delete(dmId);
	}
	@Override
	public int updateContent(Object obj) {
		return digitalMovieDao.update(obj);
	}
	
	@Override
	public void updateHits(String dmId) {
		digitalMovieDao.updateHits(dmId);
	}
	
	@Override
	public int getRecordCount(String searchtext) {
		// TODO Auto-generated method stub
		return digitalMovieDao.getCount(searchtext);
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount, String searchtext) {
		// TODO Auto-generated method stub
		return digitalMovieDao.select(startCount, endCount,searchtext);
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

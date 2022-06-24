package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.QnaDAO;
import com.web.vo.QnaVO;

public class QnaServiceImpl implements QnaService{
	
	@Autowired
	QnaDAO qnaDao;
	
	@Override
	public int InsertRecord(Object obj) {
		// TODO Auto-generated method stub
		QnaVO vo=(QnaVO)obj;
		return qnaDao.insert(vo);
	}
	

	@Override
	public int getRecordCount() {
		// TODO Auto-generated method stub
		return qnaDao.getCount();
	}
	
	public int getRecordCount(String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		return qnaDao.getCount(searchtext, searchcategory);
	}

	@Override
	public List<Object> getRecordList(int startCount, int endCount) {
		// TODO Auto-generated method stub
		return qnaDao.select(startCount, endCount);
	}

	public List<Object> getRecordList(int startCount, int endCount, String searchtext, String searchcategory) {
		// TODO Auto-generated method stub
		return qnaDao.select(startCount, endCount,searchtext, searchcategory);
	}
	
	@Override
	public Object getContent(String qId) {
		// TODO Auto-generated method stub
		return qnaDao.select(qId);
	}

	
	
	@Override
	public int insertReplyProcess(Object obj) {
		// TODO Auto-generated method stub
		int result=0;
		
		QnaVO vo=(QnaVO) obj;
		QnaVO orgVo=(QnaVO) qnaDao.select(vo.getqId());		
		vo.setqOrigin(orgVo.getqOrigin());
		vo.setqGroup(orgVo.getqGroup()+1);
		vo.setqDepth(orgVo.getqDepth()+1);
		
		qnaDao.updateReply(vo.getqGroup(),vo.getqOrigin());
		result=qnaDao.insertReply(vo);

		return result;
	}
	
	@Override
	public int updateContent(Object obj) {
		QnaVO vo=(QnaVO)obj;
		return qnaDao.update(vo);
	}
	
	@Override
	public int deleteContent(String qId) {
		// TODO Auto-generated method stub
		return qnaDao.delete(qId);
	}


	@Override
	public void updateHits(String qId) {
		// TODO Auto-generated method stub
		qnaDao.updateHits(qId);
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

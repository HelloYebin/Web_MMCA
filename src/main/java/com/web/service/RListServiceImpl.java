package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.RListDAO;
import com.web.vo.PostReservationVO;

public class RListServiceImpl implements RListService {
	
	@Autowired
	private RListDAO rlistDAO;
	
	@Override
	public List<PostReservationVO> getRList() {
		return rlistDAO.list();
	}
	@Override
	public List<PostReservationVO> getRList0(String id) {
		return rlistDAO.list0(id);
	}
	@Override
	public List<PostReservationVO> getRList1(String id) {
		return rlistDAO.list1(id);
	}
	@Override
	public List<PostReservationVO> getRList(
			String id, String rtitle, String startdate, String enddate, String rtime, int startrnum, int endrnum) {
		return rlistDAO.list(id, rtitle, startdate, enddate, rtime, startrnum, endrnum);
	}
	@Override
	public int cancelReservation(String rid) {
		return rlistDAO.rcancel(rid);
	}
	@Override
	public int completeReservation(String rid) {
		return rlistDAO.rcomplete(rid);
	}
}
package com.web.service;

import java.util.List;

import com.web.vo.PostReservationVO;

public interface RListService {
	
	public List<PostReservationVO> getRList();
	
	public List<PostReservationVO> getRList0(String id);
	
	public List<PostReservationVO> getRList1(String id);
	
	public List<PostReservationVO> getRList(
		String id, String rtitle, String startdate, String enddate, String rtime, int startrnum, int endrnum);
	
	public int cancelReservation(String rid);
	
	public int completeReservation(String rid);
}

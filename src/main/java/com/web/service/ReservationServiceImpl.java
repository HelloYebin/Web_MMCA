package com.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.dao.ReservationDAO;
import com.web.vo.PostReservationVO;
import com.web.vo.PreReservationVO;

public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDAO reservationDAO;

	@Override
	public ArrayList<PreReservationVO> list() {
		return reservationDAO.list();
	}

	@Override
	public int insert(PostReservationVO vo) {
		return reservationDAO.insert(vo);
	}
	
	@Override
	public int stateUpdate(String res_id) {
		return reservationDAO.stateUpdate(res_id);
	}	
	
	@Override
	public int totalCount() {return 0;}
}
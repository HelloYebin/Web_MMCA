package com.web.service;

import java.util.ArrayList;

import com.web.vo.PostReservationVO;
import com.web.vo.PreReservationVO;

public interface ReservationService {
	int totalCount();
	
	ArrayList<PreReservationVO> list();
	
	int insert(PostReservationVO vo);

	int stateUpdate(String res_id);
}

package com.web.service;

import java.util.List;

public interface OfflineDispService extends ObjectService{

	int getRecordCountCategory(String category);

	List<Object> getRecordListCategory(int startCount, int endCount, String category);

}

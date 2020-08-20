package com.ssafy.service;

import java.sql.Date;
import java.util.List;

import com.ssafy.dto.AirPollution;
import com.ssafy.dto.HouseDeal;
import com.ssafy.dto.HouseInfo;
import com.ssafy.util.PageNavigation;

public interface AirPolluteService {
	public List<AirPollution> selectAll();
	public List<AirPollution> searchByDate(Date date);
	public List<AirPollution> serachByDistrict(String district);
	public PageNavigation makePageNavigation(List<AirPollution> list, int currentPage, int sizePerPage);
}

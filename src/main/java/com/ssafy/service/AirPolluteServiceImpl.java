package com.ssafy.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.AirPolluteDao;
import com.ssafy.dto.AirPollution;
import com.ssafy.dto.HouseDeal;
import com.ssafy.dto.HouseInfo;
import com.ssafy.util.PageNavigation;

@Service
public class AirPolluteServiceImpl implements AirPolluteService {

	@Autowired
	AirPolluteDao dao;
	
	@Override
	public List<AirPollution> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<AirPollution> searchByDate(Date date) {
		List<AirPollution> result = new ArrayList<AirPollution>();
		List<AirPollution> list = this.selectAll();
		for(AirPollution air : list) {
			if(air.getPolluteDate().equals(date)) {
				result.add(air);
			}
		}
		return result;
	}

	@Override
	public List<AirPollution> serachByDistrict(String district) {
		List<AirPollution> result = new ArrayList<AirPollution>();
		List<AirPollution> list = this.selectAll();
		for(AirPollution air : list) {
			if(air.getDistrict().equals(district)) {
				result.add(air);
			}
		}
		return result;
	}
	public PageNavigation makePageNavigation(List<AirPollution> list, int currentPage, int sizePerPage) {
		int naviSize = 10;
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		System.out.println("TotalCount: "+list.size());
		int totalCount = list.size();
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;//
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

}

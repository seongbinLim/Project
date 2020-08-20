package com.ssafy.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.EnvDaoImpl;
import com.ssafy.dto.EnvInfo;
import com.ssafy.util.PageNavigation;
@Service
public class EnvServiceImpl {
	@Autowired
	private EnvDaoImpl envDao;
	
	public List<EnvInfo> viewlist(int currentPage, int sizePerPage, String key, String word, int start) throws SQLException {
		key = key == null ? "" : key;
		word = word == null ? "" : word;
		System.out.println("EnvService");
		return envDao.viewlist(currentPage, sizePerPage, key, word, start);
	}
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) throws SQLException {
		int naviSize = 10;
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = envDao.getTotalCount(key, word);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

}

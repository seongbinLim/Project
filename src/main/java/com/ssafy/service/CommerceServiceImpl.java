package com.ssafy.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.CommerceDaoImpl;
import com.ssafy.dto.CommerceInfo;
import com.ssafy.util.PageNavigation;

@Service
public class CommerceServiceImpl {
	@Autowired
	private CommerceDaoImpl commerceDao;
	
//	public List<CommerceInfo> viewlist(String key, String userId, String word) throws SQLException{
//		key = key == null ? "" : key;
//		userId = userId == null ? "" : userId;
//		word = word == null ? "" : word;
//		return commerceDao.viewlist(key, userId, word);
//	}
	public List<CommerceInfo> viewlist(int currentPage, int sizePerPage, String key, String userId, String word, int start) throws SQLException{
		key = key == null ? "" : key;
		userId = userId == null ? "" : userId;
		word = word == null ? "" : word;
		System.out.println("COMMERCE SERVICE");
		List<CommerceInfo> list = commerceDao.viewlist(currentPage, sizePerPage, key, userId, word, start);
		System.out.println(list.size());
		for(CommerceInfo l : list) {
			System.out.println(l);
		}
		return list;
	}
	
	public int getCnt(String key, String userId, String word) {
		return commerceDao.getTotalCount(key, userId, word);
	}
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String userId, String word) throws Exception {
		int naviSize = 10;
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = commerceDao.getTotalCount(key, userId, word);
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

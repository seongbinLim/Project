package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.NoticeDao;
import com.ssafy.dto.Notice;
import com.ssafy.util.PageNavigation;

@Service
public class NoticeServiceImpl {
	@Autowired
	private NoticeDao dao;
	public void setNotice(Notice notice) {
		dao.insertNotice(notice);
	}
	public void updateNotice(Notice notice) {
		dao.updateNotice(notice);
	}
	public List<Notice> searchAll(int currentPage, int sizePerPage) {
		return dao.selectList(currentPage, sizePerPage);
	}
	public Notice search(int no) {
		return dao.selectNotice(no);
	}
	public void deleteNotice(int no) {
		dao.deleteNotice(no);
	}
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage) throws Exception {
		int naviSize = 10;
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = dao.getTotalCount();
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

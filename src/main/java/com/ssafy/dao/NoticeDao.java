package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Notice;

public interface NoticeDao {
	public Notice selectNotice(int no);
	public List<Notice> selectList(int currentPage, int sizePerPage);
	public void insertNotice(Notice notice);
	public void updateNotice(Notice notice);
	public void deleteNotice(int no);
	public int getTotalCount();
}

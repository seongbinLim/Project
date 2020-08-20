package com.ssafy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	private static final String MAPPER = "notice.";
	
	@Autowired
	SqlSession session;
	
	public Notice selectNotice(int no) {
		return session.selectOne(MAPPER+"selectNoticeByNo", no);
	}
	
	public List<Notice> selectList(int currentPage, int sizePerPage) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("currentPage", currentPage);
		map.put("sizePerPage", sizePerPage);
		return session.selectList(MAPPER+"selectAllNotice", map);
	}
	public void insertNotice(Notice notice) {
		session.selectOne(MAPPER+"insertNotice", notice);
	}
	public void updateNotice(Notice notice) {
		session.selectOne(MAPPER+"updateNotice", notice);
	}
	public void deleteNotice(int no) {
		session.selectOne(MAPPER+"deleteNoticeByNo", no);
	}

	public int getTotalCount() {
		return session.selectOne(MAPPER+"selectCnt");
	}
}


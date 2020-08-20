package com.ssafy.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.EnvInfo;

@Repository
public class EnvDaoImpl {

	private static final String MAPPER = "env.";
	@Autowired
	SqlSession session;
	public List<EnvInfo> viewlist(int currentPage, int sizePerPage, String key, String word, int startNum) throws SQLException {
		System.out.println("EnvRep");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("currentPage", ""+currentPage);
		map.put("siezePerPage", ""+sizePerPage);
		map.put("key", key);
		map.put("word", word);
		map.put("startNum", ""+startNum);
		map.put("endNum", ""+startNum+10);
		return session.selectList(MAPPER+"selectAll");
	}

	public int getTotalCount(String key, String word) throws SQLException {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		return session.selectOne(MAPPER+"selectCnt", map);
	}

}

package com.ssafy.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.CommerceInfo;

@Repository
public class CommerceDaoImpl implements CommerceDao {
	
	private static final String MAPPER = "commerce.";
	
	@Autowired
	SqlSession session;
	
	//mapper에 parameter-page를 통해서 시작과 보여줄 페이지 갯수를 정하고 resulttype으로 com.ssafy....를 return
	@Override
	public List<CommerceInfo> viewlist(int currentPage, int sizePerPage, String key, String userId, String word, int startNum) {
		System.out.println("COMMERCE DAO");
		System.out.println(startNum+" "+(startNum+10));
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", startNum+10);
		return session.selectList(MAPPER+"selectAll", map);
	}
	
	//parameter-map을 통해서 키워드로 검색된 개수를 반환
	@Override
	public int getTotalCount(String key, String userId, String word) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("userId", userId);
		map.put("word", word);
		return session.selectOne(MAPPER+"selectCnt");
	}
}

package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.CommerceInfo;

public interface CommerceDao {
	public List<CommerceInfo> viewlist(int cur, int size, String key, String userId, String word, int startNum);
	public int getTotalCount(String key, String userId, String word);
}

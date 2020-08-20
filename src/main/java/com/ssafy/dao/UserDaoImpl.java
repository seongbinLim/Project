package com.ssafy.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "user.";
	
	public User selectUserInfo(String userid) {
		return sqlSession.selectOne(ns+"selectUserInfo", userid);
	}
	
	public List<User> viewUserList(String key, String word) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		
		return sqlSession.selectList(ns+"selectUserInfo", map);
	}
	@Override
	public void insertUserInfo(User user) {
		System.out.println(user);
		sqlSession.selectOne(ns+"insertUserInfo", user);
	}
	@Override
	public void updateUserInfo(User user) {
		sqlSession.selectOne(ns+"updateUserInfo", user);
	}
	@Override
	public void deleteUserInfo(User user) {
		sqlSession.selectOne(ns+"deleteUserInfo", user);
	}
}

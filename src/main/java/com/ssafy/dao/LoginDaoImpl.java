package com.ssafy.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.User;

@Repository
public class LoginDaoImpl implements LoginDao {
	@Autowired
	private SqlSession sqlSession;
	private String ns = "user.";
	
	public User login(String userid, String userpwd) {
		User user = new User();
		user.setUserId(userid);
		user.setUserPwd(userpwd);
		return sqlSession.selectOne(ns+"login", user);
	}
	public User searchpw(String userid) {
		return sqlSession.selectOne(ns+"searchpw", userid);
	}
}

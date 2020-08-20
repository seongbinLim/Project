package com.ssafy.dao;

import java.sql.SQLException;

import com.ssafy.dto.User;


public interface LoginDao {
	public User login(String userid, String userpwd) throws SQLException;
	public User searchpw(String userid) throws SQLException;
	
}
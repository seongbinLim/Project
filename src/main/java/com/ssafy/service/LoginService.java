package com.ssafy.service;

import com.ssafy.dto.User;

public interface LoginService {
	public User login(String userid, String userpwd) throws Exception;
	public User searchpw(String userid) throws Exception;
}

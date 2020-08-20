package com.ssafy.service;

import com.ssafy.dto.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.LoginDao;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDao loginDao;
	@Autowired
	LoginDao loginDao2;
	
	public User login(String userid, String userpwd) throws Exception {
		if(userid == null || userpwd == null)
			return null;
		return loginDao.login(userid, userpwd);
	}


	public User searchpw(String userid) throws Exception {
		return loginDao2.searchpw(userid);
	}

}

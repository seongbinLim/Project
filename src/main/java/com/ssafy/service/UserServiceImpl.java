package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.UserDao;
import com.ssafy.dto.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	public User selectUserInfo(String userId) {
		return userDao.selectUserInfo(userId);
	}

	public void insertUserInfo(User user) {
		System.out.println(user);
		userDao.insertUserInfo(user);
	}

	public void UpdateUserInfo(User user) {
		userDao.updateUserInfo(user);
	}

	public void DeleteUserInfo(User user) {
		userDao.deleteUserInfo(user);
	}

	public List<User> viewUserList(String key, String word) {
		key = key == null ? "" : key;
		word = word == null ? "" : word;
		return userDao.viewUserList(key, word);
	}
}
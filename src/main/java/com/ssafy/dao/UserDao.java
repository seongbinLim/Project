package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.User;

public interface UserDao {
	public User selectUserInfo(String userId);
	public void insertUserInfo(User user);
	public void updateUserInfo(User user);
	public void deleteUserInfo(User user);
	public List<User> viewUserList(String key, String word);
}

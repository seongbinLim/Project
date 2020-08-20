package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.User;

public interface UserService {
	public User selectUserInfo(String userId);
	public void insertUserInfo(User user);
	public void UpdateUserInfo(User user);
	public void DeleteUserInfo(User user);
	public List<User> viewUserList(String key, String word);
}
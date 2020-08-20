package com.ssafy.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ssafy.dao.UserDao;
import com.ssafy.dto.User;

@Service
public class AccountUserDetailsService implements UserDetailsService {
	@Autowired
	private UserDao dao;

	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		User user = dao.selectUserInfo(userId);
        if(user == null) {
            throw new UsernameNotFoundException(userId);
        }
        System.out.println("oh this");
        return new AccountUserDetails(user);
	}
}

package com.ssafy.security;

import java.util.Arrays;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.ssafy.dto.User;

public class AccountUserDetails implements UserDetails {

    User user;

    public AccountUserDetails(User account) {
    	System.out.println(account.getUserId());
    	System.out.println(account.getUserPwd());
        this.user = account;
    }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
    	if(user.getUserId().equals("admin"))
    		return Arrays.asList(new SimpleGrantedAuthority("ROLE_ADMIN"));
    	return Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"));
    }

    public String getPassword() {
        return user.getUserPwd();
    }

    public String getUsername() {
        return user.getUserName();
    }
    
    public String getUserId() {
        return user.getUserId();
    }
    
    public boolean isAccountNonExpired() {
        return true;
    }

    public boolean isAccountNonLocked() {
        return true;
    }

    public boolean isCredentialsNonExpired() {
        return true;
    }

    public boolean isEnabled() {
        return true;
    }
}

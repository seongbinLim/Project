package com.ssafy.security;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.ssafy.dto.User;
import com.ssafy.service.LoginService;
import com.ssafy.service.UserService;

@Component
public class AuthProvider implements AuthenticationProvider{
	
	@Autowired 
	HttpServletRequest request;

	@Autowired
	LoginService loginService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		//로그인 성공시 획득할 권한 리스트
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        //유저 정보 객체
        User userVo = new User();
        //권한 정보 값이 담길 변수
        String authority = null;
    	
    	String id = (String) authentication.getPrincipal();
		String pw = (String) authentication.getCredentials();
		//String encryptpw = passwordEncoder.encode(pw);
        
        //유저 정보조회
        userVo = userService.selectUserInfo(id);

        // 아이디 존재하지 않는 경우
        if(userVo == null) {
        	throw new UsernameNotFoundException("");
        }
        System.out.println("comeon");
        //비밀번호 불일치
        if(!(passwordEncoder.matches(pw, userVo.getUserPwd()) || pw.equals(userVo.getUserPwd()))) {
        	System.out.println("불일치");
        	System.out.println(pw + ", " + userVo.getUserPwd());
        	throw new BadCredentialsException(id);
        }
        
        if(userVo.getUserId().equals("admin"))
        	authority = "ROLE_ADMIN";
        else
        	authority = "ROLE_USER";
        
        System.out.println(authority);
        authorities.add(new SimpleGrantedAuthority(authority));
			
		return new UsernamePasswordAuthenticationToken(userVo, null, authorities);
	} 
	
	@Override
    public boolean supports(Class<?> authentication) {
		return true;
    }
    
}

package com.ssafy.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.ssafy.dto.User;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		
		//setDefaultTargetUrl("/mvlogin");
		System.out.println("in here");
		Object vo = authentication.getPrincipal();		
		User userVo = (User) vo;
		HttpSession session = request.getSession();	
		
		session.setAttribute("userinfo", userVo);
		session.setAttribute("userid", userVo.getUserId());
		
		System.out.println(userVo.getUserId());
		
		new DefaultRedirectStrategy().sendRedirect(request, response, "/mvmain");
		
	}

}

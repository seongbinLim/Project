package com.ssafy.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.dto.User;
import com.ssafy.service.UserServiceImpl;

@Controller
public class UserController {
	@Autowired
	UserServiceImpl userService;

	@RequestMapping("/memberlist")
	public Object memberList(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("/user/memberlist");
		String key = request.getParameter("key");
		String word = request.getParameter("word");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userinfo");
		try {
			List<User> list = userService.viewUserList(key, word);
			model.addObject("userinfo", user);
			model.addObject("memberlist", list);
			return model;
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("msg", "회원정보 목록을 얻어오는 중 문제가 발생했습니다.");
			return "/error/error.jsp";
		}
		
	}
	@RequestMapping("/delete")
	public String deleteUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userinfo");
		try {
			session.removeAttribute("userinfo");
			userService.DeleteUserInfo(user);
			return "redirect:/mvmain";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("msg", "회원 정보 삭제 중 오류가 발생했습니다.");
			return "/error/error.jsp";
		}
	}
	@RequestMapping("/update")
	public Object updateInfo(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("redirect:/mvmain");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userinfo");
		try {
			user.setUserPwd(request.getParameter("userpwd"));
			user.setUserPhone(request.getParameter("phone"));
			user.setUserArea(request.getParameter("areaname"));
			System.out.println(user);
			userService.UpdateUserInfo(user);
			return model;
		}catch(Exception e){
			e.printStackTrace();
			model = new ModelAndView("error/error");
			model.addObject("msg", "정보 수정 오류");
			return model;
		}
	}
	
	@RequestMapping("/mvupdate")
	public Object updateUser(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("user/membermodify");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userinfo");
		try {
			model.addObject("userinfo", user);
			return model;
		}catch(Exception e){
			e.printStackTrace();
			model = new ModelAndView("error/error");
			model.addObject("msg", "회원정보를 얻어오는 중 문제가 발생했습니다.");
			return model;
		}
	}
		
	@RequestMapping("/memberinfo") 
	public Object memberInfo(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("main");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userinfo");
		try {
			User tmp_user = userService.selectUserInfo(user.getUserId());
			model.addObject("userinfo", tmp_user);
			return model = new ModelAndView("user/memberinfo");
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("msg", "회원정보를 얻어오는 중 문제가 발생했습니다.");
			return "/error/error";
		}
	}

	@RequestMapping("/insert")
	public Object insertUser(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("error/error");
		User user = new User();
		user.setUserName(request.getParameter("username"));
		user.setUserId(request.getParameter("userid"));
		user.setUserPwd(request.getParameter("userpwd"));
		user.setUserBirth(request.getParameter("birth"));
		user.setUserPhone(request.getParameter("phone"));
		try {
			userService.insertUserInfo(user);
			return "redirect:/mvmain";
		}catch(Exception e) {
			model.addObject("msg", "회원가입 중 문제가 발생했습니다.");
			return model;
		}
	}
}

package com.ssafy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.dto.CommerceInfo;
import com.ssafy.dto.User;
import com.ssafy.service.CommerceServiceImpl;
import com.ssafy.util.PageNavigation;

@Controller
public class CommerceController {
	@Autowired
	private CommerceServiceImpl commerceService;
	
	@ResponseBody
	@RequestMapping("/commerceinfo")
	public Object listinfo(HttpServletRequest request) {
		System.out.println("COMMERCE");
		JSONObject json = new JSONObject();
		int currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		String spp = request.getParameter("spp");
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);//sizePerPage
		String key = request.getParameter("key");
		if(key == null) {
			key = "";
		}
		String word = request.getParameter("word");
		if(word == null) {
			word = "";
		}
		System.out.println(currentPage);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userinfo");
		String userId = user.getUserId();
		try {
			int cnt = commerceService.getCnt(key, userId, word);
			System.out.println(cnt);
			List<CommerceInfo> list = commerceService.viewlist(currentPage, sizePerPage, key, userId, word, currentPage*10);
			for(CommerceInfo c : list) {
				System.out.println(c);
			}
			PageNavigation pageNavigation = commerceService.makePageNavigation(currentPage, sizePerPage, key, userId, word);
			json.put("lists", list);
			json.put("userinfo", user);
			json.put("navigation", pageNavigation);
			return json;
		} catch (Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
}

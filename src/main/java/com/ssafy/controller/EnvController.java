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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.dto.EnvInfo;
import com.ssafy.dto.User;
import com.ssafy.service.EnvServiceImpl;
import com.ssafy.util.PageNavigation;

@Controller
public class EnvController{
	
	@Autowired
	private EnvServiceImpl envService;

	@ResponseBody
	@RequestMapping("/envinfo")
	private Object listinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject json = new JSONObject();
		int currentPage = 0;
		if(request.getParameter("page") == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		String spp = request.getParameter("spp");
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);
		String key = request.getParameter("key");
		if(key == null) {
			key = "";
		}
		String word = request.getParameter("word");
		if(word == null) {
			word = "";
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userinfo");
		try {
			System.out.println("key: "+key+", word: "+word);
			//List<EnvInfo> list = envService.viewlist(key, word);
			List<EnvInfo> list = envService.viewlist(currentPage, sizePerPage, key, word, currentPage*10);
			System.out.println(list.size());
			PageNavigation pageNavigation = envService.makePageNavigation(currentPage, sizePerPage, key, word);
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

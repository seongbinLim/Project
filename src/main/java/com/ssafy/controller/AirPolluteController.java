package com.ssafy.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.dto.AirPollution;
import com.ssafy.service.AirPolluteService;
import com.ssafy.util.PageNavigation;

@Controller
public class AirPolluteController {
	@Autowired
	private AirPolluteService service;
	
	@ResponseBody
	@RequestMapping("/airpollute")
	public Object airpollute(@RequestParam int page) {
		JSONObject json = new JSONObject();
		List<AirPollution> list = service.selectAll();
		int currentPage = 0;
		if(page == 0) {
			currentPage = 1;
		}
		else {
			currentPage = page;
		}
		PageNavigation nav = null;
		try {
			nav = service.makePageNavigation(list, currentPage, 10);
			json.put("nav", nav);
		} catch(Exception e) {
			e.printStackTrace();
		}
		int size = list.size();
		int end = page*10 + 11 > size ? size : page*10 + 11;
		List<AirPollution> result = new ArrayList<AirPollution>();
		for(int i = 10*page+1; i < end; i++) {
			result.add(list.get(i));
		}
		json.put("list", result);
		return json;
	}
}

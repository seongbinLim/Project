package com.ssafy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.Cookie;
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

import com.ssafy.dto.HouseData;
import com.ssafy.dto.HouseDeal;
import com.ssafy.dto.HouseDeposit;
import com.ssafy.dto.HouseInfo;
import com.ssafy.dto.HousePageBean;
import com.ssafy.dto.Notice;
import com.ssafy.dto.User;
import com.ssafy.service.HouseDepositService;
import com.ssafy.service.HouseServiceImpl;
import com.ssafy.service.LoginServiceImpl;
import com.ssafy.service.NoticeServiceImpl;
import com.ssafy.service.UserService;
import com.ssafy.util.PageNavigation;

@Controller
public class MainController {
	
	@Autowired
	private LoginServiceImpl loginService;
	@Autowired
	private HouseServiceImpl houseService;
	@Autowired
	private NoticeServiceImpl noticeService;
	@Autowired
	private HouseDepositService depositService;

	private List<HouseData> data;
	@RequestMapping("/")
	public String test() {
		return "index";
	}
	@RequestMapping("vue")
	public String vue() {
		return "vue/index";
	}
	@ResponseBody
	@RequestMapping("/pay")
	public Object pay(HttpServletRequest request, @RequestParam int no) {
		JSONObject json = new JSONObject();
		User user = (User)request.getSession().getAttribute("userinfo");
		HouseDeposit house = depositService.selectByHouseInfo(no);
		System.out.println(house);
		System.out.println(user);
		json.put("addr", house.getHouseinfo());
		json.put("user", user.getUserName());
		json.put("phone", user.getUserPhone());
		json.put("price", (int)house.getDeposit()*1000);
		json.put("no", no);
		String jsonStr = json.toJSONString();
		System.out.println(jsonStr);
		return jsonStr;
	}
	@RequestMapping("/payments/complete") 
	public String payments(HttpServletRequest request, @RequestParam int no) {
		depositService.updateByNo(no);
		String imp_uid = request.getParameter("imp_uid");
		System.out.println("payments "+imp_uid);
		return "redirect:/mvmain";
	}
	@RequestMapping("mvlogin")
	public String mvLogin(HttpServletRequest request) {
		return "user/login";
	}
	@RequestMapping("/mvjoin") 
	public String join(HttpServletRequest request) {
		return "user/join";
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public boolean login(HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		System.out.println(userid+" "+userpwd);
		try {
			User user = loginService.login(userid, userpwd);
			System.out.println(user);
			if(user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", user);
				String idsave = request.getParameter("idsave");
				if("saveok".equals(idsave)) {
					Cookie cookie = new Cookie("ssafy_id", userid);
					cookie.setPath(request.getContextPath());
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);
					response.addCookie(cookie);
				} else {
					Cookie cookies[] = request.getCookies();
					if(cookies != null) {
						for(Cookie cookie : cookies) {
							if("ssafy_id".equals(cookie.getName())) {
								cookie.setMaxAge(0);
								response.addCookie(cookie);
								break;
							}
						}
					}
				}
				return true;
			} 
			else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("userinfo");
		return "redirect:/mvmain";
	}
	
	@ResponseBody
	@RequestMapping("/detail")
	public Object getDetail(@RequestParam int no) {
		JSONObject json = new JSONObject();
		for(HouseData d : data) {
			if(d.getNo() == no) {
				d.setDeposit(Math.round(d.getDeposit()));
				json.put("data", d);
				return json;
			}
		}
		return null;
	}
	@ResponseBody
	@RequestMapping("/list")
	public Object getList(HttpServletRequest request) {
		JSONObject json = new JSONObject();
		String search = (String) request.getParameter("searchType");
		String type = (String) request.getParameter("type");
		String searchValue = (String) request.getParameter("value");
		HousePageBean bean = new HousePageBean();
		boolean[] searchType = new boolean[4];
		if(type == null || type.equals("")) {
			type = "1234";
		}
		for(char c : type.toCharArray()) {
			searchType[c-49] = true;
		}
//		System.out.print("Type: ");
//		for(int i = 0; i < 4; i++) {
//			if(searchType[i]) {
//				System.out.print(i+"\t");
//			}
//		}
//		System.out.println();
		bean.setSearchType(searchType);
		List<HouseDeal> deal = new ArrayList<HouseDeal>();
//		List<HouseDeal> dealResult = new ArrayList();
		List<HouseInfo> info = new ArrayList();
//		List<HouseInfo> infoResult = new ArrayList();
		PageNavigation pageNavigation = null;
		int currentPage = 0;
		
		if(request.getParameter("page") == null) {
			currentPage = 1;
		}
		else {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		String spp = request.getParameter("spp");
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);//sizePerPage
		System.out.println(search+" "+searchValue+" "+(currentPage*10));
		if(searchValue == null || searchValue.equals("")) {
			deal = houseService.searchAll(bean, currentPage*10);
			info = houseService.searchInfo(currentPage*10);
		}
		else {
			System.out.println("searchValue가 비어있지 않습니다.");
			deal = houseService.searchValue(bean, search, searchValue, currentPage*10);
			info = houseService.searchInfoValue(search, searchValue);
		}
		try {
//			dealResult = houseService.viewList(deal, currentPage, sizePerPage);
//			infoResult = houseService.viewInfoList(info, currentPage, sizePerPage);
			pageNavigation = houseService.makePageNavigation(houseService.cnt(), currentPage, sizePerPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<HouseDeposit> deposit = new ArrayList();
		for(HouseDeal d : deal) {
			deposit.add(depositService.selectByHouseInfo(d.getNo()));
		}
//		for(int i = 0; i < deposit.size(); i++) {
//			System.out.println(deposit.get(i)+"\t"+result.get(i));
//		}
		for(HouseInfo h : info) {
			System.out.println(h);
		}
		data = new ArrayList();
		for(int i = 0; i < 10; i++) {
			HouseData house = new HouseData();
			house.setNo(deal.get(i).getNo());
			house.setAptName(deal.get(i).getAptName());
			house.setArea(deal.get(i).getArea());
			house.setBuildYear(deal.get(i).getBuildYear());
			house.setCode(deal.get(i).getCode());
			house.setDealAmount(deal.get(i).getDealAmount());
			house.setDealDay(deal.get(i).getDealDay());
			house.setDealYear(deal.get(i).getDealYear());
			house.setDealMonth(deal.get(i).getDealMonth());
			house.setDong(deal.get(i).getDong());
			house.setFloor(deal.get(i).getFloor());
			house.setImg(deal.get(i).getImg());
			house.setJibun(deal.get(i).getJibun());
			house.setLat(info.get(i).getLat());
			house.setLng(info.get(i).getLng());
			house.setRentMoney(deal.get(i).getRentMoney());
			house.setDeposit(deposit.get(i).getDeposit());
			house.setHouseinfo(deposit.get(i).getHouseinfo());
			house.setIsreserved(deposit.get(i).isIsreserved());
			data.add(house);
//			System.out.println(house);
		}
//		for(HouseData d : data) {
//			System.out.println(d);
//		}
//		System.out.println("리스트들의 크기: "+deal.size()+" "+info.size());
		json.put("list", data);
		json.put("navigation", pageNavigation);
		return json;
	}
	@RequestMapping("/mvmain")
	public String main(HttpServletRequest request) {
		if(request.getSession().getAttribute("userinfo") == null) {
			request.setAttribute("isLogin", "false");	
		}
		else {
			request.setAttribute("isLogin", "true");
		}
		return "index";
	}
	
	@RequestMapping("mvsearchpw")
	public String mvSearchPw() {
		return "user/searchpw";
	}
	@RequestMapping("searchpw")
	public Object searchPw(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("user/result");
		String userid = request.getParameter("userid");
		System.out.println("z1");
		try {
			User user = loginService.searchpw(userid);
			System.out.println("z2");
			if(user != null) {
				HttpSession session = request.getSession();
				model.addObject("searchinfo", user);
	         } 
			else {
				System.out.println("z4");
	            request.setAttribute("msg", "아이디 확인 후 다시 시도해 주세요.");
	            return "error/error";
	         }
	         return model;
	      } catch (Exception e) {
	         e.printStackTrace();
	         request.setAttribute("msg", "비밀번호 찾기 중 문제가 발생했습니다.");
	         model.addObject("msg", "비밀번호 찾기 중 문제가 발생했습니다.");
	         return "error/error";
	      }
	   }
	@ResponseBody
	@RequestMapping("/noticelist")
	public Object noticeList (HttpServletRequest request, @RequestParam int page) {
		JSONObject json = new JSONObject();
		String spp = request.getParameter("spp");
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);
		//List<Notice> list = noticeService.searchAll();
		List<Notice> list = noticeService.searchAll(page, sizePerPage);
		for(Notice n : list) {
			System.out.println(n);
		}
		PageNavigation pageNavigation;
		try {
			System.out.println(page+" "+sizePerPage);
			pageNavigation = noticeService.makePageNavigation(page, sizePerPage);
			page--;
			int size = list.size();
			int end = page*10 + 10 > size ? size : page*10 + 10;
			System.out.println("start at "+(10*page+1)+" and end at "+end);
			List<Notice> result = new ArrayList();
			for(int i = 10*page+1; i <= end; i++) {
				result.add(list.get(i-1));
			}
			json.put("list", result);
			json.put("navigation", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping("/insertnotice")
	public String insertNotice(HttpServletRequest request) {
		return "notice/insertnotice";
	}
	@RequestMapping("/notice")
	public Object notice(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("notice/notice");
		String no = (String)request.getParameter("no");
		Notice notice = noticeService.search(Integer.parseInt(no));
		return model.addObject("notice", notice);
	}
	
	@RequestMapping("/noticemodify")
	public String noticeModify(HttpServletRequest request) {
		Notice notice = new Notice();
		notice.setNo(Integer.parseInt((String)request.getParameter("no")));
		notice.setTitle((String)request.getParameter("title"));
		notice.setContent((String)request.getParameter("content"));
		System.out.println(notice);
		noticeService.updateNotice(notice);
		return "redirect:/noticelist";
	}
	@RequestMapping("/updatenotice") 
	public String upbdateNotice(HttpServletRequest request) {
		return "notice/updatenotice";
	}
	@ResponseBody
	@RequestMapping("/noticedelete")
	public boolean noticeDelete(@RequestParam int no) {
		noticeService.deleteNotice(no);
		return true;
	}
	@ResponseBody
	@RequestMapping("getUser")
	public boolean getUser(HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("userinfo");
		System.out.println(user);
		if(user.getUserId().equals("ssafy")) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping("noticeinsert")
	public boolean noticeInsert(HttpServletRequest request) {
		if(getUser(request)) {
			Notice notice = new Notice();
			notice.setTitle(request.getParameter("title"));
			notice.setContent(request.getParameter("content"));
			noticeService.setNotice(notice);
			return true;
		}
		return false;
	}
}

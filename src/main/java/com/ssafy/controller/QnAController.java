package com.ssafy.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dto.QnA;
import com.ssafy.dto.User;
import com.ssafy.service.QnAService;

import io.swagger.annotations.ApiOperation;

//http://localhost:9999/happyhouse/swagger-ui.html
@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api/qna")
public class QnAController {

	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	private static final String SUCCESS = "success";
		private static final String FAIL = "fail";

	@Autowired
	private QnAService service;

    @ApiOperation(value = "모든 QnA반환.", response = List.class)
	@GetMapping
	public ResponseEntity<List<QnA>> selectAll() throws Exception {
		logger.debug("selectAll - 호출");
		return new ResponseEntity<List<QnA>>(service.retrieveQnA(), HttpStatus.OK);
	}
    
    @RequestMapping(value = "/create", method=RequestMethod.POST)
    @ApiOperation(value = "QnA생성.", response = String.class)
   	@GetMapping
   	public ResponseEntity<String> createQnA(HttpServletRequest request, @RequestParam String qnaTitle, @RequestParam String qnaContent) throws Exception {
   		logger.debug("createQnA - 호출");
   		QnA qna = new QnA();
   		qna.setQnaTitle(qnaTitle);
   		qna.setQnaContent(qnaContent);
   		User user = (User) request.getSession().getAttribute("userinfo");
   		qna.setQnaUserid(user.getUserId());
   		System.out.println("QNA: "+qna);
   		if(service.createQnA(qna)) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   	}
    
    @RequestMapping(value = "/update", method=RequestMethod.POST)
    @ApiOperation(value = "QnA수정.", response = String.class)
   	public ResponseEntity<String> updateQnA(HttpServletRequest request, @RequestParam String qnaTitle, @RequestParam String qnaContent, @RequestParam int qnaNo) throws Exception {
   		logger.debug("updateQnA- 호출");
   		QnA qna = new QnA();
   		qna.setQnaNo(qnaNo);
   		qna.setQnaTitle(qnaTitle);
   		qna.setQnaContent(qnaContent);
   		qna.setQnaUserid(((User) request.getSession().getAttribute("userinfo")).getUserId());
   		System.out.println(qna);
   		if(service.updateQnA(qna)) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   	}
    
    @RequestMapping(value = "/search", method=RequestMethod.GET)
    @ApiOperation(value = "검색된 QnA반환.", response = List.class)
   	@GetMapping
   	public ResponseEntity<QnA> searchQnA(@RequestParam int qnaNo, HttpServletRequest request) throws Exception {
   		logger.debug("searchQnA - 호출");
   		System.out.println("innnnnnnnnn");
   		HttpSession session = request.getSession();
   		String userId = (String) session.getAttribute("userid");
   		logger.debug("userid : " + userId);
   		return new ResponseEntity<QnA>(service.searchQnA(qnaNo), HttpStatus.OK);
   	}

    @RequestMapping(value = "/search2/{qnaNo}", method=RequestMethod.GET)
    @ApiOperation(value = "검색된 QnA반환.", response = List.class)
   	@GetMapping
   	public ResponseEntity<Map<String, Object>> searchQnA2(@PathVariable int qnaNo, HttpServletRequest request) throws Exception {
   		logger.debug("searchQnA2 - 호출");
   		HttpSession session = request.getSession();
   		String userId = (String) session.getAttribute("userid");
   		logger.debug("userid : " + userId);
   		if(userId.equals("admin")) {
   			logger.debug("it's admin");
   		}
   		Map result = new HashMap<>();
   		result.put("qnaResult", service.searchQnA(qnaNo));
   		result.put("userid", userId);
   		return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
   	}
    
    @RequestMapping(value = "/delete", method=RequestMethod.GET)
    @ApiOperation(value = "QnA삭제.", response = String.class)
   	public ResponseEntity<String> deleteQnA(@RequestParam int qnaNo) throws Exception {
   		logger.debug("deleteQnA - 호출");
   		if(service.deleteQnA(qnaNo)) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   	}
}

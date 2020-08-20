package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.QnADao;
import com.ssafy.dto.QnA;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADao dao;
	
	@Override
	public List<QnA> retrieveQnA() {
		return dao.selectQnA();
	}

	@Override
	public boolean createQnA(QnA qna) {
		try {
			dao.createQnA(qna);
			System.out.println("TRUE");
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateQnA(QnA qna) {
		try {
			dao.updateQnA(qna);
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<QnA> searchQnA(String qnaTitle) {
		return dao.searchQnA(qnaTitle);
	}
	@Override
	public QnA searchQnA(int qnaNo) {
		return dao.searchQnAbyNo(qnaNo);
	}
	@Override
	public boolean deleteQnA(int qnaNo) {
		try {
			dao.deleteQnA(qnaNo);
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

}

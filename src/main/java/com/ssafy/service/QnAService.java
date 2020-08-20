package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.QnA;


public interface QnAService {
	List<QnA> retrieveQnA();
	boolean createQnA(QnA qna);
	boolean updateQnA(QnA qna);
	List<QnA> searchQnA(String qnaTitle);
	boolean deleteQnA(int qnaNo);
	public QnA searchQnA(int qnaNo);
}

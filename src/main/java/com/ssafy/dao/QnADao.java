package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.dto.QnA;

public interface QnADao {
	List<QnA> selectQnA();
	void createQnA(QnA qna);
	void updateQnA(QnA qna);
	List<QnA> searchQnA(String qnaTitle);
	QnA searchQnAbyNo(int qnaNo);
	void deleteQnA(int qnaNo);
}

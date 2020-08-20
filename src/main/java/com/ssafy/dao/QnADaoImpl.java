package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.QnA;
@Repository
public class QnADaoImpl implements QnADao {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "qna.";	
	
	@Override
	public List<QnA> selectQnA() {
		return sqlSession.selectList(ns+"selectQnA");
	}

	@Override
	public void createQnA(QnA qna) {
		System.out.println("DAO: "+qna);
		sqlSession.selectOne(ns+"createQnA", qna);
	}

	@Override
	public void updateQnA(QnA qna) {
		sqlSession.selectOne(ns+"updateQnA", qna);
		
	}

	@Override
	public List<QnA> searchQnA(String qnaTitle) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"searchQnA", qnaTitle);
	}

	@Override
	public QnA searchQnAbyNo(int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"searchQnAbyNo", qnaNo);
	}

	@Override
	public void deleteQnA(int qnaNo) {
		sqlSession.selectOne(ns+"deleteQnA", qnaNo);
	}

}

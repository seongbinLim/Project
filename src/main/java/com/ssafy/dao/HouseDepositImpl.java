package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.HouseDeposit;

@Repository
public class HouseDepositImpl implements HouseDepositDao {

	private static final String MAPPER = "housedeposit.";
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<HouseDeposit> selectAll() {
		return session.selectList(MAPPER+"selectAll");
	}

	@Override
	public HouseDeposit selectByHouseInfo(int no) {
		return session.selectOne(MAPPER+"selectByHouseInfo", no);
	}

	@Override
	public void updateByNo(int no) {
		session.selectOne(MAPPER+"updateByNo", no);
	}

}

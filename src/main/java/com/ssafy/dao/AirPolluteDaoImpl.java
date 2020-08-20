package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.AirPollution;

@Repository
public class AirPolluteDaoImpl implements AirPolluteDao {

	private static final String MAPPER = "airpollute.";
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<AirPollution> selectAll() {
		return session.selectList(MAPPER+"selectAll");
	}

}

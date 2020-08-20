package com.ssafy.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.HouseInfo;

@Repository
public class HouseInfoDaoImpl implements HouseInfoDao {

	private static final String MAPPER = "house.";
	
	@Autowired
	SqlSession session;
	@Override
	public List<HouseInfo> searchAllHouseInfo(int num) throws SQLException {
		HashMap<String, Integer> map = new HashMap();
		map.put("startNum", num);
		map.put("endNum", num+10);
		List<HouseInfo> list = session.selectList(MAPPER+"selectAllHouseInfo", map);
		return list;
	}
}

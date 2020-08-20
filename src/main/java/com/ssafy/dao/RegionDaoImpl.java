package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.Region;
import com.ssafy.dto.SelectedRegion;

@Repository
public class RegionDaoImpl implements RegionDao {
	@Autowired
	private SqlSession sqlSession;
	private String ns = "SelectedRegion.";
	
	public List<SelectedRegion> selectedRegion(String userId) {
		return sqlSession.selectList(ns+"selectedRegion", userId);
	}
	public void insertSelectedRegion(String userId, List<Integer> list) {
		for(int l : list) {
			SelectedRegion sr = new SelectedRegion();
			sr.setUserId(userId);
			sr.setRegionNo(l);
			sqlSession.insert(ns+"insertSelectedRegion", sr);
		}
	}
	public List<Region> selectRegion() {
		return sqlSession.selectList(ns+"selectRegion");
	}
}

package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.HouseDepositDao;
import com.ssafy.dto.HouseDeposit;

@Service
public class HouseDepositServiceImpl implements HouseDepositService {

	@Autowired
	HouseDepositDao dao;
	
	@Override
	public List<HouseDeposit> selectAll() {
		return dao.selectAll();
	}

	@Override
	public HouseDeposit selectByHouseInfo(int no) {
		return dao.selectByHouseInfo(no);
		}

	@Override
	public void updateByNo(int no) {
		dao.updateByNo(no);
	}

}

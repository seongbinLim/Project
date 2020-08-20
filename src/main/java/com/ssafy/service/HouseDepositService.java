package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.HouseDeposit;

public interface HouseDepositService {
	public List<HouseDeposit> selectAll();
	public HouseDeposit selectByHouseInfo(int no);
	public void updateByNo(int no);
}

package com.ssafy.dao;

import java.util.List;
import com.ssafy.dto.HouseDeposit;

public interface HouseDepositDao {
	public List<HouseDeposit> selectAll();
	public HouseDeposit selectByHouseInfo(int no);
	public void updateByNo(int no);
}

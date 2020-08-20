package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.AirPollution;

public interface AirPolluteDao {
	List<AirPollution> selectAll();
}

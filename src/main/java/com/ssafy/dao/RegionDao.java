package com.ssafy.dao;

import java.util.List;
import com.ssafy.dto.Region;
import com.ssafy.dto.SelectedRegion;

public interface RegionDao {
	public List<Region> selectRegion();
	public List<SelectedRegion> selectedRegion(String userId);
	public void insertSelectedRegion(String userId, List<Integer> list);
}

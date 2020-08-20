package com.ssafy.dto;

public class SelectedRegion {
	private int no;
	private String userId;
	private int regionNo;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRegionNo() {
		return regionNo;
	}
	public void setRegionNo(int regionNo) {
		this.regionNo = regionNo;
	}
	@Override
	public String toString() {
		return "SelectedRegion [no=" + no + ", userId=" + userId + ", regionNo=" + regionNo + "]";
	}
}

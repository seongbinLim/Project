package com.ssafy.dto;

public class Region {
	private int no;
	private String region;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	@Override
	public String toString() {
		return "Region [no=" + no + ", region=" + region + "]";
	}
}

package com.ssafy.dto;

public class HouseDeposit {
	private int no;
	private String houseinfo;
	private double deposit;
	private boolean isreserved;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getHouseinfo() {
		return houseinfo;
	}
	public void setHouseinfo(String houseinfo) {
		this.houseinfo = houseinfo;
	}
	public double getDeposit() {
		return deposit;
	}
	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}
	public boolean isIsreserved() {
		return isreserved;
	}
	public void setIsreserved(boolean isreserved) {
		this.isreserved = isreserved;
	}
	@Override
	public String toString() {
		return "HouseDeposit [no=" + no + ", houseinfo=" + houseinfo + ", deposit=" + deposit + ", isreserved="
				+ isreserved + "]";
	}
}

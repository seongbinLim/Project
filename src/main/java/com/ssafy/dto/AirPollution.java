package com.ssafy.dto;

import java.sql.Date;

public class AirPollution {
	private Date polluteDate;
	private String district;
	private float o2;
	private float ozon;
	private float carbon;
	private float sulfur;
	private float finedust;
	private float ultraFinedust;
	public Date getPolluteDate() {
		return polluteDate;
	}
	public void setPolluteDate(Date polluteDate) {
		this.polluteDate = polluteDate;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public float getO2() {
		return o2;
	}
	public void setO2(float o2) {
		this.o2 = o2;
	}
	public float getOzon() {
		return ozon;
	}
	public void setOzon(float ozon) {
		this.ozon = ozon;
	}
	public float getCarbon() {
		return carbon;
	}
	public void setCarbon(float carbon) {
		this.carbon = carbon;
	}
	public float getSulfur() {
		return sulfur;
	}
	public void setSulfur(float sulfur) {
		this.sulfur = sulfur;
	}
	public float getFinedust() {
		return finedust;
	}
	public void setFinedust(float finedust) {
		this.finedust = finedust;
	}
	public float getUltraFinedust() {
		return ultraFinedust;
	}
	public void setUltraFinedust(float ultraFinedust) {
		this.ultraFinedust = ultraFinedust;
	}
	@Override
	public String toString() {
		return "AirPollution [polluteDate=" + polluteDate + ", district=" + district + ", o2=" + o2 + ", ozon=" + ozon
				+ ", carbon=" + carbon + ", sulfur=" + sulfur + ", finedust=" + finedust + ", ultraFinedust="
				+ ultraFinedust + "]";
	}
}

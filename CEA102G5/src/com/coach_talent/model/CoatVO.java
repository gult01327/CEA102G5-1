package com.coach_talent.model;

public class CoatVO {
	
	private Integer coaID;
	private Integer talID;

	
	public CoatVO() {
		super();
	}
	public CoatVO(Integer coaID, Integer talID) {
		super();
		this.coaID = coaID;
		this.talID = talID;
	}
	public Integer getCoaID() {
		return coaID;
	}
	public void setCoaID(Integer coaID) {
		this.coaID = coaID;
	}
	public Integer getTalID() {
		return talID;
	}
	public void setTalID(Integer talID) {
		this.talID = talID;
	}

}

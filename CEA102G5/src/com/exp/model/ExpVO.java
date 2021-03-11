package com.exp.model;

public class ExpVO {
	private Integer expID;
	private Integer coaID;
	private String expContent;
	
	public ExpVO() {
		super();
	}
	public ExpVO(Integer expID, Integer coaID, String expContent) {
		super();
		this.expID = expID;
		this.coaID = coaID;
		this.expContent = expContent;
	}
	public Integer getExpID() {
		return expID;
	}
	public void setExpID(Integer expID) {
		this.expID = expID;
	}
	public Integer getCoaID() {
		return coaID;
	}
	public void setCoaID(Integer coaID) {
		this.coaID = coaID;
	}
	public String getExpContent() {
		return expContent;
	}
	public void setExpContent(String expContent) {
		this.expContent = expContent;
	}
	
	
	
	

}

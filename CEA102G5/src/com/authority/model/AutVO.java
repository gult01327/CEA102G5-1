package com.authority.model;

import java.io.Serializable;

public class AutVO implements Serializable {
	private Integer admID;
	private Integer funID;
	
	
	public AutVO() {
		super();
	}
	public AutVO(Integer admID, Integer funID) {
		super();
		this.admID = admID;
		this.funID = funID;
	}
	public Integer getAdmID() {
		return admID;
	}
	public void setAdmID(Integer admID) {
		this.admID = admID;
	}
	public Integer getFunID() {
		return funID;
	}
	public void setFunID(Integer funID) {
		this.funID = funID;
	}
	
	
}

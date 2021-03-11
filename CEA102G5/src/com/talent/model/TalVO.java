package com.talent.model;

import java.io.Serializable;

public class TalVO implements Serializable {
	private Integer talID;
	private String talName;
	
	public TalVO() {
		super();
	}
	public TalVO(Integer talID, String talName) {
		super();
		this.talID = talID;
		this.talName = talName;
	}
	public Integer getTalID() {
		return talID;
	}
	public void setTalID(Integer talID) {
		this.talID = talID;
	}
	public String getTalName() {
		return talName;
	}
	public void setTalName(String talName) {
		this.talName = talName;
	}
}

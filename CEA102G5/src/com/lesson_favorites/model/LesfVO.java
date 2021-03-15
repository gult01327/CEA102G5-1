package com.lesson_favorites.model;

public class LesfVO implements java.io.Serializable {
	private Integer lesID;
	private Integer memID;
	private String lesName;
	public LesfVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getLesID() {
		return lesID;
	}
	public void setLesID(Integer lesID) {
		this.lesID = lesID;
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	public String getLesName() {
		return lesName;
	}
	public void setLesName(String lesName) {
		this.lesName = lesName;
	}
	
}

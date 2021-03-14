package com.recipe_board.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class RecbVO implements Serializable {
	
	private Integer recbID;
	private Integer recID;
	private Integer memID;
	private String memName;
	private String recbContent;
	private Timestamp recbTime;
	private Integer recbStatus;
	private Long recbTimeLong;
	
	
	public RecbVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Integer getRecbID() {
		return recbID;
	}


	public void setRecbID(Integer recbID) {
		this.recbID = recbID;
	}


	public Integer getRecID() {
		return recID;
	}


	public void setRecID(Integer recID) {
		this.recID = recID;
	}


	public Integer getMemID() {
		return memID;
	}


	public void setMemID(Integer memID) {
		this.memID = memID;
	}

	
	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public String getRecbContent() {
		return recbContent;
	}


	public void setRecbContent(String recbContent) {
		this.recbContent = recbContent;
	}


	public Integer getRecbStatus() {
		return recbStatus;
	}


	public void setRecbStatus(Integer recbStatus) {
		this.recbStatus = recbStatus;
	}


	public Timestamp getRecbTime() {
		return recbTime;
	}


	public void setRecbTime(Timestamp recbTime) {
		this.recbTime = recbTime;
	}


	public Long getRecbTimeLong() {
		return recbTimeLong;
	}


	public void setRecbTimeLong(Long recbTimeLong) {
		this.recbTimeLong = recbTimeLong;
	}

	

	
	
	
	
}

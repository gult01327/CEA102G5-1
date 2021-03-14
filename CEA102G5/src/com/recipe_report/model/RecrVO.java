package com.recipe_report.model;

import java.io.Serializable;
import java.sql.Date;

public class RecrVO implements Serializable {

	private Integer recrID;
	private Integer recID;
	private String recName;
	private Integer memID;
	private String recrContent;
	private String recrReplyContent;
	private Date recrTime;
	private Integer recrStatus;
	
	public RecrVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getRecPicSrc() {
		String src = "?id="+this.recID+"&table=RECIPE&column=REC_PICTURE_1&idname=REC_ID";
		
		return src;
	}
	
	
	public String getRecName() {
		return recName;
	}

	public void setRecName(String recName) {
		this.recName = recName;
	}

	public Integer getRecrID() {
		return recrID;
	}

	public void setRecrID(Integer recrID) {
		this.recrID = recrID;
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

	public String getRecrContent() {
		return recrContent;
	}

	public void setRecrContent(String recrContent) {
		this.recrContent = recrContent;
	}

	public String getRecrReplyContent() {
		return recrReplyContent;
	}

	public void setRecrReplyContent(String recrReplyContent) {
		this.recrReplyContent = recrReplyContent;
	}

	public Date getRecrTime() {
		return recrTime;
	}

	public void setRecrTime(Date recrTime) {
		this.recrTime = recrTime;
	}

	public Integer getRecrStatus() {
		return recrStatus;
	}

	public void setRecrStatus(Integer recrStatus) {
		this.recrStatus = recrStatus;
	}
	
	
}

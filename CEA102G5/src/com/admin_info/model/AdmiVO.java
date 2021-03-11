package com.admin_info.model;

import java.io.Serializable;
import java.sql.Date;

public class AdmiVO implements Serializable {
	private Integer admID;
	private String admName;
	private String admAccount;
	private String admPassword;
	private Boolean admStatus;
	private java.sql.Date admDate;
	
	public AdmiVO() {
		super();
	}
	public AdmiVO(Integer admID, String admName, String admAccount, String admPassword, Boolean admStatus,
			Date admDate) {
		super();
		this.admID = admID;
		this.admName = admName;
		this.admAccount = admAccount;
		this.admPassword = admPassword;
		this.admStatus = admStatus;
		this.admDate = admDate;
	}
	public Boolean getAdmStatus() {
		return admStatus;
	}
	public void setAdmStatus(Boolean admStatus) {
		this.admStatus = admStatus;
	}
	public String getAdmPassword() {
		return admPassword;
	}
	public void setAdmPassword(String admPassword) {
		this.admPassword = admPassword;
	}
	public Integer getAdmID() {
		return admID;
	}
	public void setAdmID(Integer admID) {
		this.admID = admID;
	}
	public String getAdmName() {
		return admName;
	}
	public void setAdmName(String admName) {
		this.admName = admName;
	}
	public String getAdmAccount() {
		return admAccount;
	}
	public void setAdmAccount(String admAccount) {
		this.admAccount = admAccount;
	}
	public java.sql.Date getAdmDate() {
		return admDate;
	}
	public void setAdmDate(java.sql.Date admDate) {
		this.admDate = admDate;
	}
}

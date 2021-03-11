package com.coach.model;

import java.io.Serializable;

public class CoaVO implements Serializable {
	private Integer coaID;
	private String coaName;
	private String coaAccount;
	private String coaPassword;
	private String coaSex;
	private Boolean coaStatus;
	private byte[] coaPicture;
	
	public CoaVO() {
		super();
	}
	public CoaVO(Integer coaID, String coaName, String coaAccount, String coaPassword, String coaSex,
			Boolean coaStatus, byte[] coaPicture) {
		super();
		this.coaID = coaID;
		this.coaName = coaName;
		this.coaAccount = coaAccount;
		this.coaPassword = coaPassword;
		this.coaSex = coaSex;
		this.coaStatus = coaStatus;
		this.coaPicture = coaPicture;
	}
	public Integer getCoaID() {
		return coaID;
	}
	public void setCoaID(Integer coaID) {
		this.coaID = coaID;
	}
	public String getCoaName() {
		return coaName;
	}
	public void setCoaName(String coaName) {
		this.coaName = coaName;
	}
	public String getCoaAccount() {
		return coaAccount;
	}
	public void setCoaAccount(String coaAccount) {
		this.coaAccount = coaAccount;
	}
	public String getCoaPassword() {
		return coaPassword;
	}
	public void setCoaPassword(String coaPassword) {
		this.coaPassword = coaPassword;
	}
	public String getCoaSex() {
		return coaSex;
	}
	public void setCoaSex(String coaSex) {
		this.coaSex = coaSex;
	}
	public Boolean getCoaStatus() {
		return coaStatus;
	}
	public void setCoaStatus(Boolean coaStatus) {
		this.coaStatus = coaStatus;
	}
	public byte[] getCoaPicture() {
		return coaPicture;
	}
	public void setCoaPicture(byte[] coaPicture) {
		this.coaPicture = coaPicture;
	}
	public String getPic() {
		return "/FindPicFromDBServlet?table=COACH&col=COA_PICTURE&idName=COA_ID&id="+coaID;
	}
	
}

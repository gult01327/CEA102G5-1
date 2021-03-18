package com.util.model;

import java.io.Serializable;

public class ComCommentVO implements Serializable {
	private Integer memID;
	private String memName;
	private Integer comID;
	private String odMessage;
	private String odResponse;
	private Integer odPoint;
	private Integer ordmID;
	
	public String getMemPicSrc() {
		String src = "?id="+ this.memID +"&table=MEMBER_INFO&column=MEM_PICTURE&idname=MEM_ID";
		return src;
	}
	
	public Integer getOrdmID() {
		return ordmID;
	}
	public void setOrdmID(Integer ordmID) {
		this.ordmID = ordmID;
	}
	public String getOdResponse() {
		return odResponse;
	}
	public void setOdResponse(String odResponse) {
		this.odResponse = odResponse;
	}
	public ComCommentVO() {
		super();
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


	public Integer getComID() {
		return comID;
	}


	public void setComID(Integer comID) {
		this.comID = comID;
	}


	public String getOdMessage() {
		return odMessage;
	}


	public void setOdMessage(String odMessage) {
		this.odMessage = odMessage;
	}


	public Integer getOdPoint() {
		return odPoint;
	}


	public void setOdPoint(Integer odPoint) {
		this.odPoint = odPoint;
	}
	
	
	
}

package com.util.model;

import java.io.Serializable;

public class RecbrUtilVO implements Serializable {
	private Integer recbID;
	private Integer recID;
	private Integer bMemID;
	private String recbContent;
	private Integer recbStatus;
	private Integer recbrID;
	private Integer rMemID;
	private String recbrContent;
	private Integer recbrStatus;
	private String recbrReply;
	
	public RecbrUtilVO () {
		super();
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

	public Integer getbMemID() {
		return bMemID;
	}

	public void setbMemID(Integer bMemID) {
		this.bMemID = bMemID;
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

	

	public Integer getRecbrID() {
		return recbrID;
	}

	public void setRecbrID(Integer recbrID) {
		this.recbrID = recbrID;
	}

	public Integer getrMemID() {
		return rMemID;
	}

	public void setrMemID(Integer rMemID) {
		this.rMemID = rMemID;
	}

	public String getRecbrContent() {
		return recbrContent;
	}

	public void setRecbrContent(String recbrContent) {
		this.recbrContent = recbrContent;
	}

	public Integer getRecbrStatus() {
		return recbrStatus;
	}

	public void setRecbrStatus(Integer recbrStatus) {
		this.recbrStatus = recbrStatus;
	}

	public String getRecbrReply() {
		return recbrReply;
	}

	public void setRecbrReply(String recbrReply) {
		this.recbrReply = recbrReply;
	}
	
	
	
}

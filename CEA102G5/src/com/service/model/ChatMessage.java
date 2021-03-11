package com.service.model;

import com.commodity.model.ComService;
import com.commodity.model.ComVO;
import com.lesson.model.LesService;
import com.lesson.model.LesVO;

public class ChatMessage {
	private String type;
	private String sender;
	private String receiver;
	private String message;
	private String lesID;
	private String comID;
	
	

	public ChatMessage(String type, String sender, String receiver, String message, String lesID, String comID) {
		super();
		this.type = type;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
		this.setLesID(lesID);
		this.setComID(comID);
	}

	public ChatMessage(String type, String sender, String receiver, String message) {
		this.type = type;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLesID() {
		return lesID;
	}

	public void setLesID(String lesID) {
		this.lesID = lesID;
	}

	public String getComID() {
		return comID;
	}

	public void setComID(String comID) {
		this.comID = comID;
	}
	
	public ComVO getComVO() {
		if(this.comID.equals("-1")) {
			return null;
		}else {
			Integer comIDint = new Integer(this.comID);
			return new ComService().getOneCom(comIDint);
		}
	}
	public LesVO getLesVO() {
		if(this.lesID.equals("-1")) {
			return null;
		}else {
			Integer lesIDint = new Integer(this.lesID);
			return new LesService().searchOneByID(lesIDint);
		}
	}
	
}

package com.service.model;

import javax.websocket.Session;

import com.commodity.model.ComVO;
import com.lesson.model.LesVO;

public class SessionInfo {
	LesVO lesVO;
	ComVO comVO;
	Session userSession;
	
	
	public LesVO getLesVO() {
		return lesVO;
	}
	public void setLesVO(LesVO lesVO) {
		this.lesVO = lesVO;
	}
	public ComVO getComVO() {
		return comVO;
	}
	public void setComVO(ComVO comVO) {
		this.comVO = comVO;
	}
	public Session getUserSession() {
		return userSession;
	}
	public void setUserSession(Session userSession) {
		this.userSession = userSession;
	}
	
	
}

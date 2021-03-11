package com.lesson.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/LesWS/{userName}/{LesID}")
public class LesWS {

	@OnOpen
	public void onOpen(@PathParam("userName") String userName, @PathParam("userName") String lesID, Session userSession) throws IOException {

	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}
	
}

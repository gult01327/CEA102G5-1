package com.service.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;

import com.admin_info.model.AdmiService;
import com.admin_info.model.AdmiVO;
import com.commodity.model.ComService;
import com.commodity.model.ComVO;
import com.google.gson.Gson;
import com.lesson.model.LesService;
import com.lesson.model.LesVO;
import com.member.model.MemService;
import com.member.model.MemVO;
import com.service.model.ChatMessage;

import com.service.model.JedisHandleMessage;



@ServerEndpoint("/ServiceWS/{identy}/{identyID}")
public class ServiceWS {
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();
	Gson gson = new Gson();
	

	@OnOpen
	public void onOpen(@PathParam("identy") String identy,@PathParam("identyID") String identyID, Session userSession) throws IOException {
		if (identy.equals("member")) {
			MemService memSvc = new MemService();
			MemVO memVO = memSvc.getOneMem(new Integer(identyID));
			sessionsMap.put("member"+memVO.getMemID(), userSession);
		}else if (identy.equals("admin")) {
			AdmiService admSvc = new AdmiService();
			AdmiVO admiVO = admSvc.getByID(new Integer(identyID));
			sessionsMap.put("admin", userSession);
		}
	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
			ChatMessage cmsg = gson.fromJson(message, ChatMessage.class);
			String sender = cmsg.getSender();
			String receiver = cmsg.getReceiver();
			String action = cmsg.getType();
			message = new JSONObject(cmsg).toString();
			
			
			if ("history".equals(action)) {
				List<String> historyData = JedisHandleMessage.getHistoryMsg(sender, receiver);
				String historyMsg = gson.toJson(historyData);
				ChatMessage cmHistory = new ChatMessage("history", sender, receiver, historyMsg);
				if (userSession != null && userSession.isOpen()) {
					userSession.getAsyncRemote().sendText(gson.toJson(cmHistory));
					return;
				}
			}
			
			if ("historyForLeft".equals(action)) {
				List<String> historyData = JedisHandleMessage.getHistoryMsg(sender, receiver);
				String historyMsg = gson.toJson(historyData);
				ChatMessage cmHistory = new ChatMessage("historyForLeft", sender, receiver, historyMsg);
				if (userSession != null && userSession.isOpen()) {
					userSession.getAsyncRemote().sendText(gson.toJson(cmHistory));
					return;
				}
			}
			Session receiverSession = sessionsMap.get(receiver);
			userSession.getAsyncRemote().sendText(message);
			JedisHandleMessage.saveChatMessage(sender, receiver, message);
			if (receiverSession != null && receiverSession.isOpen()) {
				receiverSession.getAsyncRemote().sendText(message);
			}
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
	
	}
}

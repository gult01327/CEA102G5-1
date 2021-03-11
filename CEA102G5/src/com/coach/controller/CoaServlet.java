package com.coach.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.coach.model.CoaService;
import com.coach.model.CoaVO;


@MultipartConfig
public class CoaServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if(action.equals("add")) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			CoaVO coaVO = new CoaVO();
			try {
				String coaNameReg = "^[\\W_a-zA-Z]{2,30}$";
				String coaName = req.getParameter("coaName").trim();
				if(coaName == null || coaName.length() == 0) {
					errorMsgs.put("�нm�m�W", "�s�W�ɽФŪť�");
				}else if(!coaName.matches(coaNameReg)) {
					errorMsgs.put("�нm�m�W", "�s�W�ɡA���׻ݦb2��30��(�u�त�^��)");
				}else {
					coaVO.setCoaName(coaName);
				}
				String coaAccountReg = "^[A-z0-9]{4,10}$";
				String coaAccount = req.getParameter("coaAccount").trim();
				if (coaAccount.length() == 0) {
					errorMsgs.put("Account", "�s�W�ɡA�b���ФŪť�");
				} else if (!coaAccount.matches(coaAccountReg)) {
					errorMsgs.put("Account", "�s�W�ɡA���׻ݦb4��10��(�u��^��P�Ʀr�զX)");
				} else {
					coaVO.setCoaAccount(coaAccount);
				}
				String coaPasswordReg = "^[A-z0-9]{6,10}$";
				String coaPassword =req.getParameter("coaPassword").trim();
				if (coaPassword.length() == 0) {
					errorMsgs.put("Password", "�s�W�ɡA�K�X�ФŪť�");
				}else if (!coaPassword.matches(coaPasswordReg)){
					errorMsgs.put("Password","�s�W�ɡA���׻ݭn�b6-10����(�u��^�ƲV�M)");
				}else {
					coaVO.setCoaPassword(coaPassword);
				}
				
				String coaSex = req.getParameter("coaSex");
				coaVO.setCoaSex(coaSex);
				
				Part part = req.getPart("coaPicture");
				InputStream is = part.getInputStream();
				byte[] coaPicture = new byte[is.available()];
				is.read(coaPicture);
				is.close();
				
				String [] talStr = req.getParameterValues("talID");
				Integer [] talID = null ;
				if(talStr == null || talStr.length == 0) {
					errorMsgs.put("�M��","�s�W�ɡA�Цܤֿ�ܤ@��");
				}else {
					talID = new Integer [talStr.length];
					for(int i = 0 ; i < talStr.length ; i++) {
						talID[i] =new Integer(talStr[i]);  
					}
				}
				List<String> expContent = new <String>ArrayList();
				String[] expContentStr = req.getParameterValues("expContent");
				if (expContentStr == null||expContentStr.length == 0) {
					expContentStr = new String[0];
				}else{
					for (int i = 0 ; i < expContentStr.length; i ++) {
						if(expContentStr[i].length()!=0) {
							expContent.add(expContentStr[i]);
						}
					}
				}
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("coaVO", coaVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/coach/addCoach.jsp");
					failureView.forward(req, res);
					return;
				}
				
				CoaService coaSvc = new CoaService();
				coaSvc.addCoach(coaName, coaAccount, coaPassword, coaSex, coaPicture, talID, expContent);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/coach/listAllCoach.jsp");
				successView.forward(req, res);
				
			}catch(Exception e) {
				req.setAttribute("coaVO", coaVO);
				errorMsgs.put("Exception",e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/coach/addCoach.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		if(action.equals("forUpdate")) {
			Integer coaID = new Integer(req.getParameter("coaID").trim());
			// new service
			CoaService coaSvc = new CoaService();
			CoaVO coaVO = coaSvc.getOneCoach(coaID);
			req.setAttribute("coaVO", coaVO);
			RequestDispatcher succesView = req.getRequestDispatcher("/back_end/coach/updateCoach.jsp");
			succesView.forward(req, res);
		}
		
		if(action.equals("save")) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			CoaVO coaVO = new CoaVO();
			try {
				Integer coaID = new Integer(req.getParameter("coaID"));
				coaVO.setCoaID(coaID);
				String coaNameReg = "^[\\W_a-zA-Z]{2,30}$";
				String coaName = req.getParameter("coaName").trim();
				if(coaName == null || coaName.length() == 0) {
					errorMsgs.put("�нm�m�W", "�ФŪť�");
				}else if(!coaName.matches(coaNameReg)) {
					errorMsgs.put("�нm�m�W", "���׻ݦb2��30��(�u�त��)");
				}else {
					coaVO.setCoaName(coaName);
				}
				String coaAccountReg = "^[A-z0-9]{4,10}$";
				String coaAccount = req.getParameter("coaAccount").trim();
				if (coaAccount.length() == 0) {
					errorMsgs.put("Account", "�b���ФŪť�");
				} else if (!coaAccount.matches(coaAccountReg)) {
					errorMsgs.put("Account", "���׻ݦb4��10��(�u��^��P�Ʀr�զX)");
				} else {
					coaVO.setCoaAccount(coaAccount);
				}
				String coaPasswordReg = "^[A-z0-9]{6,10}$";
				String coaPassword =req.getParameter("coaPassword").trim();
				if (coaPassword.length() == 0) {
					errorMsgs.put("Password", "�K�X�ФŪť�");
				}else if (!coaPassword.matches(coaPasswordReg)){
					errorMsgs.put("Password","���׻ݭn�b6-10����(�u��^�ƲV�M)");
				}else {
					coaVO.setCoaPassword(coaPassword);
				}
				String coaSex = req.getParameter("coaSex");
				coaVO.setCoaSex(coaSex);
				Part part = req.getPart("coaPicture");
				InputStream is = part.getInputStream();
				byte[] coaPicture = new byte[is.available()];
				is.read(coaPicture);
				String [] talStr = req.getParameterValues("talID");
				Integer [] talID = null;
				if(talStr == null || talStr.length == 0) {
					errorMsgs.put("�M��","�Цܤֿ�ܤ@��");
				}else {
					talID = new Integer [talStr.length];
					for(int i = 0 ; i < talStr.length ; i++) {
						talID[i] =new Integer(talStr[i]);  
					}
				}
				List<String> expContent = new <String>ArrayList();
				String[] expContentStr = req.getParameterValues("expContent");
				if (expContentStr == null||expContentStr.length == 0) {
					expContentStr = new String[0];
				}else{
					for (int i = 0 ; i < expContentStr.length; i ++) {
						if(expContentStr[i].length()!=0) {
							expContent.add(expContentStr[i]);
						}
					}
				}
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("coaVO", coaVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/coach/updateCoach.jsp");
					failureView.forward(req, res);
					return;
				}
				CoaService coaSvc = new CoaService();
				coaSvc.updateCoach(coaID, coaName, coaAccount, coaPassword, coaSex, coaPicture, talID, expContent);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/coach/listAllCoach.jsp");
				successView.forward(req, res);
				
			}catch(Exception e) {
				req.setAttribute("coaVO", coaVO);
				errorMsgs.put("Exception",e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/coach/updateCoach.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		if(action.equals("back")) {
			try {
				Integer coaID = new Integer(req.getParameter("coaID"));
				CoaService coaSvc = new CoaService();
				coaSvc.backCoach(coaID);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/coach/listAllCoach.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/coach/mainCoach.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		if(action.equals("del")) {
			try {
				Integer coaID = new Integer(req.getParameter("coaID"));
				CoaService coaSvc = new CoaService();
				coaSvc.delCoach(coaID);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/coach/listAllCoach.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/coach/mainCoach.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		if(action.equals("search")) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				Integer coaID = new Integer(req.getParameter("coaID"));
				
				CoaService coaSvc = new CoaService();
				CoaVO coaVO = coaSvc.getOneCoach(coaID);
				
				if(coaVO==null) {
					errorMsgs.put("���~","�d�L���G");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/coach/mainCoach.jsp");
					failureView.forward(req, res);
					return;
				}
				
				req.setAttribute("coaVO", coaVO);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/coach/listOneCoach.jsp");
				successView.forward(req, res);
				
			}catch(Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/coach/mainCoach.jsp");
				failureView.forward(req, res);
				return;
			}
		}
	
	}

}

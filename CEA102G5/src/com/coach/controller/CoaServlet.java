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
					errorMsgs.put("教練姓名", "新增時請勿空白");
				}else if(!coaName.matches(coaNameReg)) {
					errorMsgs.put("教練姓名", "新增時，長度需在2到30間(只能中英文)");
				}else {
					coaVO.setCoaName(coaName);
				}
				String coaAccountReg = "^[A-z0-9]{4,10}$";
				String coaAccount = req.getParameter("coaAccount").trim();
				if (coaAccount.length() == 0) {
					errorMsgs.put("Account", "新增時，帳號請勿空白");
				} else if (!coaAccount.matches(coaAccountReg)) {
					errorMsgs.put("Account", "新增時，長度需在4到10間(只能英文與數字組合)");
				} else {
					coaVO.setCoaAccount(coaAccount);
				}
				String coaPasswordReg = "^[A-z0-9]{6,10}$";
				String coaPassword =req.getParameter("coaPassword").trim();
				if (coaPassword.length() == 0) {
					errorMsgs.put("Password", "新增時，密碼請勿空白");
				}else if (!coaPassword.matches(coaPasswordReg)){
					errorMsgs.put("Password","新增時，長度需要在6-10之間(只能英數混和)");
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
					errorMsgs.put("專長","新增時，請至少選擇一項");
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
					errorMsgs.put("教練姓名", "請勿空白");
				}else if(!coaName.matches(coaNameReg)) {
					errorMsgs.put("教練姓名", "長度需在2到30間(只能中文)");
				}else {
					coaVO.setCoaName(coaName);
				}
				String coaAccountReg = "^[A-z0-9]{4,10}$";
				String coaAccount = req.getParameter("coaAccount").trim();
				if (coaAccount.length() == 0) {
					errorMsgs.put("Account", "帳號請勿空白");
				} else if (!coaAccount.matches(coaAccountReg)) {
					errorMsgs.put("Account", "長度需在4到10間(只能英文與數字組合)");
				} else {
					coaVO.setCoaAccount(coaAccount);
				}
				String coaPasswordReg = "^[A-z0-9]{6,10}$";
				String coaPassword =req.getParameter("coaPassword").trim();
				if (coaPassword.length() == 0) {
					errorMsgs.put("Password", "密碼請勿空白");
				}else if (!coaPassword.matches(coaPasswordReg)){
					errorMsgs.put("Password","長度需要在6-10之間(只能英數混和)");
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
					errorMsgs.put("專長","請至少選擇一項");
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
					errorMsgs.put("錯誤","查無結果");
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

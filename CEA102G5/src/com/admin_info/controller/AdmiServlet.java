package com.admin_info.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin_info.model.AdmiService;
import com.admin_info.model.AdmiVO;
import com.coach.model.CoaService;
import com.coach.model.CoaVO;
import com.function_info.model.FuniService;


public class AdmiServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
  
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");
		if(action.equals("login")) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			try {
			String identity = req.getParameter("identity");
			String account = req.getParameter("account");
			String password = req.getParameter("password");
			if(identity.equals("coach")) {
				CoaService coaSvc = new CoaService();
				CoaVO coaVO = coaSvc.getByAccount(account);
				if (coaVO == null) {
					errorMsgs.put("account","無此帳號，請確認");
				}else if(!(coaVO.getCoaPassword().equals(password))) {
					errorMsgs.put("password","密碼錯誤，請確認");
				}else {
					session.setAttribute("coaVO", coaVO);
				}
			}else {
				AdmiService admiSvc = new AdmiService();
				AdmiVO admiVO = admiSvc.getByAccount(account);
				if (admiVO == null) {
					errorMsgs.put("account","無此帳號，請確認");
				}else if(!(admiVO.getAdmPassword().equals(password))) {
					errorMsgs.put("password","密碼錯誤，請確認");
				}else {
					session.setAttribute("admiVO", admiVO);
				}
			}
			if(!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/back_end_login.jsp");
				failureView.forward(req, res);
				return;
			}
			if(identity.equals("coach")) {
				res.sendRedirect(req.getContextPath()+"/back_end/lesson/listLessonForCoach.jsp");
				return;
			}
			res.sendRedirect(req.getContextPath()+"/back_end/back_end_index.jsp");
			return;
			}catch(Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/back_end_login.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		if ("add".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			AdmiVO admiVO = new AdmiVO();
			try {
				String admNameReg = "^[\\W]{2,30}$";
				String admName = req.getParameter("admName");
				if (!admName.matches(admNameReg)) {
					errorMsgs.put("admName", "新增時，長度需在2到30間(只能中文)");
				}else {
					admiVO.setAdmName(admName);
				}
				String admAccountReg = "^[A-z0-9]{4,20}$";
				String admAccount = req.getParameter("admAccount").trim();
				if (!admAccount.matches(admAccountReg)) {
					errorMsgs.put("admAccount", "新增時，長度需在4到20間(只能英文與數字組合)");
				} else {
					admiVO.setAdmAccount(admAccount);
				}
				String admPasswordReg = "^[A-z0-9]{4,20}$";
				String admPassword = req.getParameter("admPassword").trim();
				if (!admPassword.matches(admPasswordReg)) {
					errorMsgs.put("admPassword", "新增時，長度需在4到20間(只能英文與數字組合)");
				} else {
					admiVO.setAdmPassword(admPassword);
				}
				String[] funIDs = req.getParameterValues("funID");
				Integer [] funID = null ;
				if(funIDs == null || funIDs.length == 0) {
					errorMsgs.put("funIDs","新增時，請至少選擇一項");
				}else {
					funID = new Integer [funIDs.length];
					for(int i = 0 ; i < funIDs.length ; i++) {
						funID[i] =new Integer(funIDs[i]);  
					}
				}
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("admiVO", admiVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/admin_info/addAdmin.jsp");
					failureView.forward(req, res);
					return;
				}

				AdmiService admiSvc = new AdmiService();
				admiSvc.addAdmiVO(admName, admAccount, admPassword, funID);

				RequestDispatcher successView = req.getRequestDispatcher("/back_end/admin_info/listAllAdmin.jsp");
				successView.forward(req, res);

			} catch (Exception e) {
				req.setAttribute("admiVO", admiVO);
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/admin_info/addAdmin.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		if("logOut".equals(action)) {			
			req.getSession().removeAttribute("coaVO");
			req.getSession().removeAttribute("admiVO");
			res.sendRedirect(req.getContextPath()+"/back_end/back_end_login.jsp");
		}
		
	}

}

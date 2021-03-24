package com.admin_info.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.admin_info.model.*;
import com.authority.model.AutService;
import com.authority.model.AutVO;
import com.coach.model.*;
import com.commodity.model.ComService;
import com.commodity.model.ComVO;


public class AdmiServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if(action.equals("login")) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();//��key��value
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
					errorMsgs.put("account","�L���b���A�нT�{");
				}else if(!(coaVO.getCoaPassword().equals(password))) {
					errorMsgs.put("password","�K�X���~�A�нT�{");
				}else {
					session.setAttribute("coaVO", coaVO);
				}
			}else {
				AdmiService admiSvc = new AdmiService();
				AdmiVO admiVO = admiSvc.getByAccount(account);
				if (admiVO == null) {
					errorMsgs.put("account","�L���b���A�нT�{");
				}else if(!(admiVO.getAdmPassword().equals(password))) {
					errorMsgs.put("password","�K�X���~�A�нT�{");
				}else {
					session.setAttribute("admiVO", admiVO);
					AutService autSvc = new AutService();
					List<String> funList = autSvc.getFun(admiVO.getAdmID());
					session.setAttribute("funList", funList);
				}
			}
			if(!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/back_end_newlogin.jsp");
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
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/back_end_newlogin.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		if("logOut".equals(action)) {			
			req.getSession().removeAttribute("coaVO");
			req.getSession().removeAttribute("admiVO");
			res.sendRedirect(req.getContextPath()+"/back_end/back_end_newlogin.jsp");
		}
		
	
		if ("add".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			AdmiVO admiVO = new AdmiVO();
			try {
				String admNameReg = "^[A-z\\W]{2,30}$";
				String admName = req.getParameter("admName");
				if (!admName.matches(admNameReg)) {
					errorMsgs.put("admName", "���׻ݦb2��30��(�u��^��Τ���)");
				}else {
					admiVO.setAdmName(admName);
				}
				String admAccountReg = "^[A-z0-9]{4,20}$";
				String admAccount = req.getParameter("admAccount").trim();
				if (!admAccount.matches(admAccountReg)) {
					errorMsgs.put("admAccount", "���׻ݦb4��20��(�u��^��P�Ʀr�զX)");
				} else {
					admiVO.setAdmAccount(admAccount);
				}
				String admPasswordReg = "^[A-z0-9]{4,20}$";
				String admPassword = req.getParameter("admPassword").trim();
				if (!admPassword.matches(admPasswordReg)) {
					errorMsgs.put("admPassword", "���׻ݦb4��20��(�u��^��P�Ʀr�զX)");
				} else {
					admiVO.setAdmPassword(admPassword);
				}
				
				String[] funIDs = req.getParameterValues("funID");
				Integer [] funID = null ;
				if(funIDs == null || funIDs.length == 0) {
					errorMsgs.put("funIDs","�s�W�ɡA�Цܤֿ�ܤ@��");
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
		
		if(action.equals("delete")) {
			try {
				Integer admID = new Integer(req.getParameter("admID"));
				AdmiService admSvc = new AdmiService();
				admSvc.delete(admID);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/admin_info/listAllAdmin.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/admin_info/mainAdmin.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		if(action.equals("back")) {
			try {
				Integer admID = new Integer(req.getParameter("admID"));
				AdmiService admSvc = new AdmiService();
				admSvc.back(admID);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/admin_info/listAllAdmin.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/admin_info/mainAdmin.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		if("forUpdate".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
						
			
			try {
				//*********�����ШD�Ѽ�*********
				int admID = new Integer(req.getParameter("admID"));
				//*********�}�l�d�߸��*********
				AdmiService admSvc = new AdmiService();
				AdmiVO admiVO = admSvc.getByID(admID);
				//*********�d�ߧ����ǳ����*********
				req.setAttribute("admiVO", admiVO);
				String url = "/back_end/admin_info/updateAdmin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				//*********�i�઺���~�B�z*********
			} catch (Exception e) {
				
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/admin_info/listAllAdmin.jsp");
				failureView.forward(req, res);
				
			}
			
		}
		
		
		if("update".equals(action)) {
			
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			//*********�����ШD�Ѽ�*********
			try {
				int admID = Integer.parseInt(req.getParameter("admID").trim());
				
				
				String admNameReg = "^[A-z\\W]{2,30}$";
				String admName = req.getParameter("admName");
				if (!admName.matches(admNameReg)) {
					errorMsgs.put("admName", "���׻ݦb2��30��(�u��^��Τ���)");
				}
				
				String admAccountReg = "^[A-z0-9]{4,20}$";
				String admAccount = req.getParameter("admAccount").trim();
				if (!admAccount.matches(admAccountReg)) {
					errorMsgs.put("admAccount", "���׻ݦb4��20��(�u��^��P�Ʀr�զX)");
				} 
				
				String admPasswordReg = "^[A-z0-9]{4,20}$";
				String admPassword = req.getParameter("admPassword").trim();
				if (!admPassword.matches(admPasswordReg)) {
					errorMsgs.put("admPassword", "���׻ݦb4��20��(�u��^��P�Ʀr�զX)");
				}

				String[] funIDs = req.getParameterValues("funID");
				Integer [] funID = null ;
				if(funIDs == null || funIDs.length == 0) {
					errorMsgs.put("funIDs","�s�W�ɡA�Цܤֿ�ܤ@��");
				}else {
					funID = new Integer [funIDs.length];
					for(int i = 0 ; i < funIDs.length ; i++) {
						funID[i] =new Integer(funIDs[i]);
					}
				}
				
				AdmiVO admiVO = new AdmiVO();
				admiVO.setAdmID(admID);
				admiVO.setAdmName(admName);
				admiVO.setAdmAccount(admAccount);
				admiVO.setAdmPassword(admPassword);
				
				
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("admiVO", admiVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/admin_info/updateAdmin.jsp");
					failureView.forward(req, res);
					return;
				}
				//*******�}�l�ק���*******
				AdmiService admiSvc = new AdmiService();
				admiVO = admiSvc.updateAdm(admName,  admAccount, admPassword, admID, funID);
				//*******�ק粒���ǳ����********
				req.setAttribute("admiVO", admiVO);
				String url = "/back_end/admin_info/listAllAdmin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				
			}catch (Exception e) {
				e.getStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/admin_info/updateAdmin.jsp");
				failureView.forward(req, res);
			}
		
		}

	}
}

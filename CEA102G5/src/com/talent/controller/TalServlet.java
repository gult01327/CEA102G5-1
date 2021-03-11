package com.talent.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.talent.model.TalService;
import com.talent.model.TalVO;

public class TalServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		Set<TalVO> set = new LinkedHashSet<TalVO>();
		String action = req.getParameter("action");
		
		if (action.equals("add")) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String talName = req.getParameter("talName").trim();
				String talNameReg = "^[\\W]{2,60}$";
				if (talName.length() == 0) {
					errorMsgs.put("Name","新增時，名稱請勿空白");
				} else if(!talName.matches(talNameReg)) {
					errorMsgs.put("Name","新增時，長度需在2到60間");
	            }
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/talent/addTalent.jsp");
					failureView.forward(req, res);
					return;
				}
				TalService talSvc = new TalService();
				TalVO TalVO = talSvc.addTalent(talName);
				
				String url = "/back_end/talent/listAllTalent.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
			catch(Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/talent/addTalent.jsp");
				failureView.forward(req, res);
			}

		}

		if (action.equals("getAll")) {
			TalService talSvc = new TalService();
			set = talSvc.getAll();
			req.setAttribute("set", set);
			String url = "/back_end/talent/mainTalent.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
	
		
		if (action.equals("searchOneByID")) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Integer talID = null;
			
			try {
				String st = req.getParameter("talID").trim();
				if (st.length() == 0) {
					errorMsgs.put("ID","編號請勿空白");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/talent/mainTalent.jsp");
					failureView.forward(req, res);
					return;
				}
				try {
					talID = new Integer(st);
				}
				catch(NumberFormatException ne){
					errorMsgs.put("NumberFormatException","請輸入數字");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/talent/mainTalent.jsp");
					failureView.forward(req, res);
					return;
				}
				TalService talSvc = new TalService();
				TalVO talVO = talSvc.getTalent(talID);
				
				if(talVO == null) {
					errorMsgs.put("Exception","查無資訊");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/talent/mainTalent.jsp");
					failureView.forward(req, res);
					return;
				}
			
				req.setAttribute("talVO", talVO);
				String url = "/back_end/talent/listOneTalent.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
			catch(Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/talent/mainTalent.jsp");
				failureView.forward(req, res);
			}

		}
		if (action.equals("del")) {
			Integer talID = new Integer(req.getParameter("talID"));
			TalService talSvc = new TalService();
			talSvc.delTalent(talID);
			
			String url = "/back_end/talent/listAllTalent.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}
		if (action.equals("change")) {
			Integer talID = new Integer(req.getParameter("talID"));
			TalService talSvc = new TalService();
			TalVO talVO = talSvc.getTalent(talID);
			req.setAttribute("talVO", talVO);
			String url = "/back_end/talent/updateTalent.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		if (action.equals("save")) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Integer talID = new Integer(req.getParameter("talID"));
			TalVO talVO = new TalVO();
			talVO.setTalID(talID);
			try {
				String talName = req.getParameter("talName").trim();
				String talNameReg = "^[\\W]{2,60}$";
				if (talName.length() == 0) {
					errorMsgs.put("Name","名稱請勿空白");
				} else if(!talName.matches(talNameReg)) {
					errorMsgs.put("Name","長度需在2到60間");
	            }
				talVO.setTalName(talName);
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("talVO", talVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/talent/updateTalent.jsp");
					failureView.forward(req, res);
					return;
				}
				TalService talSvc = new TalService();
				talSvc.updateTalent(talID, talName);
				
				String url = "/back_end/talent/listAllTalent.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
			catch(Exception e) {
				req.setAttribute("talVO", talVO);
				errorMsgs.put("Exception",e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/talent/updateTalent.jsp");
				failureView.forward(req, res);
			}
		}

	}

}

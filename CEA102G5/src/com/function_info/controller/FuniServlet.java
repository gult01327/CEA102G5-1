package com.function_info.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.function_info.model.FuniService;
import com.function_info.model.FuniVO;

public class FuniServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("add".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String funNameReg = "^[\\W]{2,30}$";
				String funName = req.getParameter("funName");
				if (!funName.matches(funNameReg)) {
					errorMsgs.put("funName", "新增時，長度需在2到30間(只能中文)");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/function_info/addFun.jsp");
					failureView.forward(req, res);
					return;
				}

				FuniService funiSvc = new FuniService();
				funiSvc.addFuni(funName);

				RequestDispatcher successView = req.getRequestDispatcher("/back_end/function_info/listAllFun.jsp");
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/function_info/addFun.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		if ("update".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			FuniVO funiVO = new FuniVO();
			try {
				String funNameReg = "^[\\W]{2,30}$";
				String funName = req.getParameter("funName");
				if (!funName.matches(funNameReg)) {
					errorMsgs.put("funName", "新增時，長度需在2到30間(只能中文)");
				}
				Integer funID = new Integer(req.getParameter("funID"));
				funiVO.setFunID(funID);
				funiVO.setFunName(funName);
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("funiVO", funiVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/function_info/updateFun.jsp");
					failureView.forward(req, res);
					return;
				}
				FuniService funiSvc = new FuniService();
				funiSvc.updateFuni(funID, funName);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/function_info/listAllFun.jsp");
				successView.forward(req, res);
			} catch (Exception e) {
				req.setAttribute("funiVO", funiVO);
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/function_info/updateFun.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		if ("del".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			try {
				Integer funID = new Integer(req.getParameter("funID"));
				FuniService funiSvc = new FuniService();
				funiSvc.delFuni(funID);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/function_info/listAllFun.jsp");
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/function_info/listAllFun.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		if ("forUpdate".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			try {
				Integer funID = new Integer(req.getParameter("funID"));
				FuniService funiSvc = new FuniService();
				FuniVO funiVO = funiSvc.findOne(funID);
				req.setAttribute("funiVO", funiVO);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/function_info/updateFun.jsp");
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/function_info/listAllFun.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		

	}

}

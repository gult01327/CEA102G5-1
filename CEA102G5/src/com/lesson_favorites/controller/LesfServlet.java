package com.lesson_favorites.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lesson_favorites.model.LesfService;
import com.lesson_favorites.model.LesfVO;
import com.lesson_reservation.model.LesrService;
import com.lesson_reservation.model.LesrVO;

public class LesfServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne".equals(action)) { // 來自listAllEmp.jsp的請求

			/*************************** 1.接收請求參數 ****************************************/			
			Integer memID = new Integer(req.getParameter("mem_ID"));

			/*************************** 2.開始查詢資料 ****************************************/
			LesfService lesfSvc = new LesfService();
			Set<LesfVO> lesfVO = lesfSvc.getOneLesf(memID);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("lesfVO", lesfVO); // 資料庫取出的empVO物件,存入req
			String url = "/front_end/les_favorites/listFavorites.jsp";;
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 **********************************/

		}
		
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求		
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String requestURL = req.getParameter("requestURL");
				String lesID = null;
				lesID = req.getParameter("les_ID");
				LesfVO lesfVO = new LesfVO();
				lesfVO.setLesID(new Integer(lesID));
			
				String memID = null;
				memID = req.getParameter("mem_ID");
				lesfVO.setMemID(new Integer(memID));
				/*************************** 2.開始新增資料 ***************************************/
				LesfService lesfSvc = new LesfService();
				lesfVO = lesfSvc.addLesf(new Integer(lesID), new Integer(memID));

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);			
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp
			String requestURL = req.getParameter("requestURL");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer lesID = new Integer(req.getParameter("les_ID"));
				Integer memID = new Integer(req.getParameter("mem_ID"));

				/*************************** 2.開始刪除資料 ***************************************/
				LesfService lesfSvc = new LesfService();
				lesfSvc.deleteLesf(lesID, memID);
				
				Set<LesfVO> lesfVO = lesfSvc.getOneLesf(memID);
				req.setAttribute("lesfVO", lesfVO); // 資料庫取出的empVO物件,存入req
				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/les_favorites/listAllFavorites.jsp");
				failureView.forward(req, res);
			}
		}
	}

}

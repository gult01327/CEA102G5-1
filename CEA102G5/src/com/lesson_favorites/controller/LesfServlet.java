package com.lesson_favorites.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.lesson_favorites.model.LesfService;
import com.lesson_favorites.model.LesfVO;

public class LesfServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();

		if ("getOne".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			/*************************** 1.�����ШD�Ѽ� ****************************************/
			Integer memID = new Integer(req.getParameter("mem_ID"));

			/*************************** 2.�}�l�d�߸�� ****************************************/
			LesfService lesfSvc = new LesfService();
			Set<LesfVO> lesfVO = lesfSvc.getOneLesf(memID);

			/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
			req.setAttribute("lesfVO", lesfVO); // ��Ʈw���X��empVO����,�s�Jreq
			String url = "/front_end/les_favorites/listFavorites.jsp";
			;
			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
			successView.forward(req, res);

			/*************************** ��L�i�઺���~�B�z **********************************/

		}

		if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD
			/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/
			Integer memID = new Integer(req.getParameter("memID"));
			Integer lesID = new Integer(req.getParameter("lesID"));
			LesfService lesfSvc = new LesfService();
			lesfSvc.addLesf(lesID, memID);
			return;

		}

		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp
			String requestURL = req.getParameter("requestURL");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				Integer lesID = new Integer(req.getParameter("les_ID"));
				Integer memID = new Integer(req.getParameter("mem_ID"));

				/*************************** 2.�}�l�R����� ***************************************/
				LesfService lesfSvc = new LesfService();
				lesfSvc.deleteLesf(lesID, memID);

				Set<LesfVO> lesfVO = lesfSvc.getOneLesf(memID);
				req.setAttribute("lesfVO", lesfVO); // ��Ʈw���X��empVO����,�s�Jreq
				/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/

				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/les_favorites/listAllFavorites.jsp");
				failureView.forward(req, res);
			}
		}
	}

}

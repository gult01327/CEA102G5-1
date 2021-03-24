package com.lesson_reservation.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import com.lesson_reservation.model.*;
import com.lesson.model.*;

public class LesrServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getByMember".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("mem_ID");

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�|���s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/reservation/searchReservation.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				Integer memID = null;
				try {
					memID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�|���s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/reservation/searchReservation.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/

				LesrService lesrSvc = new LesrService();
				Set<LesrVO> lesrVO = lesrSvc.getLesByMem(memID);
				if (lesrVO == null) {
					errorMsgs.add("�L���|��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/reservation/searchReservation.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/

				req.setAttribute("listByMember", lesrVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back_end/reservation/listByMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/reservation/searchReservation.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getByLesson".equals(action)) { // �Ӧ�select_page.jsp���ШD

			String str = req.getParameter("les_ID");

			Integer lesID = new Integer(str);
			LesrService lesrSvc = new LesrService();
			Set<LesrVO> lesrVO = lesrSvc.getMemByLes(lesID);
			req.setAttribute("listByLesson", lesrVO); // ��Ʈw���X��empVO����,�s�Jreq
			req.setAttribute("les_ID", lesID);
			String url = "/back_end/reservation/listByLesson.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
			successView.forward(req, res);

		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			/*************************** 1.�����ШD�Ѽ� ****************************************/
			Integer lesID = new Integer(req.getParameter("les_ID"));
			Integer memID = new Integer(req.getParameter("mem_ID"));

			/*************************** 2.�}�l�d�߸�� ****************************************/
			LesrService lesrSvc = new LesrService();
			LesrVO lesrVO = lesrSvc.getOneLesr(lesID, memID);

			/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
			req.setAttribute("lesrVO", lesrVO); // ��Ʈw���X��empVO����,�s�Jreq
			String url = "/back_end/reservation/updateReservation.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
			successView.forward(req, res);

			/*************************** ��L�i�઺���~�B�z **********************************/

		}

		if ("getOne".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			/*************************** 1.�����ШD�Ѽ� ****************************************/
			Integer lesID = new Integer(req.getParameter("les_ID"));
			Integer memID = new Integer(req.getParameter("mem_ID"));

			/*************************** 2.�}�l�d�߸�� ****************************************/
			LesrService lesrSvc = new LesrService();
			LesrVO lesrVO = lesrSvc.getOneLesr(lesID, memID);

			/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
			req.setAttribute("lesrVO", lesrVO); // ��Ʈw���X��empVO����,�s�Jreq
			String url = "/front_end/reservation/updateReservation.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
			successView.forward(req, res);

			/*************************** ��L�i�઺���~�B�z **********************************/

		}
		if ("getOne2".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			/*************************** 1.�����ШD�Ѽ� ****************************************/
			Integer lesID = new Integer(req.getParameter("les_ID"));
			Integer memID = new Integer(req.getParameter("mem_ID"));

			/*************************** 2.�}�l�d�߸�� ****************************************/
			LesrService lesrSvc = new LesrService();
			LesrVO lesrVO = lesrSvc.getOneLesr(lesID, memID);

			/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
			req.setAttribute("lesrVO", lesrVO); // ��Ʈw���X��empVO����,�s�Jreq
			String url = "/front_end/reservation/update1Reservation.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
			successView.forward(req, res);

			/*************************** ��L�i�઺���~�B�z **********************************/

		}

		if ("getOne1".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			/*************************** 1.�����ШD�Ѽ� ****************************************/
			Integer memID = new Integer(req.getParameter("mem_ID"));
			LesrService lesrSvc = new LesrService();
			Set<LesrVO> lesrVO = lesrSvc.getLesByMem(memID);

			/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/

			req.setAttribute("listByMember", lesrVO); // ��Ʈw���X��empVO����,�s�Jreq
			String url = "/front_end/reservation/listReservation.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
			successView.forward(req, res);

			/*************************** ��L�i�઺���~�B�z *************************************/

		}

		if ("update".equals(action))

		{ // �Ӧ�update_emp_input.jsp���ШD

			String requestURL = req.getParameter("requestURL");
			LesrVO lesrVO = new LesrVO();
			String lesID = req.getParameter("les_ID");
			String memID = req.getParameter("mem_ID");
			String lesrComments = req.getParameter("lesr_comments").trim();
			String lesrAnswer = req.getParameter("lesr_answer").trim();
			Boolean lesrStatus = new Boolean(req.getParameter("lesr_status").trim());
			String lesrReason = req.getParameter("lesr_reason").trim();
			java.sql.Date lesrTime = java.sql.Date.valueOf(req.getParameter("lesr_time").trim());

			lesrVO.setLesID(new Integer(lesID));
			lesrVO.setMemID(new Integer(memID));
			lesrVO.setLesrComments(lesrComments);
			lesrVO.setLesrAnswer(lesrAnswer);
			lesrVO.setLesrStatus(lesrStatus);
			lesrVO.setLesrTime(lesrTime);

			/*************************** 2.�}�l�ק��� *****************************************/
			LesrService lesrSvc = new LesrService();
			lesrVO = lesrSvc.updateLesr(new Integer(lesID), new Integer(memID), lesrComments, lesrAnswer, lesrStatus,
					lesrReason, lesrTime);
			if (!lesrStatus) {
				LesVO lesVO = new LesVO();
				LesService lesSvc = new LesService();
				lesID = req.getParameter("les_ID");
				lesVO = lesSvc.searchOneByID(new Integer(lesID));
				Integer lesAlready = (lesVO.getLesAlready()) - 1;
				lesVO.setLesAlready(new Integer(lesAlready));
				lesVO = lesrSvc.updateLes(new Integer(lesID), new Integer(lesAlready));
			}

			/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/

			Set<LesrVO> lesrlSet = lesrSvc.getMemByLes(new Integer(lesID));
			req.setAttribute("listByLesson", lesrlSet);
			Set<LesrVO> lesrmSet = lesrSvc.getLesByMem(new Integer(memID));
			req.setAttribute("listByMember", lesrmSet);

			req.setAttribute("lesrVO", lesrVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
			req.setAttribute("les_ID", lesID);

			String url = requestURL;
			RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
			successView.forward(req, res);

			/*************************** ��L�i�઺���~�B�z *************************************/
		}

		if ("updateOne".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD

			LesrVO lesrVO = new LesrVO();
			String lesID = req.getParameter("les_ID");
			String memID = req.getParameter("mem_ID");
			String lesrComments = req.getParameter("lesr_comments").trim();
			String lesrAnswer = req.getParameter("lesr_answer").trim();
			Boolean lesrStatus = new Boolean(req.getParameter("lesr_status").trim());
			String lesrReason = req.getParameter("lesr_reason").trim();
			java.sql.Date lesrTime = java.sql.Date.valueOf(req.getParameter("lesr_time").trim());

			lesrVO.setLesID(new Integer(lesID));
			lesrVO.setMemID(new Integer(memID));
			lesrVO.setLesrComments(lesrComments);
			lesrVO.setLesrAnswer(lesrAnswer);
			lesrVO.setLesrStatus(lesrStatus);
			lesrVO.setLesrTime(lesrTime);

			/*************************** 2.�}�l�ק��� *****************************************/
			LesrService lesrSvc = new LesrService();
			lesrVO = lesrSvc.updateLesr(new Integer(lesID), new Integer(memID), lesrComments, lesrAnswer, lesrStatus,
					lesrReason, lesrTime);
			if (!lesrStatus) {
				LesVO lesVO = new LesVO();
				LesService lesSvc = new LesService();
				lesID = req.getParameter("les_ID");
				lesVO = lesSvc.searchOneByID(new Integer(lesID));
				Integer lesAlready = (lesVO.getLesAlready()) - 1;
				lesVO.setLesAlready(new Integer(lesAlready));
				lesVO = lesrSvc.updateLes(new Integer(lesID), new Integer(lesAlready));
			}

			/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/

			Set<LesrVO> lesrlSet = lesrSvc.getMemByLes(new Integer(lesID));
			req.setAttribute("listByLesson", lesrlSet);
			Set<LesrVO> lesrmSet = lesrSvc.getLesByMem(new Integer(memID));
			req.setAttribute("listByMember", lesrmSet);

			req.setAttribute("lesrVO", lesrVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
			req.setAttribute("les_ID", lesID);

			String url = "/front_end/reservation/listReservation.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
			successView.forward(req, res);

			/*************************** ��L�i�઺���~�B�z *************************************/
		}

		if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD

			Integer memID = new Integer(req.getParameter("mem_ID"));
			Integer lesID = new Integer(req.getParameter("les_ID"));
			String lesrComments = "";
			String lesrAnswer = "";
			Boolean lesrStatus = true;
			String lesrReason = "";

			LesrVO lesrVO = new LesrVO();

			lesrVO.setLesID(new Integer(lesID));
			lesrVO.setMemID(new Integer(memID));
			lesrVO.setLesrComments(lesrComments);
			lesrVO.setLesrAnswer(lesrAnswer);
			lesrVO.setLesrStatus(lesrStatus);
			lesrVO.setLesrReason(lesrReason);

			LesVO lesVO = new LesVO();
			LesService lesSvc = new LesService();
			LesrService lesrSvc = new LesrService();

			lesVO = lesSvc.searchOneByID(lesID);
			Integer lesAlready = (lesVO.getLesAlready()) + 1;
			lesVO.setLesAlready(new Integer(lesAlready));
			/*************************** 2.�}�l�s�W��� ***************************************/

			lesrVO = lesrSvc.addLesr(new Integer(lesID), new Integer(memID), lesrComments, lesrAnswer, lesrStatus,
					lesrReason);
			lesVO = lesrSvc.updateLes(new Integer(lesID), new Integer(lesAlready));
			
			/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
			String url = req.getContextPath()+"/front_end/reservation/listReservation.jsp";
			res.sendRedirect(url);		
		}

		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				Integer lesID = new Integer(req.getParameter("les_ID"));
				Integer memID = new Integer(req.getParameter("mem_ID"));

				/*************************** 2.�}�l�R����� ***************************************/
				LesrService lesrSvc = new LesrService();
				lesrSvc.deleteLesr(lesID, memID);

				/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/
				String url = "/back_end/reservation/listAllReservation.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/reservation/listAllReservation.jsp");
				failureView.forward(req, res);
			}
		}
	}

}

package com.recipe_board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.member.model.MemService;
import com.member.model.MemVO;
import com.recipe_board.model.RecbService;
import com.recipe_board.model.RecbVO;
import com.recipeb_report.model.RecbrService;

/**
 * Servlet implementation class RecbServlet
 */
@WebServlet("/RecbServlet")
public class RecbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecbServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		
		if("addRecbMsg".equals(action)) {
			Integer recID = new Integer(request.getParameter("recID"));
			Integer memID = new Integer(request.getParameter("memID"));
			String recbContent = request.getParameter("textmsg");
			RecbService recbSvc = new RecbService();
			RecbVO recbVO = recbSvc.addBoardMsg(recID, memID, recbContent);
			MemService memSvc = new MemService();
			MemVO memVO = memSvc.getOneMem(recbVO.getMemID());
			recbVO.setMemName(memVO.getMemName());
			String jsonStr = new JSONObject(recbVO).toString();
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
		}
		
		if("getAllMsgByRecID".equals(action)) {
			Integer recID = new Integer(request.getParameter("recID"));
			RecbService recbSvc = new RecbService();
			List<RecbVO> list = recbSvc.getAllMsgByRecID(recID);
			String jsonStr = new JSONArray(list).toString();
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
		}
		
		if("deleteMsg".equals(action)) {
			Integer recbID = new Integer(request.getParameter("recbID"));
			RecbService recbSvc = new RecbService();
			recbSvc.updateRecbStatus(recbID, 1);
			String str = "success";
			
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(str);
			out.flush();
			out.close();
			
		}
		
		if("addMsgReport".equals(action)) {
			Integer recbID = new Integer(request.getParameter("recbID"));
			Integer memID = new Integer(request.getParameter("sessionMemID"));
			String recbrContent = request.getParameter("msgReport");
			RecbrService recbrSvc = new RecbrService();
			recbrSvc.addRecbReport(recbID,memID, recbrContent);
			String str = "success";
			
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(str);
			out.flush();
			out.close();
		}
		
		if("updateMsgStatus".equals(action)) {
			Integer recbID = new Integer(request.getParameter("recbID"));
			String str = request.getParameter("recbStatus");
			Integer recbStatus = null;
			if(str.equals("1")) {
				recbStatus = 0;
			}else {
				recbStatus = 1;
			}
			RecbService recbSvc = new RecbService();
			recbSvc.updateRecbStatus(recbID, recbStatus);
			String url = "/back_end/recipe/listAllRecb_Report.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		
		if("addRecbReply".equals(action)) {
			Integer recbrID = new Integer(request.getParameter("recbrID"));
			String recbrReply = request.getParameter("msgReport");
			Integer recbrStatus = 1;
			RecbrService recbrSvc = new RecbrService();
			recbrSvc.updateRecbrReply(recbrID, recbrReply, recbrStatus);
			
		}
	}

}

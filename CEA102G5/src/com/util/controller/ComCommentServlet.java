package com.util.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.commodity.model.ComService;
import com.commodity.model.ComVO;
import com.mysql.cj.Session;
import com.orderdetail.model.OdService;
import com.orderdetail.model.OdVO;
import com.util.model.ComCommentService;
import com.util.model.ComCommentVO;

/**
 * Servlet implementation class ComCommentServlet
 */
@WebServlet("/ComCommentServlet")
public class ComCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if("getAll".equals(action)) {
			ComCommentService ComCommentSvc = new ComCommentService();
			List<ComCommentVO> list = ComCommentSvc.getAll();
			String jsonStr = new JSONArray(list).toString();
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
		}
		if("UpdateComComment".equals(action)) {
			String[] odResponse= request.getParameterValues("odResponse");
			String[] comID= request.getParameterValues("comID");
			String[] ordmID= request.getParameterValues("ordmID");
			List<OdVO> list = new ArrayList<OdVO>();
			Boolean allBlank =true;
			for(int i = 0;i<odResponse.length;i++) {
				if (odResponse[i]!=null&&odResponse[i]!="") {
					OdVO odVO = new OdVO();
					odVO.setOdResponse(odResponse[i]);
					odVO.setComID(Integer.parseInt(comID[i]));
					odVO.setOmID(Integer.parseInt(ordmID[i]));
					list.add(odVO);
					allBlank = false;
				}
			}
			if(allBlank) {
				HttpSession session = request.getSession();
				session.setAttribute("allBlank", "½Ð¿é¤J¦^ÂÐ");
				String url = "/back_end/commodity/listAllComComment.jsp";
				RequestDispatcher falseView = request.getRequestDispatcher(url);
				falseView.forward(request, response);
			}else {
				OdService OdSvc = new OdService();
				OdSvc.updateByComComment(list);
				String url = "/back_end/commodity/listAllComComment.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			}
		}
	}

}

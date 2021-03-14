package com.recipe_report.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.recipe_report.model.RecrService;
import com.recipe_report.model.RecrVO;

/**
 * Servlet implementation class RecrServlet
 */
@WebServlet("/RecrServlet")
public class RecrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecrServlet() {
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
		HttpSession session = request.getSession();
		
		if("addReport".equals(action)) {
			Integer recID = new Integer(request.getParameter("recID"));
			Integer memID = new Integer(request.getParameter("sessionMemID"));
			String recrContent = request.getParameter("report");
			
			RecrService recrSvc = new RecrService();
			recrSvc.addReport(recID, memID, recrContent);
			String str = "true";
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(str);
			out.flush();
			out.close();
		}
		
		if("getAllRecrbyStatus".equals(action)) {
			Integer status = new Integer(request.getParameter("status"));
			RecrService recrSvc = new RecrService();
			List<RecrVO> list = recrSvc.getAllByStatus(status);
			String jsonStr = new JSONArray(list).toString();
			
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
			
		}
		
		if("addRecrReply".equals(action)) {
			Integer recrID = new Integer(request.getParameter("msgRecrID"));
			String recrContent = request.getParameter("msgReport");
			
			RecrService recrSvc = new RecrService();
			recrSvc.updateRecrReply(recrContent, recrID);
			
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(recrContent);
			out.flush();
			out.close();
		}
	}

}

package com.commodity_category.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.commodity.model.ComVO;
import com.commodity_category.model.ComcService;
import com.commodity_category.model.ComcVO;

/**
 * Servlet implementation class ComcServlet
 */
@WebServlet("/ComcServlet")
public class ComcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComcServlet() {
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
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if("insert".equals(action)) {
			try {
				String comcName = request.getParameter("comcName");
				ComcVO comcVO = new ComcVO();
				comcVO.setComcName(comcName);
				ComcService comcSvc = new ComcService();
				comcVO = comcSvc.addComc(comcName);
				String url = "/back_end/commodity/listAllComc.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if("listCom_ByComcID_A".equals(action) || "listCom_ByComcID_B".equals(action)) {
			try {
				int comcID = Integer.parseInt(request.getParameter("comcID"));
				ComcService comcSvc = new ComcService();
				Set<ComVO> set = comcSvc.getComsByComcID(comcID);
				request.setAttribute("listCom_ByComcID", set);
				String url=null;
				if("listCom_ByComcID_A".equals(action)) {
					url="/back_end/commodity/listCom_ByComcID.jsp";
				}else if("listCom_ByComcID_B".equals(action)){
					url="/back_end/commodity/listAllComc.jsp";
				}
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if("listComforRec".equals(action)) {
			int comcID = Integer.parseInt(request.getParameter("comcID"));
			ComcService comcSvc = new ComcService();
			Set<ComVO> set = comcSvc.getComsByComcID(comcID);
			String jsonStr = new JSONArray(set).toString();
			
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
		}

		
		if("delete_Comc".equals(action)) {
			
			try {
				//1.����
				int comcID = Integer.parseInt(request.getParameter("comcID"));
				//2.�s��DB�R�����
				ComcService comSvc = new ComcService();
				comSvc.deleteComc(comcID);
				//3.�R�����\�A�ǳ����
				String url = "/back_end/commodity/listAllComc.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				//4.�Ұ����
				successView.forward(request, response);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		if("listComforByComcIDwithSales".equals(action)) {
			Integer comcID = new Integer(request.getParameter("comcID"));
			ComcService comcSvc = new ComcService();
			List<ComVO> list = comcSvc.getComsByComcIDwithSales(comcID);
			String jsonStr = new JSONArray(list).toString();
			
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
			
		}
		
	}

}

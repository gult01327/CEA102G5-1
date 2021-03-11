package com.recipe.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONArray;

import com.commodity.model.ComService;
import com.commodity.model.ComVO;
import com.recipe.model.RecService;

/**
 * Servlet implementation class RecServlet
 */
@WebServlet("/RecServlet")
@MultipartConfig
public class RecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecServlet() {
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
		
		if("getComifChecked".equals(action)) {
			//抓取剛勾選的值並強轉為Integer陣列
			String[] arr = request.getParameterValues("checkComID");
			System.out.println("剛勾選的"+Arrays.toString(arr));
			Integer[] checkComID =new Integer[arr.length];
			for(int i = 0 ;i<checkComID.length;i++) {
				checkComID[i] = Integer.parseInt(arr[i]);
			}
			//抓取已經勾選的值並強轉為Integer陣列
			String[] arr2 = request.getParameterValues("checkedComID");
			if(arr2!=null) {
				System.out.println("已選的"+Arrays.toString(arr2));
				Integer[] checkedComID = new Integer[arr2.length];
				for(int i = 0 ; i<checkedComID.length;i++) {
					checkedComID[i] = Integer.parseInt(arr2[i]);
				}
				
				//合併兩個Integer陣列
				Integer[] concat = new Integer[checkComID.length+checkedComID.length];
				System.arraycopy(checkComID, 0, concat, 0, checkComID.length);
				System.arraycopy(checkedComID, 0, concat, checkComID.length, checkedComID.length);
				System.out.println(Arrays.toString(concat));
				
				ComService comSvc2 = new ComService();
				Set<ComVO> set2 = new LinkedHashSet<ComVO>();
				ComVO comVO2 = null;
				for(int i = 0;i<concat.length;i++) {
					comVO2 = comSvc2.getOneCom(concat[i]);
					set2.add(comVO2);

				}
				String jsonStr2 = new JSONArray(set2).toString();
//				System.out.println(jsonStr2);
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(jsonStr2);
				out.flush();
				out.close();
			}else {
			
				ComService comSvc = new ComService();
				Set<ComVO> set = new LinkedHashSet<ComVO>();
				ComVO comVO = null;
				for(int i = 0 ; i<checkComID.length;i++) {
					comVO = comSvc.getOneCom(checkComID[i]);
					set.add(comVO);
				}
				
				String jsonStr = new JSONArray(set).toString();
//				System.out.println(jsonStr);
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
			}
		}
		
		if("addRecipe".equals(action)) {
			try {
				Integer memID = new Integer(request.getParameter("memID"));
				String recName = request.getParameter("title");
				Part part = request.getPart("recipePic");
				InputStream is = part.getInputStream();
				byte[] recPic = null;
				recPic = new byte[is.available()];
				is.read(recPic);
				is.close();
				String recContent = request.getParameter("intro");
				Integer recSize = new Integer(request.getParameter("size"));
				Integer recCookTime = new Integer(request.getParameter("cooktime"));
				Float totalCal = new Float(request.getParameter("totalCal"));
				Float totalCarb = new Float(request.getParameter("totalCarb"));
				Float totalPro = new Float(request.getParameter("totalPro"));
				Float totalFat = new Float(request.getParameter("totalFat"));
				Integer recStatus = 1;
				Integer recBonus = 0;
				//食材表格用
				String[] arr = request.getParameterValues("alreadyChecked");
				Integer[] ingComID = new Integer[arr.length];
				for (int i = 0; i < ingComID.length; i++) {
					ingComID[i] = Integer.parseInt(arr[i]);
				}
				String[] arr2 = request.getParameterValues("ingNums");
				Integer[] ingNums = new Integer[arr2.length];
				for (int i = 0; i < ingNums.length; i++) {
					ingNums[i] = Integer.parseInt(arr2[i]);
				}
				//步驟表格用
				String[] fileNameArr = request.getParameterValues("fileName");
//				
				List<Part> listPart = new ArrayList<Part>();
				for(int i = 0 ;i<fileNameArr.length;i++) {
					Part partStep = request.getPart(fileNameArr[i]);
					listPart.add(partStep);
				}
				
				String[] recsContent = request.getParameterValues("stepText");
				RecService recSvc = new RecService();
				recSvc.addRec(memID, recName, recPic, recContent, recSize, recCookTime, totalCal, totalCarb, totalPro,
						totalFat, recStatus, recBonus, ingComID, ingNums, listPart, recsContent);
				String url = "/back_end/recipe/listAllRec.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

}

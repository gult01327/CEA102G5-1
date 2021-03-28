package com.commodity.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.type.NumericBooleanType;
import org.json.JSONArray;

import com.commodity.model.ComService;
import com.commodity.model.ComVO;
import com.mysql.cj.Session;

/**
 * Servlet implementation class ComServlet
 */
@WebServlet("/ComServlet")
@MultipartConfig
public class ComServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if("listComByName".equals(action)) {
			String[] searchText = new String[1];
			searchText[0] = request.getParameter("searchText");
			String columnName = request.getParameter("columnName");
			
			LinkedHashMap<String, String[]> map = new LinkedHashMap<String, String[]>();
			map.put(columnName, searchText);
			ComService comSvc = new ComService();
			List<ComVO> list = comSvc.getAll(map);
			if(list.size()==0) {
				String jsonStr = "0";
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
			}else {
				String jsonStr = new JSONArray(list).toString();
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
			}
		}
		
		
		//來自comSelectPage.jsp的請求處理
		if("getOne_For_Display".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String str = request.getParameter("comID");
				if(str == null || (str.trim()).length()==0) {
					errorMsgs.add("請輸入商品編號");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/comSelectPage.jsp");
					failureView.forward(request, response);
					return;
				}
				
				int comID = 0;
				try {
					comID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("編號格式不正確");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/comSelectPage.jsp");
					failureView.forward(request, response);
					return;
				}
				
				//*************開始查詢資料*********************
				ComService comSvc = new ComService();
				ComVO comVO = comSvc.getOneCom(comID);
				if(comVO == null) {
					errorMsgs.add("查無資料");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/comSelectPage.jsp");
					failureView.forward(request, response);
					return;
				}
				
				//********查詢完成，準備轉交*********
				request.setAttribute("comVO", comVO);
				String url = "/back_end/commodity/listOneCom.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/comSelectPage.jsp");
				failureView.forward(request, response);
			}
		}
		
//		String url =request.getParameter("requestURL");
//		if (url!=null &&url.length()!=0) {
//			url+="?action=getOne_For_Update&comcID=";
//			url+=request.getParameter("comID");
//		}else {
//			url = "/back_end/commodity/updateCom.jsp";
//		}
		if("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//*********接收請求參數*********
				int comID = new Integer(request.getParameter("comID"));
				//*********開始查詢資料*********
				ComService comSvc = new ComService();
				ComVO comVO = comSvc.getOneCom(comID);
				//*********查詢完成準備轉交*********
				request.setAttribute("comVO", comVO);
				String url = "/back_end/commodity/updateCom.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				//*********可能的錯誤處理*********
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/listAllCom.jsp");
				failureView.forward(request, response);
			}
			
		}
		
		//來自updateCom.jsp的請求
		if("update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			//*********接收請求參數*********
			try {
				
				int comID = Integer.parseInt(request.getParameter("comID").trim());		
				String comName = request.getParameter("comName").trim();
				if(comName == null || comName.trim().length()==0) {
					errorMsgs.add("員工姓名，請勿空白");
				}
				
				int comPrice = 0;
				try {
					comPrice = Integer.parseInt(request.getParameter("comPrice").trim());
				} catch (NumberFormatException e) {
					comPrice = 0;
					errorMsgs.add("價格請填數字");
				}
				
				byte[] comPicture = null;
				Part part = request.getPart("upfile1");
				
				
					try {
						InputStream is = part.getInputStream();
						
						comPicture = new byte[is.available()];
						is.read(comPicture);
						is.close();
	
					} catch (Exception e) {
						errorMsgs.add("圖片上傳失敗");
					}
				
				String comContent = request.getParameter("comContent").trim();
				int comStatus = Integer.parseInt(request.getParameter("comStatus").trim());
				int comWeight = Integer.parseInt(request.getParameter("comWeight").trim());
				String comUnit = request.getParameter("comUnit").trim();
				float comCal = Float.parseFloat(request.getParameter("comCal").trim());
				float comCarb = Float.parseFloat(request.getParameter("comCarb").trim());
				float comPro = Float.parseFloat(request.getParameter("comPro").trim());
				float comFat = Float.parseFloat(request.getParameter("comFat").trim());
				String comProp = request.getParameter("comProp").trim();

				
				ComVO comVO = new ComVO();
				comVO.setComID(comID);
				comVO.setComName(comName);
				comVO.setComPrice(comPrice);
				comVO.setComPicture(comPicture);
				comVO.setComContent(comContent);
				comVO.setComStatus(comStatus);
				comVO.setComWeight(comWeight);
				comVO.setComUnit(comUnit);
				comVO.setComCal(comCal);
				comVO.setComCarb(comCarb);
				comVO.setComPro(comPro);
				comVO.setComFat(comFat);
				comVO.setComProp(comProp);
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/updateCom.jsp");
					failureView.forward(request, response);
					return;
				}
				
				//*******開始修改資料*******
				ComService comSvc = new ComService();
				comVO = comSvc.updateCom(comName, comPrice, comPicture, comContent, 
						comStatus, comWeight, comUnit, comCal, comCarb, comPro, comFat, comProp, comID);
				//*******修改完成準備轉交********
				request.setAttribute("comVO", comVO);
				String url = "/back_end/commodity/listAllCom.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				e.getStackTrace();
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/updateCom.jsp");
				failureView.forward(request, response);
			}
			
			
		}
		
		//來自addCom.jsp的請求
		if("insert".equals(action)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String, String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				int comcID = Integer.parseInt(request.getParameter("comcID"));
				String comName = request.getParameter("comName");
				String comNameReg = "^[A-z\\W]{2,30}$";
				if(comName == null || comName.trim().length()==0) {
					errorMsgs.put("comName","商品名稱請勿空白");
				} else if (!comName.matches(comNameReg)) {
					errorMsgs.put("comName","長度需在2到10間(只能英文或中文)");
				}
				ComService confirm = new ComService();
				List<ComVO> list = confirm.getAll();
				for(ComVO comVO:list) {
					if (comName.equals(comVO.getComName())) {
						errorMsgs.put("comName","商品名稱重複");
					}
				}
				int comPrice = 0;
				try {
					comPrice = Integer.parseInt(request.getParameter("comPrice"));
					if (comPrice < 0) {
						comPrice = 0;
						errorMsgs.put("comPrice","價格請勿小於0");
					}
				} catch (NumberFormatException e) {
					errorMsgs.put("comPrice","價格請填數字");
				}
				
				byte[] comPicture =null;
				

				Part part = request.getPart("upfile1");
				if(part.getSize()==0) {
					errorMsgs.put("comPicture", "請上傳圖片!");
				}
				InputStream is = part.getInputStream();
				comPicture = new byte[is.available()];
				is.read(comPicture);
				is.close();

				byte[] comPicture2 =null;				
				String comContent = request.getParameter("comContent");

				int comStatus = 0;
				try {
					comStatus = Integer.parseInt(request.getParameter("comStatus"));
				} catch (NumberFormatException e) {
					errorMsgs.put("comStatus","狀態請填數字");
				}
				
				int comWeight = 0;
				try {
					comWeight = Integer.parseInt(request.getParameter("comWeight"));
					if (comWeight < 0) {
						comWeight = 0;
						errorMsgs.put("comWeight","重量請勿小於0");
					}
				} catch (NumberFormatException e) {
					errorMsgs.put("comWeight","重量請填數字");
				}
				
				String comUnit = request.getParameter("comUnit");
				float comCal = 0;
				try {
					comCal = Float.parseFloat(request.getParameter("comCal"));
					if (comCal < 0) {
						comCal = 0;
						errorMsgs.put("comCal","熱量請勿小於0");
					}
				} catch (NumberFormatException e) {
					errorMsgs.put("comCal","熱量請填數字");
				}
				float comCarb = 0;
				try {
					comCarb =Float.parseFloat(request.getParameter("comCarb"));
					if (comCarb < 0) {
						comCarb = 0;
						errorMsgs.put("comCarb","請勿小於0");
					}
				} catch (NumberFormatException e) {
					errorMsgs.put("comCarb","碳水請填數字");
				}
				float comPro = 0;
				try {
					comPro =Float.parseFloat(request.getParameter("comPro"));
					if (comPro < 0) {
						comPro = 0;
						errorMsgs.put("comPro","蛋白質請勿小於0");
					}
				} catch (NumberFormatException e) {
					errorMsgs.put("comPro","蛋白質請填數字");
				}
				
				float comFat = 0;
				try {
					comFat =Float.parseFloat(request.getParameter("comFat"));
					if (comFat < 0) {
						comFat = 0;
						errorMsgs.put("comFat","脂肪請勿小於0");
					}
				} catch (NumberFormatException e) {
					errorMsgs.put("comFat","脂肪請填數字");
				}
				String comProp = "";
				
				ComVO comVO = new ComVO();
				comVO.setComcID(comcID);
				comVO.setComName(comName);
				comVO.setComPrice(comPrice);
				comVO.setComPicture(comPicture);
				comVO.setComPicture2(comPicture2);
				comVO.setComContent(comContent);
				comVO.setComStatus(comStatus);
				comVO.setComWeight(comWeight);
				comVO.setComUnit(comUnit);
				comVO.setComCal(comCal);
				comVO.setComCarb(comCarb);
				comVO.setComPro(comPro);
				comVO.setComFat(comFat);
				comVO.setComProp(comProp);
				
				
				if(!errorMsgs.isEmpty()) {
					request.setAttribute("comVO",comVO);
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/addCom.jsp");
					failureView.forward(request, response);
					return;
				}
				//*****開始新增資料*****
				ComService comSvc = new ComService();
				comVO = comSvc.addCom(comcID, comName, comPrice, comPicture, comContent, comStatus, 
						comWeight, comUnit, comCal, comCarb, comPro, comFat, comProp, comPicture2);
				//*****新增完成，準備轉交*****
				String url ="/back_end/commodity/listAllCom.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
				
			} catch (Exception e) {
				errorMsgs.put("errorMsg",e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/addCom.jsp");
				failureView.forward(request, response);
			}
			
		}
		
		//來自listAllCom.jsp
		if("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				int comID = Integer.parseInt(request.getParameter("comID"));
				ComService comSvc = new ComService();
				comSvc.deleteCom(comID);
				
				String url = "/back_end/commodity/listAllCom.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
				
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/listAllEmp.jsp");
				failureView.forward(request, response);
			}
			
			
		}
		
		//來自comSelectPage.jsp的複合查詢請求
		if("listCom_ByCompositeQuery".equals(action)) {
			
				HttpSession session = request.getSession();//???
				List<String> errorMsgs = new LinkedList<String>();
				request.setAttribute("errorMsgs", errorMsgs);
				String comID = request.getParameter("COM_ID");
				try {
					if((comID.trim()).length() != 0) {
						
						int comI = Integer.parseInt(request.getParameter(comID));
					}
					
				} catch (NumberFormatException e) {
					errorMsgs.add("編號請填數字");
					String url = "/back_end/commodity/comSelectPage.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
				}
				String price =request.getParameter("COM_PRICE");
				String price2 =request.getParameter("COM_PRICE2");
				try {	
					Integer min,max;
					if((price.trim()).length() != 0) {
						min =Integer.parseInt(price);
						if((price2.trim()).length() != 0) {
						max =Integer.parseInt(price2);
							if(min>max) {
								errorMsgs.add("Min,Max大小錯誤");
								String url = "/back_end/commodity/comSelectPage.jsp";
								RequestDispatcher successView = request.getRequestDispatcher(url);
								successView.forward(request, response);
							}
						}
					}
					if((price2.trim()).length() != 0) {
						 max =Integer.parseInt(price2);
						 if((price.trim()).length() != 0) {
							 min =Integer.parseInt(price);
							 if(min>max) {
								errorMsgs.add("Min,Max大小錯誤");
								String url = "/back_end/commodity/comSelectPage.jsp";
								RequestDispatcher successView = request.getRequestDispatcher(url);
								successView.forward(request, response);
								}
						 }
					}
					

				}catch(NumberFormatException e) {
					errorMsgs.add("價格請填入數字");
					String url = "/back_end/commodity/comSelectPage.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
				}
				
				try {
				Map<String, String[]> map = (Map<String, String[]>) session.getAttribute("map");//???
				LinkedHashMap<String, String[]> map1 = new LinkedHashMap<String, String[]>(request.getParameterMap());
				session.setAttribute("map", map1);
				map = map1;
				System.out.println(map);
				ComService comSvc = new ComService();
				List<ComVO> list = comSvc.getAll(map);
				//查詢完成 準備轉交
				request.setAttribute("listCom_ByCompositeQuery", list);
				String url = "/back_end/commodity/listCom_ByCompositeQuery.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		//來自shopSlidebar.jsp的複合查詢請求 akuma0320
		if("listCom_ByCompositeQueryFS".equals(action)) {
			try {
				HttpSession session = request.getSession();//???
				String price =request.getParameter("COM_PRICE");
				String price2 =request.getParameter("COM_PRICE2");
				try {	
					Integer min,max;
					session.removeAttribute("error");
					if((price.trim()).length() != 0) {
						min =Integer.parseInt(price);
						if((price2.trim()).length() != 0) {
						max =Integer.parseInt(price2);
							if(min>max) {
								session.setAttribute("error", "Min,Max大小錯誤");
								String url = "/front_end/commodity/comindex_category.jsp";
								RequestDispatcher successView = request.getRequestDispatcher(url);
								successView.forward(request, response);
							}
						}
					}
					if((price2.trim()).length() != 0) {
						 max =Integer.parseInt(price2);
						 if((price.trim()).length() != 0) {
							 min =Integer.parseInt(price);
							 if(min>max) {
									session.setAttribute("error", "Min,Max大小錯誤");
									String url = "/front_end/commodity/comindex_category.jsp";
									RequestDispatcher successView = request.getRequestDispatcher(url);
									successView.forward(request, response);
								}
						 }
					}
					

				}catch(NumberFormatException e) {
					session.setAttribute("error", "請輸入數字");
					String url = "/front_end/commodity/comindex_category.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
				}
				
				Map<String, String[]> map = (Map<String, String[]>) session.getAttribute("map");//???
				LinkedHashMap<String, String[]> map1 = new LinkedHashMap<String, String[]>(request.getParameterMap());
				session.setAttribute("map", map1);
				map = map1;
				ComService comSvc = new ComService();
				List<ComVO> list = comSvc.getAll(map);
				//查詢完成 準備轉交
				session.setAttribute("category_list", list);
				String url = "/front_end/commodity/comindex_category.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		if("comStatusChange".equals(action)) {
			System.out.println("123");
			Integer comID = Integer.parseInt(request.getParameter("comID"));
			Integer comStatus = Integer.parseInt(request.getParameter("comStatus"));
			if (comStatus==0) {
				comStatus=1;
			}else{
				comStatus=0;
			}
			ComService comSvc=new ComService();
			comSvc.comStatusChange(comID, comStatus);
			String url =request.getParameter("requestURL");
			RequestDispatcher successView =request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		if("comStatusChangeajax".equals(action)) {
			Integer comID = Integer.parseInt(request.getParameter("comID"));
			Integer comStatus = Integer.parseInt(request.getParameter("comStatus"));
			System.out.println(comStatus);
			if (comStatus==0) {
				comStatus=1;
			}else{
				comStatus=0;
			}
			ComService comSvc=new ComService();
			comSvc.comStatusChange(comID, comStatus);
			PrintWriter out = response.getWriter();
			out.print(comStatus);
			out.flush();
			out.close();
		}
		
		
		
		
		
		
		
	}

}

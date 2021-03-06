package com.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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

import org.json.JSONObject;

import com.commodity.model.ComVO;
import com.member.model.MailService;
import com.member.model.MailService2;
import com.member.model.MemService;
import com.member.model.MemVO;
import com.recipe.model.RecVO;

/**
 * Servlet implementation class MemServlet
 */
@WebServlet("/MemServlet")
@MultipartConfig
public class MemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemServlet() {
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
		HttpSession session = request.getSession();
		if("login".equals(action)) {
			Map<String,String> errorMsgs = new LinkedHashMap<String, String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			
			try {
				String memAccount = request.getParameter("memAccount1").trim();
				
				if(memAccount==null || memAccount.trim().length()==0) {
					errorMsgs.put("memAccount","?|???b??????????");
				}
				String memPassword = request.getParameter("memPassword1").trim();
				
				if(memPassword==null||memPassword.trim().length()==0) {
					errorMsgs.put("memPassword","?|???K?X????????");
				}
				
				MemVO memVO = null;
				try {
					MemService memSvc = new MemService();
					memVO = memSvc.getOneMemByAccount(memAccount);
					
					if(memVO.getMemPassword().equals(memPassword)) {
						if (memVO.getMemStatus() == 0) {
							errorMsgs.put("Exception","?z???|???|??????");
						} else if (memVO.getMemStatus() == 2) {
							errorMsgs.put("Exception","?z???|???w???v,???v???]:"+ memVO.getMemStatusR());
						} 
						if(!errorMsgs.isEmpty()) {
							request.setAttribute("memVO", memVO);
							RequestDispatcher failView = request.getRequestDispatcher("/front_end/member/login.jsp");
							failView.forward(request, response);
							return;
						}
						
						session.setAttribute("memVO", memVO);
						String location = (String)session.getAttribute("location");
						if(location!=null) {
//							ComVO comVO = (ComVO)session.getAttribute("comVO");
//							RecVO recVO = (RecVO)session.getAttribute("recVO");
							session.removeAttribute("location");
//							session.removeAttribute("comVO");
//							session.removeAttribute("recVO");
//							request.setAttribute("comVO", comVO);
//							request.setAttribute("recVO", recVO);
							System.out.println(location);
							response.sendRedirect("/CEA102G5"+location);
							return;
						}
						session.removeAttribute("location");
						String url = "/CEA102G5/front_end/commodity/comindex.jsp";
						response.sendRedirect(url);
					}else {
						errorMsgs.put("memPassword","?K?X???~?A?????s???J");
						RequestDispatcher failView = request.getRequestDispatcher("/front_end/member/login.jsp");
						failView.forward(request, response);
					}
				} catch (Exception e) {
					errorMsgs.put("memAccount","?b?????~?A?d?L???H");
					RequestDispatcher failView = request.getRequestDispatcher("/front_end/member/login.jsp");
					failView.forward(request, response);
				}
			} catch (Exception e) {
				errorMsgs.put("exception",e.getMessage());
				RequestDispatcher failView = request.getRequestDispatcher("/front_end/member/login.jsp");
				failView.forward(request, response);
			}
			
			
		}
		
		if("logout".equals(action)) {
			session.removeAttribute("memVO");
//			String location = request.getParameter("location");
//			System.out.println(location);
			String url = "/CEA102G5/front_end/front_end_index.jsp";
			response.sendRedirect(url);
		}
		
		
		if("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				Integer memID = new Integer(request.getParameter("memID"));
				
				MemService memSvc = new MemService();
				
				MemVO memVO = memSvc.getOneMem(memID);
				request.setAttribute("memVO", memVO);
				String url = "/back_end/member/listOneMem.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if("checkAccount".equals(action)) {
			String memAccount = request.getParameter("account");
			MemVO memVO = new MemVO();
			memVO.setMemAccount2(memAccount.toLowerCase());
			
			MemService memSvc = new MemService();
			List<MemVO> list = memSvc.getAll();
			String memAccountReg = "^[(a-zA-Z0-9_)]{2,10}$";
			String result = null;
			if(list.contains(memVO)) {
				result = "isAdded";
			}else if(!memAccount.trim().matches(memAccountReg)){
				result = "error";
			}else {
				result = "OK";
			}
			
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
			
		}
		
		if("insert".equals(action)) {
			Map<String,String> errorMsgs = new LinkedHashMap<String, String>();
			request.setAttribute("errorMsgs2", errorMsgs);
			
			try {
				String memNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				String memAccountReg = "^[(a-zA-Z0-9_)]{2,10}$";
				
				String memName = request.getParameter("memName");
				if(memName == null || memName.trim().length()==0) {
					errorMsgs.put("memName","?|???W??????????");
				}else if(!memName.trim().matches(memNameReg)) {
					errorMsgs.put("memName","?????????b2~10????");
				}
				
				String memAccount = request.getParameter("memAccount");
				if(memAccount==null || memAccount.trim().length()==0) {
					errorMsgs.put("memAccount2","?|???b??????????");
				}else if(!memAccount.trim().matches(memAccountReg)) {
					errorMsgs.put("memAccount2","?????????b2~10????");
				}

				
				
				String memPassword = request.getParameter("memPassword");
				if(memPassword==null||memPassword.trim().length()==0) {
					errorMsgs.put("memPassword2","?|???K?X????????");
				}else if(!memPassword.trim().matches(memAccountReg)) {
					errorMsgs.put("memPassword2","?????????b2~10????");
				}
				
				String memPhoneReg = "^[(0-9)]{2,11}$";
				String memPhone = request.getParameter("memPhone");
				if(memPhone==null||memPhone.trim().length()==0) {
					errorMsgs.put("memPhone","?|???q??????????");
				}else if(!memPhone.trim().matches(memPhoneReg)) {
					errorMsgs.put("memPhone","?|???q???u???O???r?A?B?????????b2~11????");
				}
				String memEmail = request.getParameter("memEmail");
				if(memEmail==null||memEmail.trim().length()==0) {
					errorMsgs.put("memEmail","?|??Email????????");
				}
				
				Part part = request.getPart("memUpfile");
				byte[] memPicture = null;
				
				if(part.getSize()!=0) {
					
				InputStream is = part.getInputStream();
				memPicture = new byte[is.available()];
				is.read(memPicture);
				is.close();
				
				}else {
					errorMsgs.put("memPicture","???W??????");
				}
				String memAccountLower = memAccount.toLowerCase();
				MemVO memVO = new MemVO();
				memVO.setMemName(memName);
				memVO.setMemAccount(memAccount);
				memVO.setMemAccount2(memAccountLower);
				memVO.setMemPassword(memPassword);
				memVO.setMemPhone(memPhone);
				memVO.setMemEmail(memEmail);
				
				MemService memSvc = new MemService();
				List<MemVO> list = memSvc.getAll();
				if(list.contains(memVO)) {
					errorMsgs.put("memAccount2","?|???b??????");
				}
				
				if(!errorMsgs.isEmpty()) {
					request.setAttribute("memVOError", memVO);
					RequestDispatcher failView = request.getRequestDispatcher("/front_end/member/login.jsp");
					failView.forward(request, response);
					return;
				}
				
				
				MemVO newMemVO = memSvc.addMem(memName, memAccount, memPassword, memPhone, memEmail, memPicture);
				
				MailService2 mailSvc = new MailService2();
		        String subject = "?|?????U?????q??";
		        String link = "http://localhost:8081/CEA102G5/front_end/member/mem.do?action=updateStatus&memID="+newMemVO.getMemID();

				mailSvc.sendMail(newMemVO.getMemEmail(), subject, mailSvc.getMessageText(newMemVO.getMemName(),link));
				
				String url = "/CEA102G5/front_end/member/signup1_success_page.jsp";
//				RequestDispatcher successView = request.getRequestDispatcher(url);
//				successView.forward(request, response);
				response.sendRedirect(url);
				
				
				
			} catch (Exception e) {
				
				RequestDispatcher failView = request.getRequestDispatcher("/front_end/member/login.jsp");
				failView.forward(request, response);
			}
			
			
		}
		
		if("getOne_For_Update".equals(action)) {
			
			try {
				Integer memID = new Integer(request.getParameter("memID"));
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(memID);
				
				request.setAttribute("memVO", memVO);
				String url = "/back_end/member/updateMem.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String memNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				String memAccountReg = "^[(a-zA-Z0-9_)]{2,10}$";
				String memName = request.getParameter("memName");
				if (memName == null || memName.trim().length() == 0) {
					errorMsgs.add("?|???W??????????");
				} else if (!memName.trim().matches(memNameReg)) {
					errorMsgs.add("?|???W???u???O???^???r?????r?M_?A?B?????????b2~10????");
				}

				String memPassword = request.getParameter("memPassword");
				if (memPassword == null || memPassword.trim().length() == 0) {
					errorMsgs.add("?|???K?X????????");
				} else if (!memPassword.trim().matches(memAccountReg)) {
					errorMsgs.add("?|???K?X?u???O?^???r?????r?M_?A?B?????????b2~10????");
				}
				String memPhoneReg = "^[(0-9)]{2,11}$";
				String memPhone = request.getParameter("memPhone");
				if (memPhone == null || memPhone.trim().length() == 0) {
					errorMsgs.add("?|???q??????????");
				} else if (!memPhone.trim().matches(memPhoneReg)) {
					errorMsgs.add("?|???q???u???O???r?M?A?B?????????b2~11????");
				}
				String memEmail = request.getParameter("memEmail");
				if (memEmail == null || memEmail.trim().length() == 0) {
					errorMsgs.add("?|??Email????????");
				}
				
				Part part = request.getPart("memUpfile");
				byte[] memPicture = null;
				InputStream is = part.getInputStream();
				memPicture = new byte[is.available()];
				is.read(memPicture);
				is.close();
				
				Integer memID = new Integer(request.getParameter("memID"));
					
					
				MemVO memVO = new MemVO();
				memVO.setMemName(memName);
				memVO.setMemPassword(memPassword);
				memVO.setMemPhone(memPhone);
				memVO.setMemEmail(memEmail);
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("memVO", memVO);
					RequestDispatcher failView = request.getRequestDispatcher("/back_end/member/updateMem.jsp");
					failView.forward(request, response);
				}
				
				MemService memSvc = new MemService();
				memSvc.updateMem(memID, memName, memPassword, memPhone, memEmail, memPicture);
				
				if("front".equals(request.getParameter("where"))) {
					String url = "/front_end/member/frontMemSelect.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
				}else {
					request.setAttribute("memVO", memVO);
					String url = "/back_end/member/listAllMem.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
					
				}
				
				
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failView = request.getRequestDispatcher("/back_end/member/updateMem.jsp");
				failView.forward(request, response);
			}
			
		}
		
		if("updateMemStatus".equals(action)) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String memNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				String memAccountReg = "^[(a-zA-Z0-9_)]{2,10}$";
				String memName = request.getParameter("memName");
				if (memName == null || memName.trim().length() == 0) {
					errorMsgs.put("memName","?|???W??????????");
				} else if (!memName.trim().matches(memNameReg)) {
					errorMsgs.put("memName","?|???W???u???O???^???r?????r?M_?A?B?????????b2~10????");
				}

				String memPassword = request.getParameter("memPassword");
				if (memPassword == null || memPassword.trim().length() == 0) {
					errorMsgs.put("memPassword","?|???K?X????????");
				} else if (!memPassword.trim().matches(memAccountReg)) {
					errorMsgs.put("memPassword","?|???K?X?u???O?^???r?????r?M_?A?B?????????b2~10????");
				}
				String memPhoneReg = "^[(0-9)]{2,11}$";
				String memPhone = request.getParameter("memPhone");
				if (memPhone == null || memPhone.trim().length() == 0) {
					errorMsgs.put("memPhone","?|???q??????????");
				} else if (!memPhone.trim().matches(memPhoneReg)) {
					errorMsgs.put("memPhone","?|???q???u???O???r?M?A?B?????????b2~11????");
				}
				String memEmail = request.getParameter("memEmail");
				if (memEmail == null || memEmail.trim().length() == 0) {
					errorMsgs.put("memEmail","?|??Email????????");
				}
				
				Integer memID = new Integer(request.getParameter("memID"));
				
				String memStatusR = new String(request.getParameter("memStatusR"));
				
				byte[] memPicture = null;
				MemService memSvc = new MemService();
				try {
					Part part = request.getPart("memUpfile");
					if (part.getSize() != 0) {
						InputStream is = part.getInputStream();
						memPicture = new byte[is.available()];
						is.read(memPicture);
						is.close();
					} else {
						MemVO memVO = memSvc.getOneMem(memID);
						memPicture = memVO.getMemPicture();
						memVO.setMemPicture(memPicture);
					}
				} catch (Exception e) {
					errorMsgs.put("memPicture","?????X???D");
				}
				
				
				
//System.out.println(memStatusR);						

				MemVO memVO = new MemVO();
				memVO.setMemName(memName);
				memVO.setMemPassword(memPassword);
				memVO.setMemPhone(memPhone);
				memVO.setMemEmail(memEmail);
				memVO.setMemStatusR(memStatusR);
				
//System.out.println(memStatusR);				
				
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("memVO", memVO);
					RequestDispatcher failView = request.getRequestDispatcher("/back_end/member/updateMem.jsp");
					failView.forward(request, response);
				}
				
				
				memSvc.updateMemStatus(memID, memName, memPassword, memPhone, memEmail, memPicture, memStatusR);
				
				
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("memVO", memVO);
					RequestDispatcher failView = request.getRequestDispatcher("/back_end/member/updateMem.jsp");
					failView.forward(request, response);
				}

					request.setAttribute("memVO", memVO);
					String url = "/back_end/member/listAllMem.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);				
				
			} catch (Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				RequestDispatcher failView = request.getRequestDispatcher("/back_end/member/updateMem.jsp");
				failView.forward(request, response);
			}
			
		}
		
		
		if("forget".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String memAccount = request.getParameter("memAccount").trim();
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMemByAccount(memAccount);
				
				MailService mailSvc = new MailService();
				String subject = "?s?K?X?????q??";
				String password = mailSvc.getPassword();
				
				memSvc.updateMemPassword(password, memVO.getMemID());
				
				mailSvc.sendMail(memVO.getMemEmail(), subject, mailSvc.getMessageText(memVO.getMemName(),password));
				
				String success = "?????H?w???\?H?X!!!";
				request.setAttribute("success", success);
				String url = "/front_end/member/forget_success_page.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				errorMsgs.add("?b???d?L???H");
				RequestDispatcher failView = request.getRequestDispatcher("/front_end/member/forgetPw.jsp");
				failView.forward(request, response);
			}
		}
		
		if("getMemByAjax".equals(action)) {
			Integer memID = new Integer(request.getParameter("memID"));
			MemService memSvc = new MemService();
			MemVO memVO = memSvc.getOneMem(memID);
			String jsonStr = new JSONObject(memVO).toString();
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
		}
		
		if ("updateStatus".equals(action)) { // ?????????D

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			try {
		
			Integer memID = new Integer(request.getParameter("memID"));
			
				MemVO memVO = new MemVO();	
								
				memVO.setMemStatus(1);
				memVO.setMemID(memID);				
//System.out.println(memVO);									
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("memVO", memVO); 
					RequestDispatcher failureView = request.getRequestDispatcher("/front_end/member/login.jsp");
					failureView.forward(request, response);
					return;
				}				
				MemService memSvc = new MemService();	
//System.out.println(memVO);
				 memSvc.updateStatus(memVO);
				
//System.out.println(memVO);
			
				String url = "/front_end/member/signup2_success_page.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // login_success.jsp
				successView.forward(request, response);
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/front_end/member/login.jsp");
				failureView.forward(request, response);
			}

		}
		
		
		if ("updateStatus1".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			
			request.setAttribute("errorMsgs", errorMsgs);

			try {
	
			Integer memID = new Integer(request.getParameter("memID"));
			
				MemVO memVO = new MemVO();	
								
				memVO.setMemStatus(1);
				memVO.setMemID(memID);
				
//System.out.println(memVO);		
				
				
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("memVO", memVO); 
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/member/memSelect.jsp");
					failureView.forward(request, response);
					return;
				}		
				MemService memSvc = new MemService();	
				
//System.out.println(memVO);
				
				 memSvc.updateStatus(memVO);
				
//System.out.println(memVO);
			
				String url = "/back_end/member/listAllMem.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // login_success.jsp
				successView.forward(request, response);	

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/member/memSelect.jsp");
				failureView.forward(request, response);
			}
			
			

		}
		
		if ("stopStatus".equals(action)) { // ?????????D

			List<String> errorMsgs = new LinkedList<String>();
		
			request.setAttribute("errorMsgs", errorMsgs);

			try {
			Integer memID = new Integer(request.getParameter("memID"));
			
				MemVO memVO = new MemVO();	
								
				memVO.setMemStatus(2);
				memVO.setMemID(memID);
				
//System.out.println(memVO);						
			
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("memVO", memVO); 
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/member/memSelect.jsp");
					failureView.forward(request, response);
					return;
				}		
				
				MemService memSvc = new MemService();	
				
//System.out.println(memVO);
				
				 memSvc.updateStatus(memVO);
				
//System.out.println(memVO);
		
				String url = "/back_end/member/listAllMem.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // login_success.jsp
				successView.forward(request, response);			

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/member/memSelect.jsp");
				failureView.forward(request, response);
			}

		}
		
		if ("listmem_ByCompositeQuery".equals(action)) { // ????select_page.jsp?????X?d?????D
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				
				/***************************1.?N???J????????Map**********************************/ 
				//????Map<String,String[]> getParameterMap()?????k 
				//?`?N:an immutable java.util.Map 
				//Map<String, String[]> map = req.getParameterMap();
//				HttpSession session = request.getSession();
				Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
				if (request.getParameter("whichPage") == null){
					HashMap<String, String[]> map1 = new HashMap<String, String[]>(request.getParameterMap());
					session.setAttribute("map",map1);
					map = map1;
				} 
				
				/***************************2.?}?l???X?d??***************************************/
				MemService memSvc = new MemService();
				List<MemVO> list  = memSvc.newgetAll(map);
//System.out.println(list);				
				/***************************3.?d??????,????????(Send the Success view)************/
				request.setAttribute("listmem_ByCompositeQuery", list); // ?????w???X??list????,?s?Jrequest
				RequestDispatcher successView = request.getRequestDispatcher("/back_end/member/listAllMem_ByCompositeQuery.jsp"); // ???\????listEmps_ByCompositeQuery.jsp
				successView.forward(request, response);
			
				/***************************???L?i???????~?B?z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/member/memSelect.jsp");
				failureView.forward(request, response);
			}
		}
		
		
	}

}

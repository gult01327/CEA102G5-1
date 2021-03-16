package com.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.cart.model.CartService;
import com.cart.model.CartVO;
import com.commodity.model.ComService;
import com.commodity.model.ComVO;
import com.member.model.MemVO;
import com.mysql.cj.xdevapi.JsonArray;
import com.recipe.model.RecService;
import com.recipe.model.RecVO;


/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		System.out.println(action);
		HttpSession session = request.getSession();
		
		if("getAllCombyMemID".equals(action)) {
			Integer memID = new Integer(request.getParameter("memID"));
			System.out.println(memID);
			CartService cartSvc = new CartService();
			List<CartVO> list = cartSvc.getAllByMemID(memID);
			String jsonStr = new JSONArray(list).toString();
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
		}
		
		if("getOne_For_Cart".equals(action)) {
			
			try {
				int comID = Integer.parseInt(request.getParameter("comID"));
				ComService comSvc = new ComService();
				ComVO comVO = comSvc.getOneCom(comID);
				request.setAttribute("comVO", comVO);
				String url = "/front_end/commodity/listOneCom_Cart.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		if("ADD".equals(action)) {
			Object memVO = session.getAttribute("memVO");
			String location = request.getParameter("location");
			Integer comID = new Integer(request.getParameter("comID"));
			ComService comSvc = new ComService();
			
			
			if(memVO==null) {
				ComVO comVO = comSvc.getOneCom(comID);
				session.setAttribute("comVO", comVO);
				session.setAttribute("location", location);
				response.sendRedirect(request.getContextPath()+"/front_end/member/login.jsp");
				return;
			}
			
			try {
				MemVO memVO2 = (MemVO)memVO;
				
				//��X�ʪ���table���Ҧ�VO�ˬd�O�_��comID���ƪ�
				CartService cartSvc = new CartService();
				Integer memID = memVO2.getMemID();
				List list = cartSvc.getAllByMemID(memID);
				//�ŧi�@��VO�N�ȥ]�˶i�h�P�_���X���O�_���@�˪�����
				CartVO cartVO = new CartVO();
				
				Integer cardCount = new Integer(request.getParameter("cardCount"));
				cartVO.setComID(comID);
				cartVO.setMemID(memID);
				cartVO.setCardCount(cardCount);
				if (list.contains(cartVO)) {
					//�p�G�����ƪ��I�sservice update���count
					CartVO inCartVO = (CartVO) list.get(list.indexOf(cartVO));
					Integer addCount = inCartVO.getCardCount() + cartVO.getCardCount();
					CartVO newCartVO = cartSvc.updateCart(comID, addCount,memID);
					
//					ComVO comVO = comSvc.getOneCom(comID);
//					request.setAttribute("comVO", comVO);
//					String url = "/front_end/commodity/listOneCom_Cart.jsp";
//					RequestDispatcher successView = request.getRequestDispatcher(url);
//					successView.forward(request, response);
				} else {
					//�p�G�S�����ƪ��I�sservice insert���J�@�����
					CartVO newCartVO = cartSvc.addCart(memID, comID, cardCount);
//					ComVO comVO = comSvc.getOneCom(comID);
//					request.setAttribute("comVO", comVO);
//					String url = "/front_end/commodity/listOneCom_Cart.jsp";
//					RequestDispatcher successView = request.getRequestDispatcher(url);
//					successView.forward(request, response);
				} 
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		if("delete_Cart".equals(action)) {
			try {
				Integer memID = new Integer(request.getParameter("memID"));
				Integer comID = new Integer(request.getParameter("comID"));
				CartService cartSvc = new CartService();
				cartSvc.deleteCart(memID,comID);
				List<CartVO> list = cartSvc.getAllByMemID(memID);
				Integer size = list.size();
				PrintWriter out = response.getWriter();
				out.print(size);
				out.flush();
				out.close(); 
				
//				String url = "/front_end/commodity/listAllCart.jsp";
//				RequestDispatcher successView = request.getRequestDispatcher(url);
//				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if("CHECKOUT".equals(action)) {
			try {
				MemVO memVO = (MemVO)session.getAttribute("memVO");
				
				//���checkbox��comID���@��String�}�C�A�j�নInteger�}�C
				String[] arr = request.getParameterValues("checkComID");
				Integer[] checkComID =new Integer[arr.length];
				for(int i = 0 ;i<checkComID.length;i++) {
					checkComID[i] = Integer.parseInt(arr[i]);
				}
				//���memID�Ҧ�������^�Ƕ��X
				CartService cartSvc = new CartService();
				List<CartVO> list = cartSvc.getAllByMemID(memVO.getMemID());
				
				
				//�B�z�`���B=�ӫ~���*�ӫ~�ƶq
				int total = 0;
				ComService comSvc = new ComService();
				//�ǳƤ@�ӷs��list�N�襤��comID�s�J
				List<CartVO> checkOutList = new ArrayList<CartVO>();
				//���Nlist�������󭡥N�A�b�Τ@�Ӱj����襤��comID���`���B�[�`
				for (int i = 0; i < list.size(); i++) {
					CartVO cartVO = list.get(i);
					for(int j = 0 ; j < checkComID.length;j++) {
						if(cartVO.getComID() == checkComID[j]) {
							int counts = cartVO.getCardCount();
							ComVO comVO = comSvc.getOneCom(cartVO.getComID());
							int price = comVO.getComPrice();
							total += (counts * price);		
							checkOutList.add(cartVO);
						}
					}
				}
				String amount = String.valueOf(total);
				session.setAttribute("amount", amount);
				session.setAttribute("checkOutList", checkOutList);
				String url = "/front_end/commodity/Checkout.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if("minusCount".equals(action)) {
			try {
				Integer comID = new Integer(request.getParameter("comID"));

				Integer cardCount = new Integer(request.getParameter("cardCount"));
				MemVO memVO = (MemVO)session.getAttribute("memVO");
				Integer memID = memVO.getMemID();
				CartService cartSvc = new CartService();
				CartVO cartVO = cartSvc.updateCart(comID, cardCount-1,memID);
				PrintWriter out = response.getWriter();
				out.print("123");
				out.flush();
				out.close();
				
//				String url = "/front_end/commodity/listAllCart.jsp";
//				RequestDispatcher successView = request.getRequestDispatcher(url);
//				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		if("plusCount".equals(action)) {
			try {
				Integer comID = new Integer(request.getParameter("comID"));
				Integer cardCount = new Integer(request.getParameter("cardCount"));
				Integer memID = new Integer(request.getParameter("memID"));
				CartService cartSvc = new CartService();
				cartSvc.updateCart(comID, cardCount + 1,memID);
				PrintWriter out = response.getWriter();
				out.print(cardCount++);
				out.flush();
				out.close();
//				String url = "/front_end/commodity/listAllCart.jsp";
//				RequestDispatcher successView = request.getRequestDispatcher(url);
//				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if("addCartfromRecipe".equals(action)) {
			Object memVO = session.getAttribute("memVO");
			String location = request.getParameter("location");
			Integer recID = new Integer(request.getParameter("recID"));
			String[] arr = request.getParameterValues("comIDForCarts");
			System.out.println(location);
			System.out.println(Arrays.toString(arr));
			System.out.println(recID);
			if(memVO == null) {
				RecService recSvc = new RecService();
				RecVO recVO = recSvc.getOneRec(recID);
				session.setAttribute("recVO", recVO);
				session.setAttribute("location", location);
				String str = "0";
				PrintWriter out = response.getWriter();
				out.print(str);
				out.flush();
				out.close();
				
			}else {
				MemVO memVO2 = (MemVO) memVO;
				Integer memID = memVO2.getMemID();
				Integer[] comIDArr = new Integer[arr.length];
				for(int i = 0 ; i<comIDArr.length;i++) {
					comIDArr[i] = Integer.parseInt(arr[i]);
				}
				CartService cartSvc = new CartService();
				List<CartVO> list = cartSvc.getAllByMemID(memID);
				CartVO cartVO = null;
				for(int i = 0 ; i<comIDArr.length;i++) {
					cartVO = new CartVO();
					cartVO.setComID(comIDArr[i]);
					cartVO.setMemID(memID);
					
					//�Y�ʪ��������ۦP����
					if(list.contains(cartVO)) {
						CartVO inCartVO = list.get(list.indexOf(cartVO));
						Integer addCount = inCartVO.getCardCount() + 1;
						cartSvc.updateCart(inCartVO.getComID(), addCount, inCartVO.getMemID());
						
						
					}else {
						cartSvc.addCart(cartVO.getMemID(), cartVO.getComID(), 1);
					}
				}
				Integer count = comIDArr.length;
				PrintWriter out = response.getWriter();
				out.print(count);
				out.flush();
				out.close();
				
			}
	}

	}
}

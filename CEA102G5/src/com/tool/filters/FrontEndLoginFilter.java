package com.tool.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FrontEndLoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request; 
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		Object account = session.getAttribute("memVO");                  
		if (account == null) {
			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath()+"/front_end/member/login.jsp");
			return;
	    }else{
	    	chain.doFilter(request, response);
	    }
		
	}

}

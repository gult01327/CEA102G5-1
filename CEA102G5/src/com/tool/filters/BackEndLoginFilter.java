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

public class BackEndLoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		Object admiVO = session.getAttribute("admiVO");
		Object coaVO = session.getAttribute("coaVO");
		if (admiVO == null && coaVO == null) {
			res.sendRedirect(req.getContextPath()+"/back_end/back_end_login.jsp");
			return;
	    }else{
	    	chain.doFilter(request, response);
	    }
		
	}

}

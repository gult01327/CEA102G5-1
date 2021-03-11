package com.coach_talent.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.coach_talent.model.CoatService;
import com.coach_talent.model.CoatVO;

import com.talent.model.TalService;
import com.talent.model.TalVO;

public class CoatServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		if ("searchForAddLesson".equals(action)) {
			try {
				Set<TalVO> talSet = null;
				Integer coaID = new Integer(req.getParameter("coaID"));
				//Âà¥æservice
				CoatService coatSvc = new CoatService();
				List<CoatVO> coatList =coatSvc.getByCoach(coaID);
				TalService talSvc = new TalService();
				talSet = new LinkedHashSet<TalVO>();
				for(CoatVO coatVO:coatList) {
					talSet.add(talSvc.getTalent(coatVO.getTalID()));
				}
				String jsonStr = new JSONArray(talSet).toString();
				out.print(jsonStr);
				out.flush();
				out.close();
				return;
			} catch (Exception e) {
				out.print(e.getMessage());
			}
		}

	}

}

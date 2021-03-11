package com.exp.model;

import java.util.List;

public class ExpService {
	ExpDAO_interface dao = null;
	public ExpService() {
		dao = new ExpDAO();
	}

	public void addExpContent (Integer coaID,List<String> expContent) {
		for(int i = 0 ; i < expContent.size() ; i++) {
			ExpVO expVO = new ExpVO();
			expVO.setCoaID(coaID);
			expVO.setExpContent(expContent.get(i));
			dao.insert(expVO);
		}
	}
	
	public void delExpContent(Integer coaID,List<String> expContent) {
		for(int i = 0 ; i < expContent.size() ; i++) {
			ExpVO expVO = new ExpVO();
			expVO.setCoaID(coaID);
			expVO.setExpContent(expContent.get(i));
			dao.deleteByCoach(coaID);;
		}
		
		
	}
	
	public List<ExpVO> getByCoach(Integer coaID) {
		return dao.getByCoach(coaID);
	}
}

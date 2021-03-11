package com.coach_talent.model;

import java.util.List;

public class CoatService {
	CoatDAO_interface dao = null;
	
	public CoatService() {
		dao = new CoatDAO();
	}
	
	public List<CoatVO> getAll() {
		return dao.getAll();
	}
	
	public List<CoatVO> getByCoach (Integer coaID) {
		return dao.getByCoach(coaID);
	}
	
	public void delCoat(Integer coaID,Integer[] talID) {
		for (int i = 0 ; i < talID.length; i ++) {
			CoatVO coatVO = new CoatVO(); 
			coatVO.setCoaID(coaID);
			coatVO.setTalID(talID[i]);
			dao.delete(coatVO);
		}
	}
	
	public void addCoat (Integer coaID,Integer[] talID) {
		for (int i = 0 ; i < talID.length; i ++) {
			CoatVO coatVO = new CoatVO(); 
			coatVO.setCoaID(coaID);
			coatVO.setTalID(talID[i]);
			dao.insert(coatVO);
		}
	}
}

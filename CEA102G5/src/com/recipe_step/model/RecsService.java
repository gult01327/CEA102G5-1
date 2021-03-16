package com.recipe_step.model;

import java.util.List;

public class RecsService {
private RecsDAO_interface dao;
	
	public RecsService() {
		dao = new RecsDAO();
	}
	
	public List<RecsVO> getAllStepsByRecID(Integer recID){
		
		return dao.getAllStepsByRecID(recID);
	}
	
	public RecsVO getOneByRecsID(Integer recsID) {
		return dao.findByRecsID(recsID);
	}

}

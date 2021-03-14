package com.recipe_ingredients.model;

import java.util.List;

public class ReciService {
	private ReciDAO_interface dao;
	
	public ReciService() {
		dao = new ReciDAO();
	}
	
	public List<ReciVO> getIngsByRecID(Integer recID){
		
		return dao.getIngsByRecID(recID);
	}

}

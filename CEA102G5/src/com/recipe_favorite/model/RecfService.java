package com.recipe_favorite.model;

import java.util.List;

public class RecfService {
	private RecfDAO_interface dao;
	
	public RecfService() {
		dao = new RecfDAO();
	}
	
	public void addFavorite(Integer memID,Integer recID) {
		dao.insertByMemID(memID, recID);
	}
	
	public void deleteFavorite(Integer memID,Integer recID) {
		dao.deleteByMemIDRecID(memID, recID);
	}
	public List<RecfVO> getAllByMemID(Integer memID){
		return dao.getAllByMemID(memID);
	}
	

}

package com.recipe_favorite.model;

import java.util.List;

public interface RecfDAO_interface {
	
	public void insertByMemID(Integer memID,Integer recID);
	public void deleteByMemIDRecID(Integer memID,Integer recID);
	public List<RecfVO> getAllByMemID(Integer memID);

}

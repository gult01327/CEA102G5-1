package com.recipe_ingredients.model;

import java.sql.Connection;
import java.util.List;

public interface ReciDAO_interface {
	
	public void insertReci(ReciVO reciVO,Connection con);
	public List<ReciVO> getIngsByRecID(Integer recID);
	public void deleteByRecID(Integer recID,Connection con);

}

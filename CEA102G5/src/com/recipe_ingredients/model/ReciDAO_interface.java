package com.recipe_ingredients.model;

import java.sql.Connection;

public interface ReciDAO_interface {
	
	public void insertReci(ReciVO reciVO,Connection con);

}

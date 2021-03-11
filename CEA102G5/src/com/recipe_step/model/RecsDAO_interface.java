package com.recipe_step.model;

import java.sql.Connection;

public interface RecsDAO_interface {
	
	public void insertRecs(RecsVO recsVO,Connection con);

}

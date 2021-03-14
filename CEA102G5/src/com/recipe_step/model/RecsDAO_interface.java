package com.recipe_step.model;

import java.sql.Connection;
import java.util.List;

public interface RecsDAO_interface {
	
	public void insertRecs(RecsVO recsVO,Connection con);
	public List<RecsVO> getAllStepsByRecID(Integer recID);
	public RecsVO findByRecsID(Integer recsID);
	public void deleteByRecID(Integer recID,Connection con);

}

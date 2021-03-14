package com.recipe_board.model;

import java.util.List;

public interface RecbDAO_interface {
	public RecbVO insertMsg(RecbVO recbVO);
	public List<RecbVO> getAllByRecID(Integer recID);
	public void deleteByRecbID(Integer recbID);
}

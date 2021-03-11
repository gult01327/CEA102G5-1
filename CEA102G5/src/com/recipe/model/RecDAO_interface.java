package com.recipe.model;

import java.util.List;
import java.util.Map;

import com.recipe_ingredients.model.ReciVO;
import com.recipe_step.model.RecsVO;


public interface RecDAO_interface {
	public void insertWithReciRecs(RecVO recVO,List<ReciVO> reciList,List<RecsVO> recsList);
    public void update(RecVO recVO);
    public void delete(Integer recID);
    public RecVO findByPrimaryKey(Integer recID);
    public List<RecVO> getAll();
    public List<RecVO> getAllByMemID(Integer memID);
    //萬用複合查詢
    public List<RecVO> getAll(Map<String,String[]> map);
}

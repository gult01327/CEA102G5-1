package com.exp.model;

import java.util.List;

public interface ExpDAO_interface {
	
	public void insert(ExpVO expVO);
    public void update(ExpVO expVO);
    public void delete(Integer expID);
    public void deleteByCoach(Integer coaID);
    public ExpVO findByID(Integer expID);
    public List<ExpVO> getByCoach(Integer coaID);
    public List<ExpVO> getAll();

}

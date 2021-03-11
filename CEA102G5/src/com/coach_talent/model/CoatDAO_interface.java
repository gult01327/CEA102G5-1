package com.coach_talent.model;

import java.util.List;

public interface CoatDAO_interface {
	
	public void insert(CoatVO coatVO);
    public void delete(CoatVO coatVO);
    public List<CoatVO> getByCoach(Integer coaID);
    public List<CoatVO> getAll();

}

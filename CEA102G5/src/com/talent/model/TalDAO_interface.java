package com.talent.model;

import java.util.Set;

public interface TalDAO_interface {
	public void insert(TalVO talVO);
    public void update(TalVO talVO);
    public void delete(Integer talID);
    public TalVO findByID(Integer talID);
    public Set<TalVO> getAll();
}
